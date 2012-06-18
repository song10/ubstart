#!/bin/sh

# get git installed
$(which git) || \
	sudo apt-get install -y \
		git \

# get ~ (ubhome.git)
cd
if test -d .git; then
	git pull --rebase
else
	git init
	git remote add origin https://github.com/song10/ubhome.git
	git fetch origin
	git checkout -b master origin/master
	. .bashrc
fi

# get ~/bin (bin.git)
cd
if test -d bin/.git; then
	cd ~/bin
	git pull --rebase
else
	git clone https://github.com/song10/bin.git
fi

# get ~/wrk/ubfavor (ubfavor.git)
cd
mkdir -p wrk
cd wrk
if test -d ubfavor/.git; then
	cd ubfavor
	git pull --rebase
else
	git clone https://github.com/song10/ubfavor.git
fi

if false; then
sudo apt-get install -y \
	build-essential \
	linux-headers-generic \
	git \
fi
