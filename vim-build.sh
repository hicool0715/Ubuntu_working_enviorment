#!/bin/bash
EXEC_DIR=$PWD
echo "Start to build vim"
if [ -f /home/$USER/.vimrc ]; then
  rm ~/.vimrc -rf
fi

ln -s $EXEC_DIR/vimrc.file ~/.vimrc

VIM_BUILD_DIR=/tmp/vim_build_dir

if [ ! -d $VIM_BUILD_DIR ]; then
  mkdir -p 
fi

cd $VIM_BUILD_DIR

. $EXEC_DIR/command-exit.sh
autoCmdInstall curl curl
autoCmdInstall git git

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
make -j`cat /proc/cpuinfo| grep "processor"| wc -l`
sudo make install

if [ -f /usr/bin/vim ]; then
  sudo mv /usr/bin/vim usr/bin/vim-default
fi

sudo apt-get install ctags

echo "nodejs need to be installed in root, not sudo"
echo "please run this command: "
echo "curl -sL https://install-node.vercel.app/lts | bash"
ehco "to isntall nodejs"