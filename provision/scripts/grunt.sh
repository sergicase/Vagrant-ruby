#!/usr/bin/env bash
##########
#   INSTALL GRUNT ( Javascript Task Runner)
#########
grunt -v $1 > /dev/null
INSTALLED=$?

echo ">>> Install grunt"
if [ $INSTALLED == '127' ]; then
    echo "installed"
    exit
else
    sudo apt-get update
    npm install -g grunt-cli
fi


