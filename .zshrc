#############
# oh-my-zsh #
#############

export ZSH="$HOME/.oh-my-zsh"

# ZSH_THEME="robbyrussell"

plugins=(
  git
  zsh-syntax-highlighting
  sudo
  gh
  safe-paste
  web-search
)

ZSH_WEB_SEARCH_ENGINES=(
    yt "https://www.youtube.com/results?search_query="
    crates "https://crates.io/search?q="
    brave "https://search.brave.com/search?q="
)
source $ZSH/oh-my-zsh.sh
###########
# Aliases #
###########

# Aliases for modified commands
alias cp="cp -i"
alias mv="mv -i"
alias cat="bat"
alias c="clear"
alias x="exit"

# Program aliases
alias neofetch="fastfetch"
alias v="nvim"
alias ls="eza --color=always --git --icons=always"
alias open="xdg-open 2>/dev/null"

# File aliases
alias src="source $HOME/.zshrc"
alias zshrc="nvim $HOME/.zshrc"

# Machine specific aliases
alias update="sudo $HOME/scripts/update.sh"
alias notes="cd ~/notes/ && nvim ./index.norg"
alias chad="java -jar $HOME/JChad/JChad-client.jar"
alias raspi="ssh ghaxz@192.168.178.75"

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

##########################
# Exported env variables #
##########################

# Set default editor
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='nvim'
fi

#################
# Shell options #
#################

# Check window size after each command and update LINES and COLUMNS values
# Not a thing in zsh
# setopt checkwinsize

# Share history across all sessions
setopt SHARE_HISTORY

# Avoid duplicate entries in history
setopt HIST_IGNORE_ALL_DUPS

# Append history rather than overwrite
setopt APPEND_HISTORY

# Correct minor typos in path names when changing directories
setopt CORRECT

# Extended globbing
setopt EXTENDED_GLOB

####################
# Startup commands #
####################

# Set the main session name
session_name="main"

# If the "NO_TMUX" variable is not set
if [[ -z "$NO_TMUX" ]]; then
  tmux has-session -t $session_name 2>/dev/null
  if [[ $? -ne 0 ]]; then
    TMUX='' tmux new-session -d -s "$session_name"
  fi

  if [[ -z "$TMUX" ]]; then
    tmux attach -t "$session_name"
  else
    tmux switch-client -t "$session_name"
  fi
fi

# Run a neofetch
neofetch

# Add cargo to path
. "$HOME/.cargo/env"

# Add homebrew to path
eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"

# Initialize zoxide
eval "$(zoxide init zsh)"

# Initialize the prompt
eval "$(oh-my-posh init zsh --config ~/.config/oh-my-posh/themes/custom/zen_rose-pine.json)"

###############
# Other stuff #
###############

export PATH=$PATH:/home/ghaxz/.spicetify

export PATH="$HOME/go/bin:$PATH"

export PATH="$HOME/scripts:$PATH"

export PATH="$HOME/.spicetify:$PATH"

eval $(thefuck --alias)
