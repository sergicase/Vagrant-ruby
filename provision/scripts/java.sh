#!/usr/bin/env bash
dpkg -l openjdk-7-jre > /dev/null 2>&1
INSTALLED=$?

##########
#   Install Java
#########


echo ">>> Install Java"

if [ $INSTALLED == '0' ]; then
    echo "Installed"
    exit
else
    sudo apt-get update

    sudo apt-get -y install openjdk-7-jre
fi


