# If you come from bash you might have to change your $PATH.
export GOPATH="$HOME/sandbox/go"
scripts="$HOME/.dotfiles/scripts"
# Docker on work laptop did not link so trying this for a bit
docker_path="/Applications/Docker.app/Contents/Resources/bin/"
export PATH="$HOME/bin:/usr/local/opt/python/libexec/bin:$GOPATH/bin:$scripts:/usr/local/bin:$PATH:/Applications/Visual Studio Code.app/Contents/Resources/app/bin:$docker_path"
#
# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"
# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="spaceship"

ZSH_CUSTOM="$HOME/.dotfiles/oh-my-zsh/custom"
plugins=(git zsh-syntax-highlighting)

source $ZSH/oh-my-zsh.sh

# User configuration


# Alias section
alias venv="source ~/venv/bin/activate"
alias htbconn="cd ~/htb/vpn && openvpn 0lhad0.ovpn"
alias devup="work_tmux.sh"
# env section
export VISUAL="vim"
export EDITOR="$VISUAL"
[[ ! -z $(command -v docker) ]] && export DOCKER_API_VERSION=$(docker version --format="{{.Client.APIVersion}}")

# Spaceship prompt settings
export SPACESHIP_PROMPT_ORDER=(user host dir git venv pyenv golang docker node exec_time line_sep  char)
export SPACESHIP_DIR_TRUNC=4
export SPACESHIP_DIR_TRUNC_PREFIX="../"
export SPACESHIP_USER_SHOW="always"
export SPACESHIP_USER_COLOR=093
export SPACESHIP_GOLANG_COLOR="yellow"

# Edit command in vim
autoload edit-command-line; zle -N edit-command-line
bindkey '^\' edit-command-line

#Attempt to disable venv prompt
VIRTUAL_ENV_DISABLE_PROMPT='y'

# Pyenv stuff
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"

if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init -)"
fi

# If you want to override anything add it to local_overrides
[ -f "$HOME/.local/zsh.overrides" ] && source "$HOME/.local/zsh.overrides"


# DE NVM - Start

# nvm does not work well when there's a symlink in this path: https://github.com/nvm-sh/nvm/issues/617
export DE_NVM_DIR="$(cd "/Users/STshontikidis/de-sandbox/apps/de_nvm"; pwd -P)"
[ -s "${DE_NVM_DIR}/scripts/nvm.sh" ] && \. "${DE_NVM_DIR}/scripts/nvm.sh"


# place this after nvm initialization!
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


# DE NVM - End
