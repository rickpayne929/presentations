#!/bin/bash -x

# Reference https://docs.docker.com/engine/install/ubuntu/

# Remove old versions
sudo apt-get remove docker docker-engine docker.io containerd runc

# Install packages to allow apt to use a repository over HTTPS:
sudo apt update
sudo apt install -y apt-transport-https ca-certificates curl gnupg-agent software-properties-common

# Add Docker’s official GPG key:
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -

# Add Docker Stable Repo
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu focal stable"
   
# Update apt's package index
sudo apt update

# docker-ce repo check
apt-cache policy docker-ce

# Install the latest version of Docker CE and container
sudo apt install -y docker-ce # docker-ce-cli containerd.io (commented bc unable to locate error)

# Test
sudo systemctl status docker

# Group membership update
sudo usermod -aG docker ${USER}