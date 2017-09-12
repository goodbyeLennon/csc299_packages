#! /usr/bin/bash

# This script was adapted from the Vagrantfile used in CSC299 Fall 2017
# It installs all necessary packages that will be used in the class

apt-get update

apt-get install -y --no-install-recommends emacs24 emacs24-el

# xserver-xorg-legacy is needed for non-root startx with ubuntu 16.04
# https://bugs.launchpad.net/ubuntu/+source/xinit/+bug/1562219
apt-get install -y lxde xserver-xorg-legacy xinit awesome
apt-get install -y virtualbox-guest-dkms virtualbox-guest-utils virtualbox-guest-x11
VBoxClient-all
apt-get remove -y clipit gnome-keyring modemmanager

apt-get install -y \
	bash-completion \
	build-essential \
	bzip2 \
	cmake \
	curl \
	elinks \
	fdupes \
	firejail \
	git-core \
	git-doc \
	glipper \
	htop \
	httpie \
	info \
	jq \
	man-db \
	manpages \
	ninja-build \
	parcellite \
	p7zip-full \
	psmisc \
	rlwrap \
	rsync \
	rxvt-unicode \
	software-properties-common \
	tig \
	tmux \
	tofrodos \
	tree \
	unzip \
	vim \
	vim-doc \
	vim-gtk3 \
	virtualbox-guest-utils \
	virtualbox-guest-x11 \
	wget \
	xkbset \
	zip

# Install chrome browser
# https://github.com/StefanScherer/vagrant-vcloud-box/blob/master/scripts/install-chrome.sh
wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add -
echo "deb http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google.list
apt-get update
apt-get install -y google-chrome-stable

# # https://github.com/StefanScherer/vagrant-vcloud-box/blob/master/scripts/install-node.sh
# mkdir -p /home/ubuntu/tmp
# apt-get install -y nodejs npm
# apt-get install -y nodejs
# ln -s /usr/bin/nodejs /usr/bin/node
# apt-get install -y npm
# npm install -g grunt-cli
# chown -R ubuntu /home/ubuntu/tmp

# Install node
curl -sL https://deb.nodesource.com/setup_8.x | bash -
apt-get install -y nodejs

# Install mist browser
# https://github.com/ethereum/mist
curl https://install.meteor.com/ | sh
# curl -o- -L https://yarnpkg.com/install.sh | bash
curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add -
echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list
apt-get update
apt-get install yarn
yarn global add electron@1.4.15
yarn global add gulp
su -c "git clone https://github.com/ethereum/mist.git && cd mist && yarn" ubuntu

# Install rust
su -c "curl https://sh.rustup.rs -sSf | sh -s -- -y" ubuntu

# Install parity node
bash <(curl https://get.parity.io -Lk)
