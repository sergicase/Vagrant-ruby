#!/usr/bin/env sh
##########
#   Ruby on Rails
#########
rails -v $1 > /dev/null
INSTALLED=$?


echo ">>> Install Ruby on Rails"
if [ $INSTALLED == '0' ]; then
    echo "installed"
    exit
else
    sudo apt-get update
    curl -sSL https://rvm.io/mpapis.asc | gpg --import -
    sudo \curl -sSL https://get.rvm.io | bash -s stable --rails
fi