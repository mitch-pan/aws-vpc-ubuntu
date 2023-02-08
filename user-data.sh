#! /bin/bash

## Use this to install any software you want to have on the instance after boot up

sudo apt-get update
#sudo apt-get install -y apache2
#sudo systemctl start apache2
#sudo systemctl enable apache2

#Install kubectl
curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
sudo install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl
