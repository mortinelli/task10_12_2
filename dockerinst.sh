#! /bin/bash
# install pre-requirements
apt-get update
apt-get install apt-transport-https ca-certificates curl software-properties-common -y
# add docker deb repo
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add - 
add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
# install docker-ce
apt-get update
apt-get install docker-ce -y
apt-get install docker-compose -y
