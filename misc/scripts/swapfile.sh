#!/bin/bash

# Creating a swap file

sudo dd if=/dev/zero of=/var/swapfile bs=1M count=2048

# This command will create a file named swapfile inside /var with 2GB
# If you want to change the file name, just don`t forget to change it
# in the rest of the commands below

# Changing the file permission

sudo chmod 600 /var/swapfile
sudo chown root:root /var/swapfile

# Formatting the file as a swap type

sudo mkswap /var/swapfile

# Adding the swap file to the system initialization

sudo echo /var/swapfile none swap defaults 0 0 | sudo tee -a /etc/fstab

# Activating the swap file

sudo swapon -a