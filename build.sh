#!/bin/bash

echo "Start to build working enviorent"
sudo apt-get update && sudo apt-get upgrade || exit 1
sudo apt-get install git tmux zsh vim
chsh -s /usr/bin/zsh $USER
ln -s ./vim ~/.vim
ln -s ./vimrc.file ~/.vimrc
ln -s ./zshrc.file ~/.zshrc
ln -s ./oh-my-zsh ~/.oh-my-zsh
ln -s ./tmux.conf.file ~/.tmux.conf
echo "Build working enviorment finished"
