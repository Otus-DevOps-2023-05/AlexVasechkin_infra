#!/bin/bash
apt update
sleep 80
apt install -y ruby-full ruby-bundler build-essential
ruby -v
bundler -v
