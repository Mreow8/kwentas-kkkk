#!/bin/bash

# Colors for output
GREEN='\033[0;32m'
BLUE='\033[0;34m'
RED='\033[0;31m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

echo -e "${BLUE}Starting KwentasKlaras Dependencies Installation...${NC}"

# Function to detect OS
detect_os() {
    case "$(uname -s)" in
        Darwin*)    echo 'mac';;
        Linux*)     echo 'linux';;
        *)         echo 'unknown';;
    esac
}

OS=$(detect_os)

# Check for Python installation
if ! command -v python3 &> /dev/null; then
    echo -e "${YELLOW}Python 3 is not installed. Installing...${NC}"
    case $OS in
        'mac')
            if command -v brew &> /dev/null; then
                brew install python3
            else
                echo -e "${YELLOW}Installing Homebrew first...${NC}"
                /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
                brew install python3
            fi
            ;;
        'linux')
            sudo apt-get update && sudo apt-get install -y python3 python3-pip python3-venv
            ;;
        *)
            echo -e "${RED}Unsupported operating system. Please install Python 3 manually.${NC}"
            exit 1
            ;;
    esac
fi

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

# Setup Python virtual environment if it doesn't exist
if [ ! -d "env" ]; then
    echo -e "${BLUE}Creating Python virtual environment...${NC}"
    python3 -m venv env
    echo -e "${GREEN}Virtual environment created${NC}"
fi

# Activate virtual environment
echo -e "${BLUE}Activating virtual environment...${NC}"
source env/bin/activate

# Install/Upgrade pip
echo -e "${BLUE}Upgrading pip...${NC}"
python -m pip install --upgrade pip

# Install requirements
if [ -f "requirements.txt" ]; then
    echo -e "${BLUE}Installing Python dependencies...${NC}"
    pip install -r requirements.txt
    if [ $? -ne 0 ]; then
        echo -e "${RED}Failed to install Python dependencies${NC}"
        exit 1
    fi
    echo -e "${GREEN}Python dependencies installed successfully${NC}"
else
    echo -e "${RED}requirements.txt not found${NC}"
    exit 1
fi

# Authenticate with Google Cloud if not already authenticated
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

echo -e "${GREEN}All dependencies installed successfully!${NC}"
echo -e "${BLUE}You can now run ./start_dev.sh to start the development server${NC}" 