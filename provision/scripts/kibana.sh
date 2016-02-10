#!/usr/bin/env bash
DIRECTORY="/opt/kibana"

##########
#   Install Kibana
#########

echo ">>> Install Kibana"


if [ -d "$DIRECTORY" ]; then
    echo "Installed"
    exit
else
    sudo apt-get update

    sudo groupadd -g 999 kibana
    sudo useradd -u 998 -g 999 kibana

    kibana_folder=~/kibana-4*/*
    kibana_config=~/kibana-4*/config/kibana.yml
    kibana_opt=/opt/kibana/

    cd ~; wget https://download.elastic.co/kibana/kibana/kibana-4.3.0-linux-x64.tar.gz

    tar xvf kibana-*.tar.gz

    sed -i 's/# server.host: "0.0.0.0"/# server.host: "localhost"/g' $kibana_config

    sudo mkdir -p $kibana_opt

    sudo cp -R $kibana_folder $kibana_opt

    sudo chown -R kibana: $kibana_opt

    cd /etc/init.d && sudo curl -o kibana https://gist.githubusercontent.com/thisismitch/8b15ac909aed214ad04a/raw/fc5025c3fc499ad8262aff34ba7fde8c87ead7c0/kibana-4.x-init
    cd /etc/default && sudo curl -o kibana https://gist.githubusercontent.com/thisismitch/8b15ac909aed214ad04a/raw/fc5025c3fc499ad8262aff34ba7fde8c87ead7c0/kibana-4.x-default


    sudo chmod +x /etc/init.d/kibana
    sudo update-rc.d kibana defaults 96 9
    sudo service kibana start
fi

