#!/usr/bin/env sh
sudo apt-get update

##########
#   Install Ruby
#########

echo ">>> Install Ruby"

curl -sSL https://rvm.io/mpapis.asc | gpg --import -

sudo \curl -sSL https://get.rvm.io | bash -s stable --ruby;

gem install bundle