# ZSH defaults
setopt appendhistory autocd

# zplug settings
source /usr/share/zsh/scripts/zplug/init.zsh

# oh-my-zsh
zplug "plugins/git",   from:oh-my-zsh
zplug "plugins/common-aliases", from:oh-my-zsh
zplug "lib/history", from:oh-my-zsh
zplug "lib/completion", from:oh-my-zsh
zplug "lib/theme-and-appearance", from:oh-my-zsh

# prezto
zplug "modules/history-substring-search", from:prezto

# zsh-users
zplug "zsh-users/zsh-syntax-highlighting", defer:2

# themes
zplug denysdovhan/spaceship-prompt, use:spaceship.zsh, from:github, as:theme

# Install plugins if there are plugins that have not been installed
if ! zplug check --verbose; then
    printf "Install? [y/N]: "
    if read -q; then
        echo; zplug install
    fi
fi

zplug load
# Run wal cache
(cat ~/.cache/wal/sequences &)

# Alias to set execute wal
alias bw="wal -i ~/.config/wall.png"

# Default editor
export VISUAL="vim"

# Set terminal to urxvt or termite
#export TERMINAL="termite"

# Cowsay path
export COWPATH=$HOME/.config/cowsay:/usr/share/cows
# Add some fun to the shell
#cowthink -f nyan weeeeeeeeeeeeeeeeeeeeeeeeeeee | lolcat
figlet -f ansi_shadow Hellraiser| lolcat 

# prompt settings
SPACESHIP_PROMPT_ORDER=(
  time          # Time stampts section
  user          # Username section
  host          # Hostname section
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

# Setup Git alias for dotfiles managemnet
alias config='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'

# Function to scan for passed ssid
function scanWifi() {
	sudo iwlist wlp3s0 scan | grep -i $1
}
