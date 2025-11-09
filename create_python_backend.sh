#!/bin/bash

# ---------------------------------------------
# Generic Python Backend Project Scaffolder
# ---------------------------------------------
# Usage:
#   ./create_python_backend.sh my_project_name
# ---------------------------------------------

# Check if project name is provided
if [ -z "$1" ]; then
    echo "Error: Please provide a project name."
    echo "Usage: ./create_python_backend.sh <project_name>"
    exit 1
fi

PROJECT_NAME=$1

# Create root project folder
mkdir -p "$PROJECT_NAME"
cd "$PROJECT_NAME" || exit

# Basic files
touch README.md
touch .gitignore
touch requirements.txt
touch .env

# App folder structure
mkdir -p app/{config,middlewares,modules,routes,utils}

# Add __init__.py to make Python packages
for dir in app app/config app/middlewares app/modules app/routes app/utils; do
    touch "$dir/__init__.py"
done

# Generic placeholders in config
touch app/config/db.py
touch app/config/settings.py
touch app/config/logger.py

# Generic placeholders in middlewares
touch app/middlewares/auth.py
touch app/middlewares/errors.py
touch app/middlewares/validation.py

# Generic placeholders in utils
touch app/utils/constants.py
touch app/utils/helpers.py
touch app/utils/crypto.py

# Main app entry points
touch app/main.py
touch app/celery_app.py

# Migrations and tests folders
mkdir -p migrations tests

# Success message
echo "Python backend project '$PROJECT_NAME' scaffolded successfully!"
