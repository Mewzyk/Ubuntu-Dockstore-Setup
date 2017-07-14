#!/bin/bash

printf "\n Intial Ubunutu update \n"

# Initial update
sudo apt-get update && sudo apt-get -y upgrade

printf "\n Installing pip \n"

# Install pip
sudo apt-get install python-pip

printf "\n Installing cwltool \n"

# Install cwltool
pip install setuptools==28.8.0
pip install cwl-runner cwltool==1.0.20170217172322 schema-salad==2.2.20170222151604 avro==1.8.1

printf "\n Installing Java \n"

# Java installation
sudo apt-get update
sudo apt-get install default-jre
sudo apt-get install default-jdk

printf "\n Installing Docker \n "

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

printf "\n Installing Dockstore \n"

# Dockstore setup
mkdir ~/.dockstore

cat docker_config.txt > ~/.dockstore/config

chmod +x dockstore

cat path_config.txt > ~/.bashrc

dockstore
