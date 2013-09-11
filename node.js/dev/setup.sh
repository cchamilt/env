#!/bin/bash
# Simple setup.sh for configuring Ubuntu 12.04 LTS EC2 instance
# for headless setup. 

#source and setup vagrant node.js testing -
#https://github.com/miccheng/vagrant-nodejs

#install Nave, Grunt, phantomJS

# Install nvm: node-version manager
# https://github.com/creationix/nvm
sudo apt-get install -y git
sudo apt-get install -y curl
curl https://raw.github.com/creationix/nvm/master/install.sh | sh

# Load nvm and install latest production node
source $HOME/.nvm/nvm.sh
nvm install v0.10.12
nvm use v0.10.12

# Install jshint to allow checking of JS code within emacs
# http://jshint.com/
npm install -g jshint

#http://www.emacswiki.org/emacs/NodeJs
#https://github.com/joyent/node/wiki/Vim-Plugins
