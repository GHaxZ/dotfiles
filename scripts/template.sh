#!/bin/bash

FILE_PATH="$HOME/scripts/templates/"

selected=$(find "$FILE_PATH" -name "*.sh" \
        | sed 's|.*/||;s|\.sh$||' \
    | fzf)

if [[ -n $selected ]]; then
    file=$(find "$FILE_PATH" -name "$selected.sh")
    sh "$file"
fi
