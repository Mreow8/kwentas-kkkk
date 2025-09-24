# **KwentasKlaras**

A Django-based web application for financial tracking and management.

## Project Directory Structure

### Root Directory (`KwentasKlaras/`)
This is the main project folder containing all configurations and core files.

- **manage.py**  
  - The Django management script used for running commands like `runserver`, `migrate`, etc.

- **requirements.txt**  
  - Lists all dependencies required for the project. Install them using:
    ```sh
    pip install -r requirements.txt
    ```

## Project Dependencies

This document provides an overview of the dependencies in **`requirements.txt`**, explaining their purpose and how they interact with the Django project.

---

## **1. Installing Dependencies**
To install all required dependencies, run:
```sh
pip install -r requirements.txt
```
This will ensure that all necessary Python packages are installed.

**Note:** Some dependencies may not be explicitly listed in `requirements.txt`. If any package is missing, it will be logged in the **terminal when running the server**.

---

## **2. Core Django Dependencies**
These packages are essential for the Django framework and application functionality.

| **Package**                 | **Purpose** |
|----------------------------|------------|
| `Django==4.0.1`             | Core web framework used for the project. |
| `asgiref==3.6.0`           | Handles Django's async communication. |
| `django-redis==5.4.0`      | Enables caching using Redis. |
| `django-maintenance-mode==0.21.1` | Allows enabling maintenance mode. |
| `django-tailwind==3.6.0`   | Provides Tailwind CSS integration with Django. |
| `django-unfold==0.29.1`    | Custom admin panel UI for Django. |
| `whitenoise==6.6.0`        | Serves static files efficiently in production. |

---

## **3. Security & Authentication Dependencies**
These packages enhance security and provide authentication features.

| **Package**                 | **Purpose** |
|----------------------------|------------|
| `django-axes==6.4.0`       | Prevents brute force login attacks. |
| `django-easy-audit==1.3.6` | Tracks model changes for security auditing. |
| `pyotp==2.9.0`             | Generates one-time passwords (OTP) for 2FA. |
| `jwcrypto==1.5.6`          | Handles JSON Web Tokens (JWT) for authentication. |
| `cryptography==42.0.8`     | Provides encryption algorithms for secure communication. |

---

## **4. Database & Data Handling Dependencies**
These packages manage data storage, serialization, and database interactions.

| **Package**                 | **Purpose** |
|----------------------------|------------|
| `sqlparse==0.4.2`          | Parses and formats SQL queries. |
| `pytz==2024.2`             | Handles timezone conversions. |
| `openpyxl==3.1.5`          | Reads and writes Excel files. |
| `python-docx==1.1.2`       | Generates Word documents. |
| `pandas==2.2.3`            | Handles large datasets efficiently. |

---

## **5. Firebase & Google Cloud Services**
These packages integrate Firebase authentication, Firestore database, and cloud storage.

| **Package**                 | **Purpose** |
|----------------------------|------------|
| `firebase-admin==6.5.0`    | Manages Firebase authentication and Firestore. |
| `google-auth==2.30.0`      | Handles Google API authentication. |
| `google-cloud-firestore==2.16.0` | Enables interaction with Firestore NoSQL database. |
| `google-cloud-storage==2.17.0`  | Handles file uploads to Google Cloud Storage. |

---

## **6. WebSockets & Real-Time Communication**
These packages support WebSocket connections and real-time features.

| **Package**                 | **Purpose** |
|----------------------------|------------|
| `channels==3.0.0`          | Enables Django to handle WebSockets. |
| `channels-redis==4.2.0`    | Uses Redis as a WebSocket message broker. |
| `daphne==3.0.2`            | ASGI server for handling real-time communication. |

---

## **7. Logging & Debugging Tools**
These packages help with monitoring and debugging.

| **Package**                 | **Purpose** |
|----------------------------|------------|
| `prometheus_client==0.20.0` | Collects and exports system metrics. |
| `python-json-logger==2.0.7` | Formats logs in JSON for easier debugging. |
| `logging` (built-in)        | Used for tracking events in the Django application. |

---

## **8. Other Utility Packages**
These packages provide additional functionalities for the project.

| **Package**                 | **Purpose** |
|----------------------------|------------|
| `qrcode==7.4.2`            | Generates QR codes for authentication. |
| `matplotlib==3.9.2`        | Creates charts and graphs for reports. |
| `plotly==5.24.1`           | Interactive data visualization. |
| `redis==5.0.6`             | Manages in-memory caching and real-time data processing. |

---

## **9. Notes**
- Some dependencies may **not be explicitly listed** in `requirements.txt` but will be **installed as sub-dependencies**.
- **If any required package is missing, it will be shown in the terminal when running the server** with:
  ```sh
  python manage.py runserver
  ```
- To manually check installed packages, run:
  ```sh
  pip list
  ```

---

## **10. Updating Dependencies**
To update all installed dependencies, run:
```sh
pip install --upgrade -r requirements.txt
```

To update a specific package, run:
```sh
pip install --upgrade package-name
```

---

## **11. Troubleshooting Missing Dependencies**
If you see an **ImportError** when running the server:
1. **Check the terminal log** to see which package is missing.
2. Install the missing package manually:
   ```sh
   pip install package-name
   ```
3. If errors persist, reinstall all dependencies:
   ```sh
   pip install --force-reinstall -r requirements.txt
   ```

---

- **README.md**  
  - Provides an overview of the project, installation steps, and usage guidelines.

- **KwentasKlaras/** (Main Django Project)
  - Contains global Django configurations.

  - **`__init__.py`**  
    - Marks this directory as a Python package.

  - **settings.py**  
    - Main settings file containing database configurations, installed apps, middleware, and static/media file settings.

  - **urls.py**  
    - Defines the project-wide URL routing.

  - **asgi.py / wsgi.py**  
    - ASGI and WSGI entry points for different server configurations.

---

## KwentasApp (Main Django App)
This directory contains the core logic of the application.

### HTML Templates and Their Purpose

| **File**               | **Description** |
|------------------------|----------------|
| `adddata.html`        | Page for adding new financial data entries. |
| `check_payment.html`  | Displays payment verification details. |
| `continuing.html`     | Handles ongoing transactions and records. |
| `current.html`        | Shows current financial records. |
| `disbursements.html`  | Displays funds disbursed for projects. |
| `enable_2fa.html`     | Two-factor authentication setup page. |
| `forgot-password.html`| Allows users to reset their password. |
| `graphs.html`         | Displays financial data visualizations using charts. |
| `homepage.html`       | Main landing page of the application. |
| `index.html`         | Default dashboard for logged-in users. |
| `login.html`         | User login page. |
| `loginfailed.html`   | Error page when login fails. |
| `obligations.html`   | Displays financial obligations and due payments. |
| `procurements.html`  | Shows procurement-related financial details. |
| `projectreports.html`| Contains reports for ongoing and completed projects. |
| `register.html`      | User registration page. |
| `stats.html`        | Displays financial statistics and reports. |
| `verification_email.html` | Email template for account verification. |
| `verify_otp.html`    | Page where users input OTP for authentication. |
| `maintenance.html`   | Maintenance mode notification page. |

- **admin.py**  
  - Configures Django's admin panel for managing the database models.

- **apps.py**  
  - Defines application-specific settings.

- **models.py**  
  - Defines database models for the application.

- **forms.py**  
  - Contains Django form classes for handling user input.

- **views.py**  
  - Defines logic for handling user requests and rendering templates.

- **urls.py**  
  - Defines URL routing for the app.

- **signals.py**  
  - Contains Django signals, such as automatic updates when models change.

- **projects.py**  
  - Custom logic for project-related features.

- **firebase.py**  
  - Integration with Firebase for authentication, real-time database, or push notifications.

---

## Media
Stores user-uploaded files such as QR codes, profile images, and documents.

- **qr_codes/**  
  - Contains generated QR codes for user authentication or financial tracking.

---

## Static Files
Contains all static assets such as CSS, JavaScript, and images.

- **admin/**  
  - Custom styling and scripts for the admin panel.

- **KwentasApp/**  
  - App-specific static files like CSS, JS, or images.

- **unfold/**  
  - Likely contains additional UI components or templates.

---

## Migrations
Stores Django migration files that track database schema changes.

---

## CI/CD Configuration
- **.github/workflows/**  
  - Contains GitHub Actions CI/CD workflow configuration for automating deployments.

---

## Deployment Configuration
- **pythonanywhere/**  
  - Configuration files for deployment on PythonAnywhere.

---

## Installation & Setup

### Install Git
If Git is not installed, download and install it from [https://git-scm.com/](https://git-scm.com/).

#### Windows:
1. Download the Git installer from the official website.
2. Run the installer and follow the setup instructions.
3. Verify installation:
   ```sh
   git --version
   ```

#### Linux (Debian-based):
```sh
sudo apt update
sudo apt install git -y
git --version
```

#### macOS:
```sh
brew install git
git --version
```

### Clone the Repository
```sh
git clone https://github.com/hanz-archer/KwentasKlaras.git
cd KwentasKlaras
```

### Create and Activate a Virtual Environment
```sh
python -m venv venv
source venv/bin/activate  # For Linux/macOS
venv\Scripts\activate     # For Windows
```

### Install Dependencies
```sh
pip install -r requirements.txt
```

### Apply Migrations
```sh
python manage.py migrate
```

### Run the Development Server
```sh
python manage.py runserver
```

### Push Code to GitHub
```sh
git add .
git commit -m "Your commit message"
git push origin main
```

---

## Common Errors & Fixes

### 1. **Page Not Found (404)**
- **Issue:** Visiting a page that does not exist or an incorrect URL.
- **Fix:**
  - Check if the URL exists in `urls.py`.
  - Run `python manage.py show_urls` (requires `django-extensions` package).
  - Make sure the corresponding view function exists.

##### ✅ **1. Check URL Patterns in `urls.py`**
Ensure your app’s `urls.py` contains the correct routes.

```python
from django.urls import path
from KwentasApp import views

urlpatterns = [
    path('', views.homepage, name='homepage'),
    path('login/', views.login_user, name='login'),
    path('register/', views.register_user, name='register'),
]
```

##### ✅ **2. Check `views.py` for Missing Functions**
Make sure the corresponding view function exists.

```python
from django.shortcuts import render

def homepage(request):
    return render(request, "KwentasApp/homepage.html")
```

##### ✅ **3. Run `python manage.py show_urls`**
Django provides a command to list all available URLs.

```sh
python manage.py show_urls
```
- If your URL is missing, check `urls.py` again.  
- If your URL is listed but still returns 404, check `views.py`.  

##### ✅ **4. Static Files Not Loading**
If your CSS/JS/images are not loading in production:
```sh
python manage.py collectstatic
```
Then restart the PythonAnywhere app.

##### ✅ **5. Debugging 404 Errors**
If `DEBUG = False` in `settings.py`, Django will **not** show error details.  
To enable debugging:
```python
DEBUG = True
```
Then restart the server:
```sh
python manage.py runserver
```
### 2. **ModuleNotFoundError: No module named 'KwentasApp'**
- **Issue:** Django cannot find the application module.
- **Fix:**
  - Ensure `KwentasApp` is added to `INSTALLED_APPS` in `settings.py`.
  - Check if `KwentasApp` has an `__init__.py` file.

### 3. **Static Files Not Loading**
- **Issue:** CSS, JavaScript, or images are not appearing.
- **Fix:**
  - Run `python manage.py collectstatic`.
  - Make sure `STATIC_URL` and `STATICFILES_DIRS` are correctly set in `settings.py`.

### 4. **Database Errors (OperationalError, IntegrityError, etc.)**
- **Issue:** The database schema is outdated or has missing tables.
- **Fix:**
  - Run migrations again:
    ```sh
    python manage.py makemigrations
    python manage.py migrate
    ```
  - Check `models.py` for any missing relationships or fields.

### 5. **Server Won't Start (Port Already in Use)**
- **Issue:** Django’s default port (`8000`) is occupied.
- **Fix:**
  - Kill the process using port 8000:
    ```sh
    sudo lsof -t -i:8000 | xargs kill -9  # Linux/macOS
    netstat -ano | findstr :8000          # Windows (find PID)
    taskkill /PID <PID> /F                # Windows (kill process)
    ```
  - Start Django on a different port:
    ```sh
    python manage.py runserver 8001
    ```

### 6. **Superuser Login Not Working**
- **Issue:** Cannot log in as an admin.
- **Fix:**
  - Reset the password:
    ```sh
    python manage.py createsuperuser
    ```
  - If the account exists, reset the password:
    ```sh
    python manage.py shell
    from django.contrib.auth.models import User
    user = User.objects.get(username="admin")
    user.set_password("newpassword")
    user.save()
    ```

### 7. **Git Push Authentication Error**
- **Issue:** Git asks for username/password repeatedly.
- **Fix:**
  - Use SSH instead of HTTPS:
    ```sh
    git remote set-url origin git@github.com:hanz-archer/KwentasKlaras.git
    ```
  - Set up Git credentials:
    ```sh
    git config --global credential.helper store
    ```

    ---

## Deploying Updates to PythonAnywhere

### 1. **Log in to PythonAnywhere**
Go to [https://www.pythonanywhere.com/](https://www.pythonanywhere.com/) and log in to your account.

### 2. **Open a Bash Console**
- Go to the **Consoles** tab.
- Open a **Bash console**.

### 3. **Navigate to Your Project Directory**
```sh
cd KwentasKlaras
```

### 4. **Pull the Latest Code from GitHub**
```sh
git stash   # Stash any local changes (if any)
git pull origin main  # Pull latest code
```

### 5. **Apply Migrations (If Any)**
```sh
python manage.py migrate
```

### 6. **Collect Static Files for Production**
```sh
python manage.py collectstatic --noinput
```

### 7. **Restart the PythonAnywhere Web Server**
- Go to **Web** tab in PythonAnywhere.
- Click **Reload** to apply changes.

---

## Firebase Integration Tutorial

### 1. **Create a Firebase Project**
- Go to [Firebase Console](https://console.firebase.google.com/).
- Click **Add Project** and follow the setup instructions.

### 2. **Enable Authentication**
- Go to the **Authentication** tab.
- Click **Sign-in method** and enable **Email/Password** authentication.

### 3. **Get Firebase Config**
- Go to **Project Settings > General**.
- Scroll down to **Your apps** and copy the Firebase configuration.

### 4. **Install Firebase SDK**
```sh
pip install firebase-admin
```

### 5. **Set Up Firebase in Django**
- Create a `firebase.py` file in `KwentasApp/` and add:

**Get Firebase Admin SDK Credentials**
1. Under the **Service Accounts** tab, click **"Generate new private key"**.
2. A JSON file will be downloaded. Move this file to your Django project (e.g., `KwentasApp/firebase.json`).
3. **Never commit this file to GitHub**. Add it to `.gitignore`:
   
   ```sh
   echo "KwentasApp/firebase.json" >> .gitignore
```python
import firebase_admin
from firebase_admin import credentials, auth

cred = credentials.Certificate("path/to/serviceAccountKey.json")
firebase_admin.initialize_app(cred)
```

### 6. **Authenticate Users**
```python
def verify_token(id_token):
    try:
        decoded_token = auth.verify_id_token(id_token)
        return decoded_token
    except Exception as e:
        return None
```

---

This area is for **`projects.py`**, describing their purpose and how they interact with Django, Firebase, and other services.

---

## **Imports & Dependencies**
The file imports several essential Django, Firebase, and utility modules:
- **Django Modules:** Used for rendering templates, handling HTTP responses, authentication, and pagination.
- **Firebase Modules:** Used for interacting with the Firebase Realtime Database.
- **Utility Modules:** Regular expressions (`re`), caching (`cache`), and file handling (`io.BytesIO`).

---

## **1. Entry Creation & Validation Functions**
### **`create_entry(request)`**
- **Purpose:** Handles project entry creation via form submission.
- **Validations Performed:**
  - Ensures all required fields are provided.
  - Checks **appropriation amount** is a positive number.
  - Validates **date formats** (YYYY-MM-DD).
  - Ensures **start date is before end date**.
  - Prevents **duplicate project codes** in Firebase.
- **Saves Data To:** Firebase under the `Data` collection.

---

## **2. Data Retrieval Functions**
### **`get_project_entries()`**
- **Purpose:** Fetches all project entries from Firebase.
- **Functionality:**
  - Retrieves data and stores it in **cache** for performance.
  - Separates entries **before and after 2024** for categorization.
  - Extracts **disbursement, obligation, and budget data**.
  - Sorts entries by **created_at** timestamp.

### **`get_processed_project_data()`**
- **Purpose:** Fetches project entries from Django’s SQL database (not Firebase).
- **Used For:** Processing structured project data for reports.

---

## **3. Project Listing & Sorting**
### **`indexPage(request)`**
- **Purpose:** Displays all project entries, sorted by utilization rate (highest to lowest).
- **Rendered Template:** `KwentasApp/index.html`

### **`continuing_projects(request)`**
- **Purpose:** Displays ongoing projects (before 2024) with sorting options.
- **Sorting Options:**
  - **Oldest First**
  - **Most Recent First**
- **Pagination:** 10 projects per page.
- **Rendered Template:** `KwentasApp/continuing.html`

### **`current_projects(request)`**
- **Purpose:** Displays current projects (2024 and later) with sorting and pagination.
- **Rendered Template:** `KwentasApp/current.html`

### **`handle_entries(request, template_name)`**
- **Purpose:** Generic function for rendering lists of projects.
- **Used By:**
  - `obligations()`
  - `disbursements()`
  - `procurements()`
  - `check_payment()`

---

## **4. Obligations & Disbursements**
### **`add_obligation(request, project_type)`**
- **Purpose:** Adds financial obligations to a project.
- **Validations:**
  - Ensures **date is within project duration**.
  - Ensures **remaining balance doesn’t go negative**.
- **Updates:** Firebase & Logs the update in Django’s audit log.

### **`add_disbursement(request, project_type)`**
- **Purpose:** Adds disbursement details to a project.
- **Validations:**
  - Checks **disbursement amount is valid**.
  - Prevents **negative obligations**.
- **Updates:** Firebase & Audit log.

### **`update_disbursement(request)`**
- **Purpose:** Updates the status or payment date of a disbursement.

---

## **5. Budget & Funding**
### **`add_budget(request, project_type)`**
- **Purpose:** Allows adding extra funds to a project.
- **Validations:**
  - Ensures **new budget amount is valid**.
  - Prevents **negative remaining balance**.
- **Updates:** Firebase & Logs event.

---

## **6. Search & Reports**
### **`search_projects(request, project_type)`**
- **Purpose:** Searches for projects by keyword in **multiple fields**.
- **Used In:** Continuing, Current, Obligations, Disbursements, Procurements.

### **`reports_view(request)`**
- **Purpose:** Generates utilization rate reports.
- **Splits Projects Into:**
  - **Below 50% Utilization**
  - **Above 50% Utilization**
- **Rendered Template:** `KwentasApp/stats.html`

### **`graphs(request)`**
- **Purpose:** Generates data for financial graphs.
- **Used For:** Visualizing utilization rates.

### **`all_projects(request)`**
- **Purpose:** Lists all projects with search functionality.

---

## **7. Data Export**
### **`download_word(request, project_code)`**
- **Purpose:** Generates a Word document report for a project.
- **Includes:**
  - Project details (PPA, location, funding)
  - Disbursement history
  - Obligations and budget allocations

---

## **8. Analytics & Statistics**
### **`get_monthly_expenses()`**
- **Purpose:** Calculates total spending per month.
- **Returns:** JSON response with month-wise expenses.

### **`get_daily_expenses()`**
- **Purpose:** Calculates daily disbursement totals.

### **`get_monthly_comparison()`**
- **Purpose:** Compares monthly obligations vs. disbursements.

### **`get_department_utilization_rate()`**
- **Purpose:** Computes **average utilization rate per department**.

---

## **9. CRUD Operations**
### **`update_entry(request, project_type)`**
- **Purpose:** Edits a project entry’s details.
- **Handles:**
  - Changes to **dates, codes, remarks, services**.
  - If the **code is changed**, moves data in Firebase.

### **`delete_entry(request, project_type)`**
- **Purpose:** Deletes a project entry from Firebase.
- **Ensures:** Placeholder remains in database.

---

This area is for the of functions inside **`views.py`**, describing their purpose and how they interact with Django, authentication, Firebase, and other services.

---

## **1. User Authentication Views**
These views handle login, logout, registration, and authentication logic.

### **`login_view(request)`**
- **Purpose:** Handles user login.
- **Validations:**
  - Authenticates the user using `username` and `password`.
  - Redirects to the homepage after successful login.
  - Stores a session variable `just_logged_in` for UI alerts.
  - Checks if the user has **2FA enabled** and redirects to OTP verification.

### **`logout_view(request)`**
- **Purpose:** Logs out the current user and redirects to the login page.

### **`register_page(request)`**
- **Purpose:** Displays the user registration form.

### **`registration_view(request)`**
- **Purpose:** Handles user registration.
- **Validations:**
  - Checks if the user has **entered the correct verification code**.
  - Ensures the email matches the one used for verification.
  - Saves the new user to the database.

---

## **2. Two-Factor Authentication (2FA)**
These views handle OTP-based authentication and QR code generation.

### **`send_verification_code(request)`**
- **Purpose:** Sends a 6-digit verification code to the user’s email.
- **Validations:**
  - Generates a random 6-digit OTP.
  - Sends the OTP via email using Django’s email system.
  - Stores the OTP and email in the user’s session.

### **`verify_otp(request)`**
- **Purpose:** Verifies the OTP entered by the user.
- **Validations:**
  - Ensures the user has **2FA enabled**.
  - Checks if the entered OTP matches the stored secret.
  - Grants access if OTP is correct.

### **`enable_2fa(request)`**
- **Purpose:** Enables Two-Factor Authentication for the user.
- **Steps:**
  - Generates a **new TOTP secret key**.
  - Saves the **secret key** to the user profile.
  - Creates a **QR code** for authentication apps like Google Authenticator.

### **`generate_qr_code(request)`**
- **Purpose:** Generates a QR code for setting up 2FA.
- **Used By:** Google Authenticator or any other OTP-based authenticator.

---

## **3. Password Reset & Validation**
These views allow users to reset their passwords.

### **`forgotpassword(request)`**
- **Purpose:** Renders the password reset page.

### **`verify_and_change_password(request)`**
- **Purpose:** Allows users to reset their password after verifying their email.
- **Validations:**
  - Ensures the **verification code is correct**.
  - Updates the **password securely** using Django’s hashing system.
  - Authenticates the user with the new password.

### **`validate_password(request)`**
- **Purpose:** Validates the user’s password before performing security-sensitive actions.

---

## **4. Dashboard & Homepage Views**
### **`homepage(request)`**
- **Purpose:** Displays the homepage after login.
- **Checks:**
  - Ensures the user has **verified their OTP** before accessing the homepage.
  - Displays the user’s name in the UI.

### **`unset_just_logged_in(request)`**
- **Purpose:** Removes the `just_logged_in` session variable after login to prevent unwanted pop-ups.

---

## **5. Admin & Superuser Views**
### **`admin_view(request)`**
- **Purpose:** Displays the admin dashboard.
- **Restrictions:** Only accessible by **superusers**.

### **`base_view(request)`**
- **Purpose:** Forces logout and redirects the user to login.

### **`is_superuser(user)`**
- **Purpose:** Checks if the user is a **superuser** before granting admin access.

---

## **6. Excel Report Generation**
These views generate downloadable Excel reports for financial data.

### **`bulk_download_xlsx(request)`**
- **Purpose:** Generates Excel reports based on selected project entries.
- **Steps:**
  - Loads a **pre-designed Excel template**.
  - Retrieves **project data** from Firebase.
  - Writes **project details into categorized rows**.
  - **Formats** the document with correct styles.
  - Returns the **Excel file** as a download.

---

## **7. Security & Access Control**
### **`get_2fa_status(request)`**
- **Purpose:** Returns the **2FA status** of the logged-in user.

### **`csrf_exempt & require_POST Decorators**`
- **Purpose:** Some views use `@csrf_exempt` to disable CSRF protection for **API endpoints**.
- **Risk:** Should only be used for trusted internal endpoints.

---

## **8. Debugging & Logging**
### **`logger`**
- **Purpose:** Logs authentication, email sending, and critical system events.
- **Example Logging Events:**
  - **Successful and failed login attempts**
  - **Password reset requests**
  - **2FA status updates**
  - **Email verification failures**

---


# **KwentasKlaras - URL Routing Documentation**

This area is for the URL patterns defined in **`urls.py`**, describing their purpose and how they interact with Django views.

---

## **1. Authentication & User Management Routes**
These URLs handle user login, logout, registration, and authentication.

| **URL**                          | **View Function**         | **Purpose** |
|----------------------------------|--------------------------|------------|
| `/login/`                        | `login_view`             | Displays the login page and handles authentication. |
| `/logout/`                       | `logout_view`            | Logs out the current user and redirects to login. |
| `/register/`                     | `registration_view`      | Handles user registration and verification. |
| `/register_page/`                | `register_page`         | Displays the user registration form. |
| `/forgot-password/`              | `forgotpassword`        | Displays the forgot password page. |
| `/verify-and-change-password/`   | `verify_and_change_password` | Verifies OTP and allows the user to change the password. |

---

## **2. Two-Factor Authentication (2FA) Routes**
These URLs manage OTP-based authentication and QR code generation.

| **URL**                          | **View Function**         | **Purpose** |
|----------------------------------|--------------------------|------------|
| `/send-verification-code/`       | `send_verification_code` | Sends an OTP to the user's email. |
| `/verify-otp/`                   | `verify_otp`             | Verifies the OTP entered by the user. |
| `/enable-2fa/`                   | `generate_qr_code`       | Generates a QR code for setting up 2FA. |
| `/get_2fa_status/`               | `get_2fa_status`         | Returns whether 2FA is enabled for the user. |

---

## **3. Dashboard & Homepage Routes**
These URLs manage navigation between different sections of the app.

| **URL**                          | **View Function**         | **Purpose** |
|----------------------------------|--------------------------|------------|
| `/homepage/`                     | `homepage`               | Displays the main dashboard. |
| `/`                              | `indexPage`              | Redirects to the homepage. |
| `/unset_just_logged_in/`         | `unset_just_logged_in`   | Clears session variables to prevent pop-ups. |

---

## **4. Project Management Routes**
These URLs handle project creation, updates, and deletions.

| **URL**                          | **View Function**         | **Purpose** |
|----------------------------------|--------------------------|------------|
| `/create_entry/`                 | `create_entry`           | Allows users to create a new project entry. |
| `/update_entry/<project_type>/`  | `update_entry`           | Updates details of an existing project. |
| `/delete_entry/<project_type>/`  | `delete_entry`           | Deletes a project entry. |

---

## **5. Project Listing & Search Routes**
These URLs retrieve lists of projects and allow searching.

| **URL**                          | **View Function**         | **Purpose** |
|----------------------------------|--------------------------|------------|
| `/continuing_projects/`          | `continuing_projects`    | Displays projects before 2024. |
| `/current_projects/`             | `current_projects`       | Displays projects in 2024 and beyond. |
| `/search_projects/<project_type>/` | `search_projects`     | Searches projects by keywords. |
| `/all-projects/`                 | `all_projects`           | Displays all projects with search functionality. |

---

## **6. Financial Management Routes**
These URLs handle financial transactions like obligations, disbursements, and budgets.

| **URL**                          | **View Function**         | **Purpose** |
|----------------------------------|--------------------------|------------|
| `/procurements/`                 | `procurements`           | Displays procurement-related details. |
| `/check_payment/`                | `check_payment`          | Displays payment verification details. |
| `/update_disbursement/`          | `update_disbursement`    | Updates a disbursement’s status. |
| `/add_obligation/<project_type>/` | `add_obligation`        | Adds financial obligations to a project. |
| `/add_budget/<project_type>/`     | `add_budget`            | Adds additional budget to a project. |
| `/disbursements/`                 | `disbursements`         | Displays all disbursement records. |
| `/add_disbursement/<project_type>/` | `add_disbursement`    | Adds a new disbursement record. |
| `/obligations/`                   | `obligations`          | Displays financial obligations per project. |

---

## **7. Reports & Data Visualization Routes**
These URLs generate reports, charts, and visualizations.

| **URL**                          | **View Function**         | **Purpose** |
|----------------------------------|--------------------------|------------|
| `/reports/`                      | `reports_view`          | Generates utilization rate reports. |
| `/graphs/`                       | `graphs`                | Displays financial graphs and charts. |
| `/download_word/<project_code>/` | `download_word`         | Generates a Word document for a project. |
| `/bulk-download/`                | `bulk_download_xlsx`    | Generates an Excel report with multiple projects. |

---

## **8. API Endpoints**
These URLs provide JSON data for frontend analytics.

| **URL**                          | **View Function**                     | **Purpose** |
|----------------------------------|--------------------------------------|------------|
| `/api/get_daily_expenses/`       | `get_daily_expenses_view`           | Returns daily disbursement totals. |
| `/api/get_monthly_expenses/`     | `get_monthly_expenses_view`         | Returns total spending per month. |
| `/api/get_department_utilization_rate/` | `get_department_utilization_rate_view` | Computes utilization rate per department. |
| `/api/get_monthly_comparison/`   | `get_monthly_comparison_view`       | Compares monthly obligations vs. disbursements. |

---

# **KwentasKlaras - Django Settings Documentation**

This document provides an overview of the **`settings.py`** file, explaining each configuration and its purpose in the Django project.

---

## **1. Basic Project Settings**
### **`BASE_DIR`**
- Defines the **base directory** of the project.
- Used for resolving file paths within the project.

### **`SECRET_KEY`**
- A **unique key** for cryptographic signing.
- **Security Risk:** Do **not** expose it publicly or commit it to GitHub.
- **Fix for Production:** Store it in an **environment variable**:
  ```python
  import os
  SECRET_KEY = os.getenv('SECRET_KEY', 'default-key-for-development')
  ```

### **`DEBUG`**
- Set to `True` during development to show detailed error messages.
- **In production, set it to `False`** to prevent data leaks:
  ```python
  DEBUG = False
  ```

### **`ALLOWED_HOSTS`**
- Specifies which domains can serve the Django application.
- Example:
  ```python
  ALLOWED_HOSTS = ['KwentasKlarasPMIS.pythonanywhere.com', '127.0.0.1', 'localhost']
  ```

---

## **2. Installed Applications**
```python
INSTALLED_APPS = [
    'unfold',  # Custom UI for Django Admin
    'django.contrib.admin',
    'django.contrib.auth',
    'django.contrib.contenttypes',
    'django.contrib.sessions',
    'django.contrib.messages',
    'django.contrib.staticfiles',
    'KwentasApp',  # Main application
    'django.contrib.humanize',  # Provides number formatting filters
    'easyaudit',  # Tracks model changes (audit logs)
    'maintenance_mode'  # Enables maintenance mode
]
```

- **`easyaudit`**: Tracks **login/logout events, CRUD operations**, and **requests**.
- **`maintenance_mode`**: Enables a **maintenance page** when needed.

---

## **3. Middleware Configuration**
```python
MIDDLEWARE = [
    'django.middleware.security.SecurityMiddleware',
    'django.contrib.sessions.middleware.SessionMiddleware',
    'django.middleware.common.CommonMiddleware',
    'django.middleware.csrf.CsrfViewMiddleware',
    'django.contrib.auth.middleware.AuthenticationMiddleware',
    'django.contrib.messages.middleware.MessageMiddleware',
    'django.middleware.clickjacking.XFrameOptionsMiddleware',
    'easyaudit.middleware.easyaudit.EasyAuditMiddleware',
    'maintenance_mode.middleware.MaintenanceModeMiddleware'
]
```
- **Handles authentication, security, and CSRF protection.**
- **`EasyAuditMiddleware`** tracks system events for logging.
- **`MaintenanceModeMiddleware`** enables maintenance mode.

---

## **4. Template Settings**
```python
TEMPLATES = [
    {
        'BACKEND': 'django.template.backends.django.DjangoTemplates',
        'DIRS': [os.path.join(BASE_DIR, 'templates')],
        'APP_DIRS': True,
        'OPTIONS': {
            'context_processors': [
                'django.template.context_processors.debug',
                'django.template.context_processors.request',
                'django.contrib.auth.context_processors.auth',
                'django.contrib.messages.context_processors.messages',
            ],
        },
    },
]
```
- Django **renders HTML templates** using this configuration.
- `APP_DIRS = True` allows **Django to load templates from installed apps**.

---

## **5. Database Configuration**
```python
DATABASES = {
    'default': {
        'ENGINE': 'django.db.backends.sqlite3',
        'NAME': BASE_DIR / 'db.sqlite3',
    }
}
```
- Uses **SQLite** for local development.
- **U can change it to PostgreSQL or MySQL or any other database**.

---

## **6. Password Validation**
```python
AUTH_PASSWORD_VALIDATORS = [
    {'NAME': 'django.contrib.auth.password_validation.UserAttributeSimilarityValidator'},
    {'NAME': 'django.contrib.auth.password_validation.MinimumLengthValidator'},
    {'NAME': 'django.contrib.auth.password_validation.CommonPasswordValidator'},
    {'NAME': 'django.contrib.auth.password_validation.NumericPasswordValidator'},
]
```
- Enforces **strong password policies**.

---

## **7. Security Settings**
```python
SESSION_COOKIE_SECURE = True
CSRF_COOKIE_SECURE = True
SECURE_HSTS_SECONDS = 31536000  # 1 year
SECURE_HSTS_INCLUDE_SUBDOMAINS = True
SECURE_HSTS_PRELOAD = True
SESSION_COOKIE_HTTPONLY = True
CSRF_COOKIE_HTTPONLY = True
```
- **Session & CSRF cookies are secured** (`True` for HTTPS-only).
- **HSTS (HTTP Strict Transport Security)** is enabled for one year.

---

## **8. Static & Media Files**
```python
STATIC_URL = '/static/'
STATICFILES_DIRS = [BASE_DIR / "static"]
STATIC_ROOT = os.path.join(BASE_DIR, 'staticfiles')

MEDIA_URL = '/media/'
MEDIA_ROOT = os.path.join(BASE_DIR, 'media')
```
- **`STATICFILES_DIRS`**: Where Django looks for static files (CSS, JS).
- **`STATIC_ROOT`**: Directory where `collectstatic` collects files for production.
- **`MEDIA_ROOT`**: Directory for **uploaded files** (images, PDFs, etc.).

---

## **9. Authentication & Sessions**
```python
LOGIN_URL = 'login'
AUTH_USER_MODEL = 'KwentasApp.CustomUser'
SESSION_ENGINE = 'django.contrib.sessions.backends.db'
SESSION_COOKIE_AGE = 1209600  # 2 weeks
```
- **Custom User Model**: Uses `KwentasApp.CustomUser` instead of Django's default user.
- **Session Duration**: **Two weeks** before expiration.

---

## **10. Email Configuration**
```python
EMAIL_BACKEND = 'django.core.mail.backends.smtp.EmailBackend'
EMAIL_HOST = 'smtp.gmail.com'
EMAIL_PORT = 587
EMAIL_USE_TLS = True
EMAIL_HOST_USER = 'kwentasklarasboljoon@gmail.com'
EMAIL_HOST_PASSWORD = 'hvab euhu zpvu syvg'
```
- **SMTP settings for Gmail**.
- **Security Risk:** Do **not** hardcode credentials. Use:
  ```python
  EMAIL_HOST_USER = os.getenv('EMAIL_HOST_USER')
  EMAIL_HOST_PASSWORD = os.getenv('EMAIL_HOST_PASSWORD')
  ```

---

## **11. Logging Configuration**
```python
LOGGING = {
    'version': 1,
    'handlers': {
        'console': {
            'level': 'DEBUG',
            'class': 'logging.StreamHandler',
        },
    },
    'loggers': {
        'django.template': {
            'handlers': ['console'],
            'level': 'DEBUG',
            'propagate': True,
        },
    },
}
```
- **Logs errors to the console** for debugging.

---

## **12. Django Easy Audit Settings**
```python
DJANGO_EASY_AUDIT_WATCH_LOGIN_EVENTS = True
DJANGO_EASY_AUDIT_WATCH_CRUD_EVENTS = True
DJANGO_EASY_AUDIT_REMOTE_IP_ADDRESS_FIELD = 'REMOTE_ADDR'
DJANGO_EASY_AUDIT_EXCLUDED_MODELS = ['auth.User']
DJANGO_EASY_AUDIT_WATCH_REQUEST_EVENTS = True
DJANGO_EASY_AUDIT_EXCLUDE_REQUESTS = [r'^/static/', r'^/admin/']
```
- **Tracks login attempts, CRUD events, and request logs**.
- **Excludes static files and admin requests from auditing**.

---

## **13. Maintenance Mode**
```python
MAINTENANCE_MODE = False
MAINTENANCE_MODE_TEMPLATE = "maintenance.html"
MAINTENANCE_MODE_IGNORE_ADMIN_SITE = False
MAINTENANCE_MODE_STATE_FILE_PATH = "C:/Users/Hanz Archer/Desktop/KwentasKlaras/maintenance_mode_state.txt"
```
- Enables **maintenance mode** with a custom template.
- Stores state in a **file-based flag**.

---

# **KwentasKlaras - Two-Factor Authentication (2FA) Documentation**

Two-Factor Authentication (2FA) enhances security by requiring **both a password and a one-time code (OTP)**. This prevents unauthorized access even if a password is compromised.

---

## **1. How 2FA Works in Kwentas Klaras**
### **Step 1: User Enables 2FA**
- The user navigates to **Account Settings** and selects **"Enable Two-Factor Authentication"**.
- A **QR Code is displayed** for scanning with an authentication app (Google Authenticator, Authy, etc.).
- The QR code contains a **TOTP (Time-based One-Time Password) secret**.

**Related File:** :contentReference[oaicite:0]{index=0}

---

### **Step 2: User Scans QR Code**
- The user **scans the QR code** using an authenticator app.
- The app generates a **6-digit OTP code** every 30 seconds.

---

### **Step 3: User Enters OTP for Verification**
- After scanning the QR code, the user is prompted to **enter the OTP**.
- Django verifies the OTP using **PyOTP** (Python One-Time Password library).

**Related File:** :contentReference[oaicite:1]{index=1}

---

### **Step 4: 2FA is Enabled**
- Once the correct OTP is entered, **2FA is activated** for the user’s account.
- The next time they log in, Django will **ask for an OTP after password authentication**.

---

## **2. 2FA Implementation in Django**
### **Backend Code (Django)**
**File: `views.py`**
```python
import pyotp
from django.shortcuts import render, redirect
from django.contrib.auth.decorators import login_required
from django.contrib.auth.models import User

@login_required
def enable_2fa(request):
    if request.method == "POST":
        user = request.user
        totp = pyotp.TOTP(pyotp.random_base32())  # Generate a unique secret
        user.profile.otp_secret = totp.secret  # Save the secret to user profile
        user.profile.is_2fa_enabled = True  # Enable 2FA flag
        user.profile.save()

        qr_code = totp.provisioning_uri(user.email, issuer_name="Kwentas Klaras")
        return render(request, "enable_2fa.html", {"qr_code": qr_code})

    return render(request, "enable_2fa.html")
```
**Explanation:**
- `pyotp.TOTP(pyotp.random_base32())` generates a **unique OTP secret**.
- `user.profile.otp_secret` stores the secret key in the **user's profile**.
- `qr_code = totp.provisioning_uri(user.email, issuer_name="Kwentas Klaras")` generates a **QR Code**.

---

## **3. OTP Verification**
**File: `verify_otp.html`**  
- The user is prompted to enter a **6-digit OTP** generated by the authentication app.

**File: `views.py`**
```python
@login_required
def verify_otp(request):
    if request.method == "POST":
        otp = request.POST.get("otp")
        user = request.user
        totp = pyotp.TOTP(user.profile.otp_secret)

        if totp.verify(otp):
            request.session["is_verified"] = True  # Mark session as verified
            return redirect("homepage")  # Redirect to dashboard
        else:
            messages.error(request, "Invalid OTP. Please try again.")

    return render(request, "verify_otp.html")
```
**Explanation:**
- `totp.verify(otp)` **checks if the entered OTP is valid**.
- If successful, Django sets `request.session["is_verified"] = True`, allowing the user to proceed.

---

## **4. Resetting 2FA**
### **Disabling 2FA**
If the user wants to **disable 2FA**, the system:
- Deletes the **TOTP secret key** from their profile.
- Sets `is_2fa_enabled = False`.

**Backend Code**
```python
@login_required
def disable_2fa(request):
    user = request.user
    user.profile.otp_secret = ""
    user.profile.is_2fa_enabled = False
    user.profile.save()
    messages.success(request, "Two-Factor Authentication disabled.")
    return redirect("account_settings")
```

---

## **5. Email Verification for Password Reset**
### **OTP Email Template**
**File: `verification_email.html`**  
- If a user **forgets their password**, Django sends an **OTP via email**.

**Backend Code**
```python
import random
from django.core.mail import send_mail

def send_verification_email(user):
    verification_code = random.randint(100000, 999999)  # Generate a 6-digit OTP
    send_mail(
        "Kwentas Klaras - Verification Code",
        f"Your verification code is {verification_code}. Use this to reset your password.",
        "noreply@kwentasklaras.com",
        [user.email],
        fail_silently=False,
    )
    return verification_code
```
**Explanation:**
- The system generates a **random 6-digit OTP**.
- Sends it via **email** using Django's `send_mail()` function.

---

## **6. 2FA Login Process**
### **After 2FA is Enabled, the Login Flow is:**
1. The user enters **username and password**.
2. If 2FA is enabled:
   - Django **redirects them to the OTP verification page**.
3. The user enters the **OTP from their authentication app**.
4. If the OTP is correct, **access is granted**.

---

## **7. Common Issues & Fixes**
###**1. OTP Not Working?**
- Check that **your phone time is synced** (Authenticator apps use system time).
- Make sure the **correct QR code is scanned**.

###**2. Lost Access to 2FA?**
- Contact **admin support** to reset your 2FA settings.

###**3. Forgot Your Password?**
- Request a **password reset** via email.

---
