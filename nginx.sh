#! /bin/bash

# Installs nginx for (Ubuntu)
sudo apt update
sudo apt install nginx

# Firewall config
sudo ufw app list
sudo ufw allow 'Nginx Full'

sudo ufw status

sudo systemctl enable nginx
sudo systemctl restart nginx
