#!/bin/bash

ln -s ~/dotfiles/vim ~/.vim
ln -s ~/dotfiles/emacs.d ~/.emacs.d
ln -s ~/dotfiles/tmux.conf ~/.tmux.conf
ln -s ~/dotfiles/zshrc ~/.zshrc
mkdir ~/dotfiles/emacs.d/utils
wget http://central.maven.org/maven2/net/sourceforge/plantuml/plantuml/8059/plantuml-8059.jar -O emacs.d/utils/plantuml.jar
sh ~/.vim/vimrc.sh
