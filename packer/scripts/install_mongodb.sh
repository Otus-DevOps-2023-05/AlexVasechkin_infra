#!/bin/bash
apt update
sleep 80
apt install -y mongodb-server
service mongodb start
