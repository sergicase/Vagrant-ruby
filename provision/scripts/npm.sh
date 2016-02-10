#!/usr/bin/env bash
dpkg -l npm > /dev/null 2>&1
INSTALLED=$?


echo ">>> Install npm"

if [ $INSTALLED == '0' ]; then
    echo "Installed"
    exit
else

    sudo apt-get update

    ##########
    #   INSTALL NPM ( Package manager for Node.js)
    #########
    sudo apt-get install -qq npm
fi