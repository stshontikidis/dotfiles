#!/bin/bash

xdg_config = [[ -d $HOME/.config ]]

# Init submodules in dotfile repo
cd $HOME/.dotfiles && git submodule update --init --recursive

# link rcs
if [[ -f $HOME/.vimrc ]] && [[ ! -L $HOME/.vimrc ]] ; then
  echo "Moving current vimrc to .vimrc.bak"
  mv $HOME/.vimrc $HOME/.vimrc.bak
fi

if [[ -d $HOME/.vim ]] && [[ ! -L $HOME/.vim ]] ; then
  echo "Creating backup of vim dir"
  mv $HOME/.vim $HOME/.vim.bak
fi

if [[ -d $HOME/.config/nvim ]] && [[ ! -L $HOME/.config/nvim ]] ; then
  echo "Creating backup of nvim dir"
  mv $HOME/.config/nvim $HOME/.config/nvim.bak
fi


echo "Adding symlinks for VIM"
ln -sf $HOME/.dotfiles/vim $HOME/.vim
ln -sf $HOME/.dotfiles/vimrc $HOME/.vimrc

if $xdg_config; then
  echo "Adding symlinks for nVIM"
  ln -sf $HOME/.dotfiles/vim $HOME/.config/nvim
  ln -sf $HOME/.dotfiles/vimrc $HOME/.config/nvim/init.vim
fi

tmux_dir = $HOME
if $xdg_config; then
  tmux_dir = $XDG_CONFIG_HOME/tmux
fi

if [[ -f $HOME/.tmux.conf ]] && [[ ! -L $HOME/.tmux.conf ]]; then
  echo "Moving current tmux.conf to .tmux.conf.bak"
  mv $/HOME/.tmux.conf .tmux.conf.bak
fi

if [[ -d $HOME/.tmux ]] && [[ ! -L $HOME/.tmux ]]; then
  echo "Creating backup of tmux dir"
  tmux $HOME/.tmux $HOME/.tmux.bak
fi
echo "Adding symlinks for tmux"

ln -sf $HOME/.dotfiles/tmux $HOME/.tmux
ln -sf $HOME/.dotfiles/tmux.conf $HOME/.tmux.conf

if [[ -f $HOME/.zshrc ]] && [[ ! -L $HOME/.zshrc ]]; then
  echo "Creating backup of zshrc to .zshrc.bak"
  mv $HOME/.zshrc $HOME/.zshrc.bak
fi

echo "Adding symlink for zshrc"
ln -sf $HOME/.dotfiles/zshrc $HOME/.zshrc

#Install ohmyzsh which should also promp for shell change
if [[ -d $HOME/.oh-my-zsh ]]; then
  echo "Oh-My-ZSH already installed"
else
  sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh) --keep-zshrc"
fi

