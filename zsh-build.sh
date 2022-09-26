#!/bin/bash
EXEC_DIR=$PWD
echo "Start to build vim"
sudo apt-get update && sudo apt-get upgrade && sudo apt-get instal zsh
if [ -f /home/$USER/.zshrc ]; then
  rm ~/.zshrc -rf
fi

ln -s $EXEC_DIR/zshrc.file ~/.zshrc

# zsh install
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
echo "install zsh plugins"

. $EXEC_DIR/command-exit.sh
autoCmdInstall git git

git clone https://github.com/zsh-users/zsh-autosuggestions.git /home/$USER/.oh-my-zsh/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git  /home/$USER//.oh-my-zsh/plugins/zsh-syntax-highlighting
git clone https://github.com/jeffreytse/zsh-vi-mode /home/$USER//.oh-my-zsh/plugins/zsh-vi-mode

autoCmdInstall trash trash-cli

echo "ZSH install finished"

echo "Change to zsh or later (Y/N)"
read anwser
if [ $anwser -ne "Y" ]; then
  exit 0
fi
chsh -s /usr/bin/zsh $USER