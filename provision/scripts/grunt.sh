#!/bin/bash
##########
#   INSTALL GRUNT ( Javascript Task Runner)
#########
INSTALLED="$(sudo npm list -g grunt-cli)"

echo ">>> Install grunt"
if [[ $INSTALLED == *"grunt"* ]]; then
    echo "installed"
    exit
else
    sudo apt-get update
    sudo npm install -g grunt-cli
fi


