#!/bin/bash

read -r -p "Enter project name: " PROJECT_NAME
if [[ -z "$PROJECT_NAME" ]]; then
    echo "Error: Project name cannot be empty."
    exit 1
fi

PROJECT_DIR="$(pwd)/$PROJECT_NAME"

echo "Creating project using cargo ..."
cargo new "$PROJECT_DIR" || exit 1

echo "Project setup completed at $PROJECT_DIR"
