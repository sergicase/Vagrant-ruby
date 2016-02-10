#!/usr/bin/env bash
dpkg -l elasticsearch > /dev/null 2>&1
INSTALLED=$?

##########
#   Install ElasticSearch
#########

echo ">>> Install ElasticSearch"

if [ $INSTALLED == '0' ]; then
    echo "Installed"
    exit
else
    sudo apt-get update

    wget -qO - https://packages.elastic.co/GPG-KEY-elasticsearch | sudo apt-key add -


    echo "deb http://packages.elastic.co/elasticsearch/2.x/debian stable main" | sudo tee -a /etc/apt/sources.list.d/elasticsearch-2.x.list

    sudo apt-get update

    sudo apt-get -y install elasticsearch

    sudo service elasticsearch start
fi

