#!/bin/bash


#############################################
##        Automatic install script         ##
##      Ittisafur <ittisafur@gmail.com>    ##
##          Updated: 2017-11-08            ##
#############################################


# Check if user is root
if [ "$(id -u)" -ne "0" ]; then
  echo 'You must be root to run this script.'
  exit 1
fi

# Update and Upgrade Packages
apt-get update && apt-get upgrade -y
