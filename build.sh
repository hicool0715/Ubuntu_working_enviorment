#/bin/bash
EXEC_DIR=$PWD
echo "Start to build working enviorent"
sudo apt-get update && sudo apt-get upgrade || exit 1
sudo apt-get install git tmux zsh vim curl trash-cli
echo "set zsh"
#chsh -s /usr/bin/zsh $USER
echo "ln profiles"
rm ~/.vimrc -rf
rm ~/.zshrc -rf
rm ~/.tmux.conf -rf
ln -s $EXEC_DIR/vimrc.file ~/.vimrc
ln -s $EXEC_DIR/zshrc.file ~/.zshrc
ln -s $EXEC_DIR/tmux.conf.file ~/.tmux.conf
echo "Install some enviorments"

# vim install
mkdir -p /tmp/vim_build_dir
cd /tmp/vim_build_dir
curl -fLo ~/.vim/autoload/plug.vim --create-dirs   https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
git clone https://github.com/vim/vim.git 
cd vim 
sudo apt-get install libncurses5-dev libgnome2-dev libgnomeui-dev \
	    libgtk2.0-dev libatk1.0-dev libbonoboui2-dev \
			    libcairo2-dev libx11-dev libxpm-dev libxt-dev python-dev \
					    python3-dev ruby-dev lua5.1 lua5.1-dev git
./configure --with-features=huge \
						--enable-multibyte \
				    --enable-rubyinterp \
   	        --enable-pythoninterp \
	          --with-python-config-dir=/usr/lib/python2.7/config-x86_64-linux-gnu \
				    --with-python3-config-dir=/usr/lib/python3.6/config-3.6m-x86_64-linux-gnu \
            --enable-perlinterp \
            --enable-luainterp \
            --enable-gui=gtk2 --enable-cscope --prefix=/usr/local/
make `cat /proc/cpuinfo`| grep "processor"| wc -l
sudo make install
sudo mv /usr/bin/vim usr/bin/vim-default
CURR_USER=$USER
# zsh install
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
echo "install zsh plugins"
git clone https://github.com/zsh-users/zsh-autosuggestions.git /home/$USER/.oh-my-zsh/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git  /home/$USER//.oh-my-zsh/plugins/zsh-syntax-highlighting
git clone https://github.com/jeffreytse/zsh-vi-mode /home/$USER//.oh-my-zsh/plugins/zsh-vi-mode

sudo apt-get install ctags
su root
curl -sL https://install-node.vercel.app/lts | bash
su $CURR_USER
echo "Build working enviorment finished"
