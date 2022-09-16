#!/bin/bash

echo "Start to build working enviorent"
sudo apt-get update && sudo apt-get upgrade || exit 1
sudo apt-get install git tmux zsh vim curl
echo "set zsh"
chsh -s /usr/bin/zsh $USER
echo "ln profiles"
rm ~/.vimrc -rf
rm ~/.zshrc -rf
rm ~/.tmux.conf -rf
ln -s ./vimrc.file ~/.vimrc
ln -s ./zshrc.file ~/.zshrc
ln -s ./tmux.conf.file ~/.tmux.conf
echo "Install some enviorments"
curl -fLo ~/.vim/autoload/plug.vim --create-dirs   https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

git clone https://github.com/zsh-users/zsh-autosuggestions.git $ZSH_CUSTOM/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git  $ZSH_CUSTOM/plugins/zsh-syntax-highlighting
git clone https://github.com/jeffreytse/zsh-vi-mode $ZSH_CUSTOM/plugins/zsh-vi-mode


echo "Build working enviorment finished"
