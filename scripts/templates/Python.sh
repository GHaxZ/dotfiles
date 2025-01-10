#!/bin/bash

get_relative_path() {
    local from=$(realpath "$1")
    local to=$(realpath "$2")

    while [[ "$to" != "$from"* ]]; do
        from=$(dirname "$from")
        echo "../"
    done

    echo "${to#"$from"/}"
}

read -r -p "Enter project name: " PROJECT_NAME
if [[ -z "$PROJECT_NAME" ]]; then
    echo "Error: Project name cannot be empty."
    exit 1
fi

PROJECT_DIR="$(pwd)/$PROJECT_NAME"
VENV_DIR="$PROJECT_DIR/.venv"

read -r -p "Main file (main.py): " MAIN_FILE
if [[ -n "$MAIN_FILE" ]]; then
    if [[  "$MAIN_FILE" == *.py  ]]; then
        MAIN_FILE="$PROJECT_DIR/$MAIN_FILE"
    else
        MAIN_FILE="$PROJECT_DIR/$MAIN_FILE.py"
    fi
else
    MAIN_FILE="$PROJECT_DIR/main.py"
fi

echo "Creating project structure ..."
mkdir "$PROJECT_DIR" || exit 1

cat > "$MAIN_FILE" << EOF
print("Hello, world!")
EOF

echo "Creating virtual environment ..."
python3 -m venv "$VENV_DIR" || exit 1

echo "Activating virtual environment ..."
source "$VENV_DIR/bin/activate" || exit 1

echo "Generating scripts ..."
cat > "$PROJECT_DIR/run.sh" << EOF
#!/bin/sh

# Run project using virtual environment

MAIN_FILE="$(get_relative_path "$PROJECT_DIR" "$MAIN_FILE")"

if [ -z "\$VIRTUAL_ENV" ]; then
  source "$(get_relative_path "$PROJECT_DIR" "$VENV_DIR")/bin/activate"
fi

python3 \$MAIN_FILE \$@
EOF

chmod +x "$PROJECT_DIR/run.sh"

cat > "$PROJECT_DIR/pip.sh" << EOF
#!/bin/sh

# Manage packages in virtual environments
# Use as if it was the "pip" command

if [ -z "\$VIRTUAL_ENV" ]; then
  source "$(get_relative_path "$PROJECT_DIR" "$VENV_DIR")/bin/activate"
fi

COMMAND="pip \$@"

echo "\$COMMAND"
echo ""

\$COMMAND
EOF

chmod +x "$PROJECT_DIR/pip.sh"

echo "Initializing git ..."
git init "$PROJECT_DIR"

cat > "$PROJECT_DIR/.gitignore" << EOF
$(get_relative_path "$PROJECT_DIR" "$VENV_DIR")/
EOF

echo "Project setup completed at $PROJECT_DIR"
