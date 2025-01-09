#!/bin/bash

read -r -p "Enter project name: " PROJECT_NAME
if [[ -z "$PROJECT_NAME" ]]; then
    echo "Error: Project name cannot be empty."
    exit 1
fi

PROJECT_DIR="$(pwd)/$PROJECT_NAME"
SRC_DIR="$PROJECT_DIR/src"

echo "Creating project structure ..."
mkdir "$PROJECT_DIR" || exit 1
mkdir "$SRC_DIR" || exit 1

cat > "$SRC_DIR/index.ts" << EOF
console.log("Hello, world!");
EOF

echo "Initializing npm ..."
cd "$PROJECT_DIR" || exit 1
npm init -y

echo "Installing TypeScript ..."
npm install --save-dev typescript @types/node

echo "Generating npm scripts ..."
TMP_PACKAGE_JSON=$(mktemp)

jq '.scripts.start = "tsc && node build/index.js"' package.json > "$TMP_PACKAGE_JSON" && mv "$TMP_PACKAGE_JSON" package.json

echo "Generating tsconfig.json ..."
cat > tsconfig.json << EOF
{
  "compilerOptions": {
    "target": "ES6",
    "module": "commonjs",
    "outDir": "./build",
    "rootDir": "./src",
    "strict": true
  }
}
EOF

echo "Project setup completed at $PROJECT_DIR"
