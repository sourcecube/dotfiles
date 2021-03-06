# ZSH defaults
setopt appendhistory autocd

# Source aliases and functions
source $HOME/.zsh_aliases
source $HOME/.zsh_functions

# zplug settings
source /usr/share/zsh/scripts/zplug/init.zsh

# oh-my-zsh
zplug "plugins/git",   from:oh-my-zsh
zplug "plugins/common-aliases", from:oh-my-zsh
zplug "lib/history", from:oh-my-zsh
zplug "lib/completion", from:oh-my-zsh
zplug "lib/theme-and-appearance", from:oh-my-zsh
zplug "plugins/extract", from:oh-my-zsh

# prezto
zplug "modules/history-substring-search", from:prezto

# zsh-users
zplug "zsh-users/zsh-syntax-highlighting", defer:2

# themes
#zplug denysdovhan/spaceship-prompt, use:spaceship.zsh, from:github, as:theme
zplug mafredri/zsh-async, from:github
zplug sindresorhus/pure, use:pure.zsh, from:github, as:theme

# Install plugins if there are plugins that have not been installed
if ! zplug check --verbose; then
    printf "Install? [y/N]: "
    if read -q; then
        echo; zplug install
    fi
fi

zplug load

# Persist wal for new terminals
(cat ~/.cache/wal/sequences &)

# Default editor
export VISUAL="vim"

# Set terminal to urxvt or termite
# export TERMINAL="termite"

# Cowsay path
export COWPATH=$HOME/.config/cowsay:/usr/share/cows
# Add some fun to the shell
# cowthink -f nyan weeeeeeeeeeeeeeeeeeeeeeeeeeee | lolcat
figlet -f ansi_shadow Hellraiser| lolcat 

# prompt settings
SPACESHIP_PROMPT_ORDER=(
#  time          # Time stampts section
#  user          # Username section
#  host          # Hostname section
  dir           # Current directory section
  git           # Git section (git_branch + git_status)
  golang        # Go section
  php           # PHP section
  rust          # Rust section
  docker        # Docker section
  pyenv         # Pyenv section
  kubecontext   # Kubectl context section
  line_sep      # Line break
)


# better yaourt colors
export YAOURT_COLORS="nb=1:pkg=1:ver=1;32:lver=1;45:installed=1;42:grp=1;34:od=1;41;5:votes=1;44:dsc=0:other=1    ;35"

# Rust path
export PATH="$HOME/.cargo/bin:$PATH"

# pip path
export PATH="$HOME/.local/bin:$PATH"

# GoLang
export PATH="/usr/local/go/bin:$PATH"
export GOPATH="$HOME/code/go"
export PATH=$PATH:$(go env GOPATH)/bin

# Node
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# custom scripts
export PATH="$HOME/.scripts:$PATH"
