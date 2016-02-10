#!/usr/bin/env bash
##########
#   Install mysql
#########
dpkg -l mysql-server > /dev/null 2>&1
INSTALLED=$?

echo ">>> Install Mysql"
if [ $INSTALLED == '0' ]; then
    echo "Installed"
    exit
else
    sudo apt-get update
    # Install MySQL without password prompt
    # Set username and password to 'root'
    sudo debconf-set-selections <<< "mysql-server mysql-server/root_password password root"
    sudo debconf-set-selections <<< "mysql-server mysql-server/root_password_again password root"

    sudo apt-get install -qq mysql-server
    sudo apt-get install libmysqlclient-dev

fi






