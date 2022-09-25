#!/bin/bash
echo "Build neovim your cmake version master be grater then 3.10(Y/N)"
read anwers
if [ "$anwers" != "Y" ]; then 
	exit 1
fi


TMP_DIR=/tmp/neovim_build_tmp
if [ ! -d $TMP_DIR ]; then
	mkdir -p $TMP_DIR
fi
cd $TMP_DIR
sudo apt-get update && sudo apt-get upgrade
sudo apt-get install ninja-build gettext libtool libtool-bin autoconf automake cmake g++ pkg-config unzip curl doxygen
if [ ! -d neovim ]; then
git clone https://github.com/neovim/neovim 
fi

git checkout stable .

#这傻逼玩意编译脚本在/usr/local/bin下找cmake 还是绝对路径
if [ ! -f /usr/local/bin/cmake ]; then
	sudo ln -s /usr/bin/cmake /usr/local/bin/cmake
fi
cd neovim && make CMAKE_BUILD_TYPE=RelWithDebInfo
sudo make install  -j`cat /proc/cpuinfo| grep "processor"| wc -l`

echo "Build neovim plugs(Y/N)"
read anwers
if [ "$anwers" != "Y" ]; then 
	exit 1
fi

sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
      https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

if [ ! -d /home/$USER/.config/nvim ]; then
	mkdir -p /home/$USER/.config/nvim
fi



