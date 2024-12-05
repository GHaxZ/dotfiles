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
SRC_DIR="$PROJECT_DIR/src"
TARGET_DIR="$PROJECT_DIR/target"

echo "Creating project structure ..."
mkdir "$PROJECT_DIR" || exit 1
mkdir "$SRC_DIR" || exit 1

cat > "$SRC_DIR/main.c" << EOF
#include <stdio.h>

int main(int argc, char **argv) {
  printf("Hello, world!\n");

  return 0;
}
EOF

echo "Generating scripts ..."
cat > "$PROJECT_DIR/build.sh" << EOF
#!/bin/sh

# Settings
BINARY="$PROJECT_NAME"
TARGET_DIR="./$(get_relative_path "$PROJECT_DIR" "$TARGET_DIR")"
SRC_DIR="./$(get_relative_path "$PROJECT_DIR" "$SRC_DIR")"
LIBRARIES=()

# Create output directory if it doesn't exist
mkdir -p "\$TARGET_DIR"

# Clean files inside target directory
rm -f "\$TARGET_DIR/"*

# Find all .c files in the source path
FILES=\$(find "\$SRC_DIR" -name "*.c" | paste -sd " ")

# Prepare library arguments
LIBRARIES_ARGS=""
for LIB in "\${LIBRARIES[@]}"; do
    LIBRARIES_ARGS="\$LIBRARIES_ARGS -l\$LIB"
done

# Compile
if [ -n "\$FILES" ]; then
    gcc \$FILES \$LIBRARIES_ARGS -o "\$TARGET_DIR/\$BINARY" || exit 1
else
    echo "No source files found in \$SRC_DIR."
    exit 1
fi

echo "Build completed successfully. Executable: \$TARGET_DIR/\$BINARY"
EOF

echo "Initializing git ..."
git init "$PROJECT_DIR"

cat > "$PROJECT_DIR/.gitignore" << EOF
$(get_relative_path "$PROJECT_DIR" "$TARGET_DIR")/
EOF

echo "Project setup completed at $PROJECT_DIR"
