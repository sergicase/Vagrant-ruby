#!/usr/bin/env sh
sudo apt-get update


##########
#   Ruby on Rails
#########

echo ">>> Install Ruby on Rails"

curl -sSL https://rvm.io/mpapis.asc | gpg --import -


sudo \curl -sSL https://get.rvm.io | bash -s stable --rails
