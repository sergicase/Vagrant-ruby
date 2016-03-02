#!/usr/bin/env bash
##########
#   Install MongoDB
#########
dpkg -l mongodb-org > /dev/null 2>&1
INSTALLED=$?

echo ">>> Installing MongoDB"
if [ $INSTALLED == '0' ]; then
    echo "Installed"
    exit
else
    # Get key and add to sources
    sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 7F0CEB10
    echo "deb http://repo.mongodb.org/apt/ubuntu "$(lsb_release -sc)"/mongodb-org/3.0 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-3.0.list
    # Update
    sudo apt-get update

    # Install MongoDB
    # -qq implies -y --force-yes
    sudo apt-get install -qq mongodb-org
fi
