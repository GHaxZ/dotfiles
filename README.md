## _GHaxZ's dotfiles 🛠️_

#### This is a collection of my personal "[dotfiles](https://wiki.archlinux.org/title/Dotfiles)".

<br>

## Included are

#### _Configurations for my terminal development workflow:_

- ##### [kitty](https://github.com/kovidgoyal/kitty) - My terminal emulator of choice
- ##### [neovim](https://github.com/neovim/neovim) - A code editor and (almost) IDE
- ##### [tmux](https://github.com/tmux/tmux) - A [terminal multiplexer](https://en.wikipedia.org/wiki/Terminal_multiplexer)

#### _Shell configurations:_

- ##### [zsh](https://github.com/zsh-users/zsh) - My UNIX shell of choice
- ##### [oh-my-posh](https://github.com/jandedobbeleer/oh-my-posh) - A cross-shell prompt
- ##### [fastfetch](https://github.com/fastfetch-cli/fastfetch) - A pretty (and fast) system info fetching tool, so I can get imaginary internet points

#### _And other cool tools like:_

- ##### [spicetify](https://github.com/spicetify/cli) - A tool for customizing the Spotify desktop client

#### _Also, a collection of shell scripts I wrote (or stole and modified):_

- ##### [cpuinfo.sh](https://github.com/GHaxZ/dotfiles/blob/master/scripts/cpuinfo.sh), [raminfo.sh](https://github.com/GHaxZ/dotfiles/blob/master/scripts/raminfo.sh), [batteryinfo.sh](https://github.com/GHaxZ/dotfiles/blob/master/scripts/batteryinfo.sh) - Display system status in a nice way
- ##### [cheat.sh](https://github.com/GHaxZ/dotfiles/blob/master/scripts/cheat.sh) - Integrate the community driven [cheat.sh knowledgebase](https://cheat.sh/) into tmux
- ##### [update.sh](https://github.com/GHaxZ/dotfiles/blob/master/scripts/update.sh) - A neat little Linux system update script (currently openSUSE Tumbleweed only, can be easily modified for other distributions)

#### _... and old configurations I used in the past_

<br>

## Installation

### Automatic installation
#### Install all necessarry packages + dotfiles with one script

```

 curl -s https://raw.githubusercontent.com/GHaxZ/dotfiles/master/setup.sh | sudo bash

```
> [!IMPORTANT]  
> This script currently only works on openSUSE. It can be easily modifed to work on other distributions, by cloning this repository and changing the config values at the top.

<br>

### Manual installation
#### Only install the dotfiles
Prerequisites:

- [git](https://git-scm.com/)
- [stow](https://www.gnu.org/software/stow/)

#### 1. Clone the repository into your home directory

```

 git clone https://github.com/GHaxZ/dotfiles.git ~/dotfiles

```

#### 2. Go inside the directory

```

 cd ~/dotfiles

```

#### 3. Run stow for this directory

```

 stow .

```

#### 4. Done!

<br>

> [!NOTE]
> You may need to restart your shell/terminal and other programs involved for the changes to take effect.
