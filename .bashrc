###########
# .bashrc #
###########

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
alias img="freeze -c user"
alias ls="eza --color=always --git --icons=always"
alias open="xdg-open 2>/dev/null"
eval $(thefuck --alias)

# File aliases
alias src="source $HOME/.bashrc"
alias bashrc="nvim $HOME/.bashrc"

# Machine specific aliases
alias update="sudo $HOME/.local/bin/update.sh"
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
export EDITOR='nvim'

# Don't store duplicate commands in history and ignore commands with spaces
export HISTCONTROL=erasedups:ignoredups:ignorespace

#################
# Shell options #
#################

# Check window size after each command and update LINES and COLUMNS values
shopt -s checkwinsize

####################
# Startup commands #
####################

# Attach to "main" tmux session
if [ -n "$PS1" ] && [ -z "$TMUX" ]; then
  # Attempt to attach to an existing session named "main"
  tmux attach -t main || tmux new-session -s main
fi

# Run a neofetch
neofetch

# Add cargo to path
. "$HOME/.cargo/env"

export PATH="$HOME/go/bin:$PATH"
export PATH="$HOME/scripts:$PATH"

# Initialize zoxide
eval "$(zoxide init bash)"

# Initialize the prompt
eval "$(oh-my-posh init bash --config ~/.config/oh-my-posh/themes/custom/zen_rose-pine.json)"

###############
# Other stuff #
###############
