#!/bin/bash

OS_VERSION=""
case "$(uname -s)" in
	Darwin)
		echo 'install on Mac OS X'
		OS_VERSION="mac"
		;;
	Linux)
		echo 'install on Linux'
		OS_VERSION="linux"
		;;
	CYGWIN*|MINGW32*|MSYS*)
		echo 'install on MS Windows'
		OS_VERSION="win"
		;;
	*)
		echo 'unknow OS exit'
		exit 1;
esac

echo 'prepare folders and links'
ln -s ~/dotfiles/vim ~/.vim
ln -s ~/dotfiles/emacs.d ~/.emacs.d
ln -s ~/dotfiles/tmux.conf ~/.tmux.conf
ln -s ~/dotfiles/zshrc ~/.zshrc
touch ~/dotfiles/localrc
mkdir ~/dotfiles/emacs.d/utils
CONFDIR="~/.config"
if [ ! -d ${CONFDIR} ]; then
	mkdir -p ${CONFDIR}
fi

echo "config i3"
## https://github.com/tobi-wan-kenobi/bumblebee-status/wiki/Available-Modules
# sudo apt-get install i3 suckless-tools #for Debian
# sudo pip install psutil netifaces requests
ln -s ~/dotfiles/i3 ${CONFDIR}/i3
git clone https://github.com/tobi-wan-kenobi/bumblebee-status.git ${CONFDIR}/i3/bumblebee-status

echo "install font"
git clone https://github.com/powerline/fonts.git
cd fonts
./install.sh
cd ../
rm -rf fonts

wget http://central.maven.org/maven2/net/sourceforge/plantuml/plantuml/8059/plantuml-8059.jar -O emacs.d/utils/plantuml.jar
bash ~/.vim/vimrc.sh


