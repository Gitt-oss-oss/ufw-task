#!/bin/bash
if [ $# -ne 1 ]; then
  echo "Usage: $0 <filename>"
  exit 1
fi

filename=$1

sudo ufw allow from 172.168.0.100 port 3000 to 172.168.0.100 port 3306
sudo ufw allow from 192.168.32.55 to any port 3005
sudo ufw reject from any to any port 3005
sudo ufw allow in on eth0 to any port 8099
sudo ufw limit 6050:6055/tcp
sudo ufw status verbose | sudo tee "$filename" > /dev/null
