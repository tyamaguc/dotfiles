#!/bin/bash

DOTFILES=(
 .agignore
 .emacs.d
 .gemrc
 .gitconfig
 .gitignore
 .pryrc
 .tmux.conf
 .zshrc
)

CURRENT_DIR=`pwd`
ZSH_CUSTOM_DIR=.oh-my-zsh/custom

for dotfile in ${DOTFILES[@]} do
    ln -sf $CURRENT_DIR/$dotfile $HOME/$dotfile
done

for custom_file in $(ls $ZSH_CUSTOM_DIR/*.zsh) do
  ln -sf $CURRENT_DIR/$custom_file $HOME/$custom_file
end
