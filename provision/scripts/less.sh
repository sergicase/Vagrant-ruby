#!/usr/bin/env bash
##########
#   INSTALL LESS ( Less is a CSS pre-processor, meaning that it extends the CSS language)
#########
less --version $1 > /dev/null
INSTALLED=$?


echo ">>> Install less"
if [ $INSTALLED == '0' ]; then
    echo "installed"
    exit
else
    sudo apt-get update
    npm install -g less

fi
