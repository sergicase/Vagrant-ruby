#!/usr/bin/env bash
##########
#   INSTALL Coffeescript ( Little language that compiles into JavaScript)
#########
coffee -v $1 > /dev/null
INSTALLED=$?


echo ">>> Install coffeescript"
if [ $INSTALLED == '127' ]; then
    echo "installed"
    exit
else
    sudo apt-get update
    npm install -g coffee-script
fi

