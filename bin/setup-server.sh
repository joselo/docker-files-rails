#!/bin/sh

USER=deploy

sudo useradd -m ${USER}

# Add Docker repository
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"

# Update Repositories
sudo apt-get update

# Make sure you are about to install from the Docker repo instead of the default Ubuntu 16.04 repo
apt-cache policy docker-ce

# Install Docker
sudo apt-get install -y docker-ce

# Check Docker
sudo systemctl status docker

# Avoid to run docker as sudo
sudo usermod -aG docker ${USER}

# Install docker-compose
sudo curl -L https://github.com/docker/compose/releases/download/1.17.0/docker-compose-`uname -s`-`uname -m` -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose
docker-compose --version

# Install Git-core
sudo apt-get install -y git-core

# Create ssh key for deploy user
su deploy
ssh-keygen -t rsa -C deploy
echo "****************************************"
echo "Deploy SSH KEY"
echo "****************************************"
cat ~/.ssh/id_rsa.pub

