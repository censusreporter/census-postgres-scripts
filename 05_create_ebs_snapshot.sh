#!/bin/bash

sudo /etc/init.d/postgresql stop
sudo xfs_freeze -f /vol

# Take snapshot in AWS console

