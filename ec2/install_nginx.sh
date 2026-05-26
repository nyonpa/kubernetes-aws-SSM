#!/bin/bash

sudo apt-get update
sudo apt-get install nginx -y
sudo systemctl  start nginx
sudo systemctl enable nginx

echo " the server nginx has started"> /var/www/html/index.html