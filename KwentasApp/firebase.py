from django.shortcuts import render, redirect
import pyrebase
import json
import os
from dotenv import load_dotenv
from typing import Dict, Any

# Load environment variables
load_dotenv()

def clean_env(key):
    return os.getenv(key, '').strip().strip('"').strip("'")

print("DEBUG: FIREBASE_DATABASE_URL =", repr(os.getenv('FIREBASE_DATABASE_URL')))
print("DEBUG: CLEANED FIREBASE_DATABASE_URL =", repr(clean_env('FIREBASE_DATABASE_URL')))

def get_firebase_config() -> Dict[str, Any]:
    """
    Get Firebase configuration from environment variables
    Raises ValueError if any requ
    ired config is missing
    """
    required_configs = [
        'FIREBASE_API_KEY',
        'FIREBASE_AUTH_DOMAIN',
        'FIREBASE_DATABASE_URL',
        'FIREBASE_PROJECT_ID',
        'FIREBASE_STORAGE_BUCKET',
        'FIREBASE_MESSAGING_SENDER_ID',
        'FIREBASE_APP_ID',
        'FIREBASE_MEASUREMENT_ID'
    ]
    
    missing_configs = [config for config in required_configs if not os.getenv(config)]
    if missing_configs:
        raise ValueError(f"Missing required Firebase configs: {', '.join(missing_configs)}")
    
    print("Firebase configs are valid.")
    
    return {
        "apiKey": clean_env('FIREBASE_API_KEY'),
        "authDomain": clean_env('FIREBASE_AUTH_DOMAIN'),
        "databaseURL": clean_env('FIREBASE_DATABASE_URL'),
        "projectId": clean_env('FIREBASE_PROJECT_ID'),
        "storageBucket": clean_env('FIREBASE_STORAGE_BUCKET'),
        "messagingSenderId": clean_env('FIREBASE_MESSAGING_SENDER_ID'),
        "appId": clean_env('FIREBASE_APP_ID'),
        "measurementId": clean_env('FIREBASE_MEASUREMENT_ID')
    }

try:
    firebase_config = get_firebase_config()
    firebase = pyrebase.initialize_app(firebase_config)
    database = firebase.database()
    print("Firebase initialized successfully.")
except ValueError as ve:
    raise ve
except Exception as e:
    print(f"Error initializing Firebase: {str(e)}")
    raise e