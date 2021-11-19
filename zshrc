#---------------#
#   OH-MY-ZSH   #
#---------------#
export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="robbyrussell"
DISABLE_AUTO_UPDATE="true"
plugins=(
  git
  npm
  docker
  docker-compose
  zsh-autosuggestions
  zsh-syntax-highlighting
)
source $ZSH/oh-my-zsh.sh


#---------------#
#   Aliasses    #
#---------------#
# Warp
alias wps="warp-cli status"
alias wpc="warp-cli connect"
alias wpd="warp-cli disconnect"

# Get WM_CLASS of program clicked
alias get-class="xprop | grep WM_CLASS "

# Print only neofetch in terminal size=1/4
alias nf="clear && echo '\n\n' && neofetch && echo '\n\n' && xdotool click 4"

# pacman
alias pm="pacman"
# pacman with sudo
alias spm="sudo pacman"
# Search package
alias pmSs="pm -Ss"
# Install package
alias spmS="spm -S"
# Update database of packages
alias spmSy="spm -Sy"
# Force update database of packages
alias spmSyy="spm -Syy"

# ls
alias ls="ls --color=auto"
alias lss="ls -ls | grep"

# clear
alias cl="clear"

# btop
alias btop="sudo btop"

# nethogs
alias nethogs="sudo nethogs"


#---------------#
#    Exports    #
#---------------#
export PATH=$HOME/.local/bin:$PATH
export AUR_PATH=$HOME/aur
export NODE_ENV=development


#---------------#
#      NVM      #
#---------------#
export NVM_DIR="$HOME/.config/nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

autoload -U add-zsh-hook
load-nvmrc() {
  local node_version="$(nvm version)"
  local nvmrc_path="$(nvm_find_nvmrc)"

  if [ -n "$nvmrc_path" ]; then
    local nvmrc_node_version=$(nvm version "$(cat "${nvmrc_path}")")

    if [ "$nvmrc_node_version" = "N/A" ]; then
      nvm install
    elif [ "$nvmrc_node_version" != "$node_version" ]; then
      nvm use
    fi
  elif [ "$node_version" != "$(nvm version default)" ]; then
    echo "Reverting to nvm default version"
    nvm use default
  fi
}
add-zsh-hook chpwd load-nvmrc
load-nvmrc