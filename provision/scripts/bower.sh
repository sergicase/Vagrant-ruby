#!/usr/bin/env bash
##########
#   INSTALL BOWER ( A package manager for the web)
#########
command bower -v $1 > /dev/null
INSTALLED=$?

echo ">>> Install bower"
if [ $INSTALLED == '127' ]; then
    echo "Installed"
    exit
else
    sudo apt-get update
    npm install -g bower
fi