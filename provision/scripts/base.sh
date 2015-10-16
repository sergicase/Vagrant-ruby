#!/usr/bin/env bash
# Install base packages
# -qq implies -y --force-yes

##########
#   TIMEZONE CONFIG
#########

echo ">>> Setting Timezone & Locale to $1 & UTF-8"

sudo ln -sf /usr/share/zoneinfo/$1 /etc/localtime
sudo locale-gen UTF-8
export LANG=UTF-8

echo "export LANG=UTF-8" >> /home/vagrant/.bashrc


##########
#  OPTIMIZATION FOR DEVEL
#########

echo ">>> Optimizing for devel enviorement"

#   ack-grep -> Is a tool like grep, optimized for programmers
#   software-properties-common -> Manage the repositories that you install software from common
#   build-essential -> Informational list of build-essential packages

sudo apt-get update
sudo apt-get install -qq curl unzip git-core ack-grep software-properties-common build-essential


##########
#   GIT CONFIG
#########

echo ">>> Config git"

sudo apt-get install -qq git-core

# Git Config and set Owner
cp /vagrant/provision/config/gitconfig /home/vagrant/.gitconfig
sudo chown vagrant:vagrant /home/vagrant/.gitconfig

# Common fixes for git
git config --global http.postBuffer 65536000

# Cache http credentials for one day while pull/push
git config --global credential.helper 'cache --timeout=86400'


#########
#   INSTALL TIG
#########

echo ">>> Config tig"

sudo apt-get install -qq tig

##########
#   SSL CONFIG
#########

echo ">>> Installing *.xip.io self-signed SSL"

SSL_DIR="/etc/ssl/xip.io"
DOMAIN="*.xip.io"
PASSPHRASE="vagrant"

SUBJ="
C=US
ST=Connecticut
O=Vaprobash
localityName=New Haven
commonName=$DOMAIN
organizationalUnitName=
emailAddress=
"

sudo mkdir -p "$SSL_DIR"
sudo openssl genrsa -out "$SSL_DIR/xip.io.key" 1024
sudo openssl req -new -subj "$(echo -n "$SUBJ" | tr "\n" "/")" -key "$SSL_DIR/xip.io.key" -out "$SSL_DIR/xip.io.csr" -passin pass:$PASSPHRASE
sudo openssl x509 -req -days 365 -in "$SSL_DIR/xip.io.csr" -signkey "$SSL_DIR/xip.io.key" -out "$SSL_DIR/xip.io.crt"