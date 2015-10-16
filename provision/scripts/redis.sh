#!/usr/bin/env bash

##########
#   Install Redis
#########

echo ">>> Installing Redis"

# Add repository
sudo apt-add-repository ppa:rwky/redis -y

# Install Redis
# -qq implies -y --force-yes
sudo apt-get install -qq redis-server
