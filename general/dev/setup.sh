#!/bin/bash
# Simple setup.sh for configuring Ubuntu 12.04 LTS EC2 instance
# for headless setup. 

sudo apt-get install -y git
sudo apt-get install -y curl
sudo apt-get install -y screen

# Install rlwrap to provide libreadline features with node
# See: http://nodejs.org/api/repl.html#repl_repl
sudo apt-get install -y rlwrap

sudo apt-get install -y vim

# Install emacs24
# https://launchpad.net/~cassou/+archive/emacs
sudo add-apt-repository -y ppa:cassou/emacs
sudo apt-get -qq update
sudo apt-get install -y emacs24-nox emacs24-el emacs24-common-non-dfsg


sudo add-apt-repository ppa:ubuntu-toolchain-r/test
sudo apt-get update
sudo apt-get install -y build-essential
sudo apt-get install -y gcc-4.8
sudo apt-get install -y g++-4.8
sudo apt-get install -y gcc-4.8-multilib
sudo update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-4.8 20
sudo update-alternatives --install /usr/bin/g++ g++ /usr/bin/g++-4.8 20
sudo update-alternatives --config gcc
sudo update-alternatives --config g++


# Install Heroku toolbelt
# https://toolbelt.heroku.com/debian
wget -qO- https://toolbelt.heroku.com/install-ubuntu.sh | sh

# git pull and install dotfiles as well
cd $HOME
if [ -d ./dotfiles/ ]; then
    if [ -d ./dotfiles.old/ ]; then
      rm -rf ./dotfiles.old/
    fi
    mv dotfiles dotfiles.old
fi
if [ -d .emacs.d/ ]; then
    mv .emacs.d .emacs.d~
fi
#TODO: fork and separate by dev language, etc.
git clone https://github.com/startup-class/dotfiles.git
ln -sb dotfiles/.screenrc .
ln -sb dotfiles/.bash_profile .
ln -sb dotfiles/.bashrc .
ln -sb dotfiles/.bashrc_custom .
ln -sf dotfiles/.emacs.d .

#install data storage TODO separate these out to options
sudo apt-get install -y mongodb
sudo apt-get install -y postgresql

#install browser emulators
#sudo apt-get install qtwebkit
#phantom.js
#selenium

#TODO separate out java and c++ library installs
#java for hadoop and rest.li and cc 4.8 with casablanca
#casandra
curl -L http://debian.datastax.com/debian/repo_key | sudo apt-key add -
sudo sh -c 'echo "deb http://debian.datastax.com/community/ stable main" >> /etc/apt/sources.list.d/datastax.list'
sudo apt-get update
sudo apt-get install -y dsc12

#hadoop TODO: update as ppa is crusty
sudo add-apt-repository ppa:hadoop-ubuntu/stable
sudo apt-get update && sudo apt-get upgrade
sudo apt-get install -y hadoop
#TODO: finish config - http://askubuntu.com/questions/144433/how-to-install-hadoop
#hive
sudo apt-get install -y hive

#elasticsearch
wget https://download.elasticsearch.org/elasticsearch/elasticsearch/elasticsearch-0.90.3.deb
sudo dpkg -i elasticsearch-0.90.3.deb
rm elasticsearch-0.90.3.deb #TODO: clean this up a bit better

#vagrant
sudo apt-get install -y vagrant
#get other plugins for vagrant - conflict with ruby needing setup first
sudo gem install vagrant-aws
sudo gem install vagrant-digitalocean
#TODO: finish azure plugin
#sudo gem install vagrant-azure
sudo apt-get install -y libvert-dev
sudo gem install vagrant-kvm

#TODO: xpra and virtual framebuffer setup for dev VMs
#TODO: full ssh/cert integration and automatic screen integration
