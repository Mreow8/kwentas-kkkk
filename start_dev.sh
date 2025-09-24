#!/bin/bash

# Colors for output
GREEN='\033[0;32m'
BLUE='\033[0;34m'
RED='\033[0;31m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

echo -e "${BLUE}Starting KwentasKlaras Development Environment...${NC}"

# Function to detect OS
detect_os() {
    case "$(uname -s)" in
        Darwin*)    echo 'mac';;
        Linux*)     echo 'linux';;
        *)         echo 'unknown';;
    esac
}

OS=$(detect_os)

# Install gcloud if not installed
if ! command -v gcloud &> /dev/null; then
    echo -e "${YELLOW}Google Cloud SDK (gcloud) is not installed. Installing...${NC}"
    case $OS in
        'mac')
            if command -v brew &> /dev/null; then
                brew install --cask google-cloud-sdk
            else
                echo -e "${YELLOW}Installing Homebrew first...${NC}"
                /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
                brew install --cask google-cloud-sdk
            fi
            ;;
        'linux')
            # Add the Cloud SDK distribution URI as a package source
            echo "deb [signed-by=/usr/share/keyrings/cloud.google.gpg] https://packages.cloud.google.com/apt cloud-sdk main" | sudo tee -a /etc/apt/sources.list.d/google-cloud-sdk.list
            # Import the Google Cloud public key
            curl https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key --keyring /usr/share/keyrings/cloud.google.gpg add -
            # Update and install the SDK
            sudo apt-get update && sudo apt-get install -y google-cloud-sdk
            ;;
        *)
            echo -e "${RED}Unsupported operating system. Please install Google Cloud SDK manually.${NC}"
            exit 1
            ;;
    esac
fi

# Install cloud-sql-proxy if not installed
if ! command -v cloud-sql-proxy &> /dev/null; then
    echo -e "${YELLOW}Cloud SQL Proxy is not installed. Installing...${NC}"
    case $OS in
        'mac')
            if command -v brew &> /dev/null; then
                brew install cloud-sql-proxy
            else
                echo -e "${YELLOW}Installing Homebrew first...${NC}"
                /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
                brew install cloud-sql-proxy
            fi
            ;;
        'linux')
            # Download the Cloud SQL proxy
            curl -o cloud-sql-proxy https://storage.googleapis.com/cloud-sql-connectors/cloud-sql-proxy/v2.1.2/cloud-sql-proxy.linux.amd64
            # Make the Cloud SQL proxy executable
            chmod +x cloud-sql-proxy
            # Move the Cloud SQL proxy to a directory in your PATH
            sudo mv cloud-sql-proxy /usr/local/bin/
            ;;
        *)
            echo -e "${RED}Unsupported operating system. Please install Cloud SQL Proxy manually.${NC}"
            exit 1
            ;;
    esac
fi

# Check if user is authenticated with gcloud
echo -e "${BLUE}Checking Google Cloud authentication...${NC}"
if ! gcloud auth list --filter=status:ACTIVE --format="get(account)" | grep -q "@"; then
    echo -e "${YELLOW}Not authenticated with Google Cloud. Starting login process...${NC}"
    gcloud auth login
    if [ $? -ne 0 ]; then
        echo -e "${RED}Failed to authenticate with Google Cloud${NC}"
        exit 1
    fi
fi

# Set the correct project
echo -e "${BLUE}Setting Google Cloud project...${NC}"
gcloud config set project kwentas-klaras-pmis

# Function to check if a process is running on port 5432
check_port() {
    if lsof -i :5432 > /dev/null; then
        return 0
    else
        return 1
    fi
}

# Kill any existing process on port 5432
if check_port; then
    echo -e "${BLUE}Port 5432 is in use. Attempting to free it...${NC}"
    sudo lsof -i :5432 | grep LISTEN | awk '{print $2}' | xargs kill -9
fi

# Start Cloud SQL Proxy in the background
echo -e "${BLUE}Starting Cloud SQL Proxy...${NC}"
cloud-sql-proxy --address 127.0.0.1 --port 5432 kwentas-klaras-pmis:asia-southeast1:kwentasklaras-db &
PROXY_PID=$!

# Wait for the proxy to start
sleep 3

# Check if proxy started successfully
if ! check_port; then
    echo -e "${RED}Failed to start Cloud SQL Proxy${NC}"
    kill $PROXY_PID 2>/dev/null
    exit 1
fi

echo -e "${GREEN}Cloud SQL Proxy is running${NC}"

# Activate virtual environment if it exists
if [ -d "env" ]; then
    echo -e "${BLUE}Activating virtual environment...${NC}"
    source env/bin/activate
fi

# Start Django development server
echo -e "${BLUE}Starting Django development server...${NC}"
python manage.py runserver

# Cleanup function
cleanup() {
    echo -e "\n${BLUE}Shutting down...${NC}"
    kill $PROXY_PID 2>/dev/null
    deactivate 2>/dev/null
    echo -e "${GREEN}Development environment stopped${NC}"
}

# Set up cleanup on script exit
trap cleanup EXIT

# Wait for Django server
wait 