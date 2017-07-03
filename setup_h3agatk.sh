#!/bin/bash

# Initial update
sudo apt-get update && sudo apt-get -y upgrade

# Install pip
sudo apt-get install python-pip

# Install cwltool
pip install setuptools==28.8.0
pip install cwl-runner cwltool==1.0.20170217172322 schema-salad==2.2.20170222151604 avro==1.8.1

# Java installation
sudo apt-get update
sudo apt-get install default-jre
sudo apt-get install default-jdk

# Install Docker
sudo apt-get update

sudo apt-get install \
    apt-transport-https \
    ca-certificates \
    curl \
    software-properties-common

curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -

sudo add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"

sudo apt-get update
sudo apt-get install docker-ce
apt-cache madison docker-ce
sudo apt-get install docker-ce=17.06.0~ce-0~ubuntu-xenial


# Dockstore setup
wget 'https://github.com/ga4gh/dockstore/releases/download/1.2.3/dockstore'

mkdir ~/.dockstore

echo 'token: 8b45f789e5f0255228a4d91b5e27b5af29bdbd4f2a2c0d5c93e55630ceb87d68
server-url: https://dockstore.org:8443' > ~/.dockstore/config
