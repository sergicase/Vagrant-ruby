#!/usr/bin/env bash
##########
#   Install Redis
#########
dpkg -l redis-server > /dev/null 2>&1
INSTALLED=$?

echo ">>> Installing Redis"
if [ $INSTALLED == '0' ]; then
    echo "Installed"
    exit
else
    # Add repository
    sudo apt-add-repository ppa:rwky/redis -y

    # Install Redis
    # -qq implies -y --force-yes
    sudo apt-get install -qq redis-server
fi