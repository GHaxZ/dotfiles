#!/usr/bin/env bash

# Define color codes
RED='\033[0;31m'
GREEN='\033[0;32m'
NC='\033[0m' # No Color

# Prompt the user to enter the language or command
echo -e "${GREEN}Enter language or command (! for commands)${NC}"
read -p "-> " selected

if [[ -z $selected ]]; then
    exit 0
fi

# Prompt the user to enter the query
echo -e "${GREEN}Enter Query${NC}"
read -p "-> " query

# Construct the URL based on input
if [[ $selected == !* ]]; then
    selected=${selected:1}  # Remove the leading "!"
    url="cht.sh/$selected~$query"
else
    query=$(echo $query | tr ' ' '+')
    url="cht.sh/$selected/$query"
fi

# Fetch the output from the URL
output=$(curl -s "$url")

# Check if the output is empty or contains "404 NOT FOUND" and display appropriate message
if [[ -z $output ]] || [[ $output == *"404 NOT FOUND"* ]]; then
    echo -e "${RED}Nothing found${NC}"
    exit 0
fi

# Open the output with less in a new tmux window
tmux neww bash -c "echo \"$output\" | less -r"
