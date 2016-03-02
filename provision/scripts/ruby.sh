#!/bin/bash

##########
#   Install Ruby
#########

INSTALLED="$(ruby -v)"

if [[ $INSTALLED == *"ruby 2.2"* ]]; then
    echo "Installed"
    exit
else
    echo ">>> Install Ruby"

    sudo apt-get update

    curl -sSL https://rvm.io/mpapis.asc | gpg --import -

    sudo \curl -sSL https://get.rvm.io | bash -s stable --ruby;

    sudo gem install bundle
fi

