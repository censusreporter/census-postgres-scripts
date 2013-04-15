#!/bin/bash

# Create an EBS volume
# Attach it to the EC2 instance
# (All via the web console for now)

# Build an XFS filesystem on the attached volume
sudo apt-get install -y xfsprogs
sudo mkfs.xfs /dev/xvdf

# Add to fstab and mount XFS filesystem
echo "/dev/xvdf /vol xfs noatime 0 0" | sudo tee -a /etc/fstab
sudo mkdir -m 000 /vol
sudo mount /vol