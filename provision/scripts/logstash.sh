#!/usr/bin/env bash
dpkg -l logstash > /dev/null 2>&1
INSTALLED=$?

##########
#   Install Logstash
#########

echo ">>> Install Logstash"


if [ $INSTALLED == '0' ]; then
    echo "Installed"
    exit
else

    sudo apt-get update


    wget -qO - https://packages.elastic.co/GPG-KEY-elasticsearch | sudo apt-key add -

    echo 'deb http://packages.elasticsearch.org/logstash/2.1/debian stable main' | sudo tee /etc/apt/sources.list.d/logstash.list

    sudo apt-get update

    sudo apt-get -y install logstash

    sudo service logstash start
fi


