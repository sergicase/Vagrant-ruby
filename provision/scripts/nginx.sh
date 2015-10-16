#!/usr/bin/env bash
# -qq implies -y --force-yes
sudo apt-get update

##########
#   INSTALL NGINX
#########
echo ">>> Installing Nginx"

# Add repo for latest stable nginx
sudo add-apt-repository -y ppa:nginx/stable

# Update Again
sudo apt-get update

# Install Nginx
sudo apt-get install -qq nginx

# Add vagrant user to www-data group
usermod -a -G www-data vagrant

# Nginx enabling and disabling virtual hosts
sudo cp -r /vagrant/provision/helpers/dnshost.sh dnshost;
sudo chmod guo+x dnshost;
sudo mv dnshost /usr/local/bin;