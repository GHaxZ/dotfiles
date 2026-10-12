###########
# .bashrc #
###########

###########
# Aliases #
###########

# Get current git branch, used for prompt
git_branch() {
    if git rev-parse --is-inside-work-tree >/dev/null 2>&1; then
        local ref
        ref=$(git symbolic-ref --short HEAD 2>/dev/null || git rev-parse --short HEAD 2>/dev/null)
        if [[ -n "$ref" ]]; then
            printf '\001\e[38;5;250m\002⎇ %s\001\e[0m\002' "$ref"
        fi
    fi
}

# Print a blank line before each prompt
PROMPT_COMMAND='echo'

PS1='\[\e[36m\]\w\[\e[0m\] $(git_branch)\n\[\e[33m\]❱\[\e[0m\] '

# Aliases for modified commands
alias cp="cp -i"
alias mv="mv -i"
if type bat >/dev/null 2>&1; then
    alias cat="bat"
fi
alias c="clear"
alias x="exit"

# Program aliases
alias neofetch="fastfetch"
alias v="nvim"
if type "eza" > /dev/null; then
    alias ls="eza --color=always --git --icons=always"
fi
alias open="xdg-open 2>/dev/null"

# File aliases
alias src="source $HOME/.bashrc"
alias bashrc="nvim $HOME/.bashrc"

# Machine specific aliases
alias update="sudo $HOME/scripts/update.sh"

#############
# Functions #
#############

# Remap cd to z and run ls after each cd
cd() {
    if [ -n "$1" ]; then
        z "$@" && ls
    else
        z ~ && ls
    fi
}

# Extracts any archive(s)
extract() {
    for archive in "$@"; do
        if [ -f "$archive" ]; then
            case $archive in
                *.tar.bz2) tar xvjf $archive ;;
                *.tar.gz) tar xvzf $archive ;;
                *.bz2) bunzip2 $archive ;;
                *.rar) rar x $archive ;;
                *.gz) gunzip $archive ;;
                *.tar) tar xvf $archive ;;
                *.tbz2) tar xvjf $archive ;;
                *.tgz) tar xvzf $archive ;;
                *.zip) unzip $archive ;;
                *.Z) uncompress $archive ;;
                *.7z) 7z x $archive ;;
                *) echo "don't know how to extract '$archive'..." ;;
            esac
        else
            echo "'$archive' is not a valid file!"
        fi
    done
}

# Copy and go to the directory
cpg() {
    if [ -d "$2" ]; then
        cp "$1" "$2" && cd "$2"
    else
        cp "$1" "$2"
    fi
}

# Move and go to the directory
mvg() {
    if [ -d "$2" ]; then
        mv "$1" "$2" && cd "$2"
    else
        mv "$1" "$2"
    fi
}

# Create and go to the directory
mkdirg() {
    mkdir -p "$1"
    cd "$1"
}

# Goes up a specified number of directories  (for example up 4)
up() {
    local d=""
    limit=$1
    for ((i = 1; i <= limit; i++)); do
        d=$d/..
    done
    d=$(echo $d | sed 's/^\///')
    if [ -z "$d" ]; then
        d=..
    fi
    cd $d
}


#################
# Shell options #
#################

# Check window size after each command and update LINES and COLUMNS values
shopt -s checkwinsize

####################
# Startup commands #
####################

session_name="main"

# Only run in interactive shells and when NO_TMUX is not set
if [[ $- == *i* ]] && [[ -z "$NO_TMUX" ]]; then
    if ! tmux has-session -t "$session_name" 2>/dev/null; then
        TMUX='' tmux new-session -d -s "$session_name" -c "$HOME"
    fi

    if [[ -z "$TMUX" ]]; then
        tmux attach -t "$session_name"
    else
        tmux switch-client -t "$session_name"
    fi
fi

################
# PATH exports #
################
export PATH="$HOME/go/bin:$PATH"

export PATH="$HOME/scripts:$PATH"

export PATH="$HOME/.spicetify:$PATH"

##########################
# Exported env variables #
##########################

# Don't store duplicate commands in history and ignore commands with spaces
export HISTCONTROL=erasedups:ignoredups:ignorespace

# Set default editor
if [[ -n $SSH_CONNECTION ]]; then
    export EDITOR='vim'
else
    export EDITOR='nvim'
fi

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# Add homebrew to path
if [ -f "/home/linuxbrew/.linuxbrew/bin/brew" ]; then
    eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
fi

# Initialize zoxide
if type "zoxide" > /dev/null; then
    eval "$(zoxide init bash)"
fi

# Source cargo
if [ -f "$HOME/.cargo/env" ]; then
    . "$HOME/.cargo/env"
fi

# Source Nix
if [ -e $HOME/.nix-profile/etc/profile.d/nix.sh ]; then . $HOME/.nix-profile/etc/profile.d/nix.sh; fi

# Run a neofetch
neofetch

###############
# Other stuff #
###############
