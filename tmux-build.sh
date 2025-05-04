#!/bin/bash
EXEC_DIR=$PWD
echo "Start to build tmux"
if [ -f /home/$USER/.tmux.conf ]; then
  rm /home/$USER/.tmux.conf -rf
fi

ln -s $EXEC_DIR/tmux.conf.file /home/$USER/.tmux.conf

. $EXEC_DIR/command-exit.sh
autoCmdInstall tmux tmux
