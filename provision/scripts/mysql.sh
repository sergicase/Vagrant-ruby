#!/usr/bin/env bash
sudo apt-get update


##########
#   Install mysql
#########

echo ">>> Install Mysql"


# Install MySQL without password prompt
# Set username and password to 'root'
sudo debconf-set-selections <<< "mysql-server mysql-server/root_password password root"
sudo debconf-set-selections <<< "mysql-server mysql-server/root_password_again password root"

sudo apt-get install -qq mysql-server

