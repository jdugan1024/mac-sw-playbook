#!/bin/sh

# shell script to bootstrap the system to the point that it has ansible

sudo easy_install pip
sudo pip install ansible
ansible-galaxy install -r requirements.yml
