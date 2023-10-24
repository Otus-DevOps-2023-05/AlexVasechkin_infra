#!/bin/bash
apt update
sleep 80
add-apt-repository -y ppa:deadsnakes/ppa
apt install -y python3.11
ln -s /usr/bin/python3.11 /usr/bin/python
