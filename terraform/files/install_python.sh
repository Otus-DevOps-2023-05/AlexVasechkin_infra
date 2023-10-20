#!/bin/bash
sudo apt update \ &&
sudo apt install -y build-essential \
 zlib1g-dev \
 libncurses5-dev \
 libgdbm-dev \
 libnss3-dev \
 libssl-dev \
 libreadline-dev \
 libffi-dev \
 libsqlite3-dev \
 wget \
 libbz2-dev \
 pkg-config

sudo mkdir -p /tmp/install/python

cd /tmp/install/python

wget https://www.python.org/ftp/python/3.11.6/Python-3.11.6.tgz

tar -xf Python-3.11.*.tgz

cd Python-3.11.*/

./configure --enable-optimizations

make -j $(nproc)

sudo make altinstall

sudo ln -s /usr/local/bin/python3.11 /usr/bin/python

sudo rm -rf /tmp/install
