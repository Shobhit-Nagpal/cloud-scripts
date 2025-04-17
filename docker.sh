#! /bin/bash

sudo apt update

# Installing prerequisite packages
sudo apt install apt-transport-https ca-certificates curl software-properties-common

# Add GPG key for official Docker repository to system
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg

# Add Docker repository to APT sources
echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

# Update again for addition to be recognized
sudo apt update

# Make sure we install from the Docker repo and not the default Ubuntu repo
apt-cache policy docker-ce

# Install Docker
sudo apt install docker-ce

# Check status
sudo systemctl status docker

# Add user to Docker group (to not write sudo everytime)
sudo usermod -aG docker ${USER} # Note: Make sure to logout or run su - ${USER} for this change to reflect
