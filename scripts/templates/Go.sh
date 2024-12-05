#!/bin/bash

read -r -p "Enter project name: " PROJECT_NAME
if [[ -z "$PROJECT_NAME" ]]; then
    echo "Error: Project name cannot be empty."
    exit 1
fi

read -r -p "Enter module name ($PROJECT_NAME): " MODULE_NAME
if [[ -z "$MODULE_NAME" ]]; then
    MODULE_NAME=$PROJECT_NAME
fi

PROJECT_DIR="$(pwd)/$PROJECT_NAME"

echo "Creating project structure ..."
mkdir "$PROJECT_DIR" || exit 1

cat > "$PROJECT_DIR/main.go" << EOF
package main

import "fmt"

func main() {
  fmt.Println("Hello, world!");
}
EOF

echo "Changing directory ..."
cd "$PROJECT_DIR" || exit 1

echo "Initializing Go module ..."
go mod init "$MODULE_NAME"

echo "Initializing git ..."
git init "$PROJECT_DIR"

echo "Project setup completed at $PROJECT_DIR"
