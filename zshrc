# If you come from bash you might have to change your $PATH.
export PATH="$HOME/bin:/usr/local/opt/python/libexec/bin:/usr/local/bin:$PATH:/Applications/Visual Studio Code.app/Contents/Resources/app/bin"

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"
# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="kayid"

ZSH_CUSTOM="$HOME/.dotfiles/oh-my-zsh/custom"
plugins=(git zsh-autosuggestions zsh-syntax-highlighting)

source $ZSH/oh-my-zsh.sh

# User configuration

# DE NVM - Start
if [ -d "$HOME/de-sandbox" ]
then
	export DE_NVM_DIR="/Users/stshontikidis/de-sandbox/apps/de_nvm"
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
fi

# DE NVM - End

# Alias section
alias venv="source ~/venv/bin/activate"
alias htbconn="cd ~/htb/vpn && openvpn 0lhad0.ovpn"

# env section
export VISUAL="vim"
export EDITOR="$VISUAL"

# Edit command in vim
autoload edit-command-line; zle -N edit-command-line
bindkey '^e' edit-command-line

#Attempt to disable venv prompt
VIRTUAL_ENV_DISABLE_PROMPT='y'

if [ -d "$HOME/.pyenv" ]
then
	export PATH="$HOME/.pyenv/bin:$PATH"

	eval "$(pyenv init -)"
	eval "$(pyenv virtualenv-init -)"
fi
