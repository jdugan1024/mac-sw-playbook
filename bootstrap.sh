#!/bin/sh

# shell script to bootstrap the system to the point that it has ansible

echo Installing XCode

xcode-select --install
read -p "[Once XCode is installed hit RETURN to continue]"
sudo easy_install pip
sudo pip install ansible
