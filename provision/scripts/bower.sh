#!/bin/bash
##########
#   INSTALL BOWER ( A package manager for the web)
#########

INSTALLED="$(sudo npm list -g bower)"

echo ">>> Install bower"
if [[ $INSTALLED == *"bower"* ]]; then
    echo "Installed"
    exit
else
    sudo apt-get update
    sudo npm install -g bower
fi