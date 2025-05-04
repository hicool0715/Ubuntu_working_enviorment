#!/bin/bash
EXEC_DIR=$PWD
echo "Start to build vim"

. $EXEC_DIR/command-exit.sh

sudo apt-get update -y && sudo apt-get upgrade -y && autoCmdInstall zsh zsh
chsh -s /usr/bin/zsh $USER
autoCmdInstall curl curl  
if [ -f /home/$USER/.zshrc ]; then
  rm ~/.zshrc -rf
fi


# zsh install
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
