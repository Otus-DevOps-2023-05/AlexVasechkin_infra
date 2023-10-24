#!/bin/bash
ansible  -i ./inventory -m ping
ansible appserver -i ./inventory -m ping
ansible dbserver -i inventory -m ping

ansible dbserver -m command -a uptime

ansible app -m ping

ansible all -m ping -i inventory.yml

ansible app -m command -a 'ruby -v'

# не сработает
ansible app -m command -a 'ruby -v; bundler -v'
# Модуль command выполняет команды, не используя оболочку ( sh ,
# bash ), поэтому в нем не работают перенаправления потоков и нет доступа
# к некоторым переменным окружения.

ansible app -m shell -a 'ruby -v; bundler -v'

ansible db -m command -a 'systemctl status mongodb'
ansible db -m shell -a 'systemctl status mongodb'

ansible db -m systemd -a name=mongodb

ansible db -m service -a name=mongodb

ansible app -m git -a \
 'repo=https://github.com/express42/reddit.git dest=/home/ubuntu/reddit'

ansible app -m command -a \
 'git clone https://github.com/express42/reddit.git /home/ubuntu/reddit'

ansible-playbook clone.yml
