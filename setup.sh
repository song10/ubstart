#!/bin/sh

INSDIR=`pwd`

# ensure latest git installed
type git > /dev/null

if [ "$0" != "0" ]; then
	sudo add-apt-repository ppa:git-core/ppa
	sudo apt-get update
	sudo apt-get -y install git
fi

# get ~ (ubhome.git)
cd $INSDIR
if test -d .git; then
	git pull --rebase
else
	git init
	git remote add origin https://github.com/song10/ubhome.git
	git fetch origin
	git checkout -b master origin/master
fi

# get ~/bin (bin.git)
cd $INSDIR
if test -d bin/.git; then
	cd ~/bin
	git pull --rebase
else
	git clone https://github.com/song10/bin.git
fi

# get ~/wrk/ubfavor (ubfavor.git)
if [ "all" = "$1" ]; then
	cd $INSDIR
	mkdir -p wrk
	cd wrk
	if test -d ubfavor/.git; then
		cd ubfavor
		git pull --rebase
	else
		git clone https://github.com/song10/ubfavor.git
	fi
fi

# finish
exec bash
