#!/usr/bin/env bash
sudo apt-get update

##########
#   INSTALL NVM (Install and managing different versions of nodejs)
#########


NVM_DIR="/home/vagrant/.nvm"
git clone https://github.com/creationix/nvm.git $NVM_DIR
PROFILE="/home/vagrant/.profile"
SOURCE_STR="\n# This loads NVM\n[[ -s /home/vagrant/.nvm/nvm.sh ]] && . /home/vagrant/.nvm/nvm.sh"
printf "$SOURCE_STR" >> "$PROFILE"
. /home/vagrant/.profile


##########
#   INSTALL Nodejs
#########

echo ">>> Install nodejs"


nvm install stable

# Set a default node version and start using it
nvm alias default stable
# Use stable version as default
nvm use default