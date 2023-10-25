#!/bin/bash
echo "install zsh plugins"
autoCmdInstall git git

git clone https://github.com/zsh-users/zsh-autosuggestions.git /home/$USER/.oh-my-zsh/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git  /home/$USER//.oh-my-zsh/plugins/zsh-syntax-highlighting
git clone https://github.com/jeffreytse/zsh-vi-mode /home/$USER//.oh-my-zsh/plugins/zsh-vi-mode

autoCmdInstall trash trash-cli
rm ~/.zshrc
ln -s $EXEC_DIR/zshrc.file ~/.zshrc
source ~/.zshrc
echo "ZSH install finished"