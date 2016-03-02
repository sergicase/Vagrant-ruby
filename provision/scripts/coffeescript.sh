#!/bin/bash
##########
#   INSTALL Coffeescript ( Little language that compiles into JavaScript)
#########

INSTALLED="$(sudo npm list -g coffee-script)"

echo ">>> Install coffeescript"
if [[ $INSTALLED == *"coffee-script"* ]]; then
    echo "installed"
    exit
else
    sudo apt-get update
    sudo npm install -g coffee-script
fi