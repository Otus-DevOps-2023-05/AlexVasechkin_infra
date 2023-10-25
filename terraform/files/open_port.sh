#!/bin/bash
sudo iptables -t filter -A INPUT -p tcp --dport 80 -j ACCEPT
