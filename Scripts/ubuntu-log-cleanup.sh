#!/bin/bash

echo "Rotating system logs..."
logrotate /etc/logrotate.conf

echo "Clearing old auth logs..."
sudo find /var/log/auth.log.* -type f -delete

echo "Updating packages..."
sudo apt update && sudo apt upgrade -y
