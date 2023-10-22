#!/bin/bash
ansible-playbook reddit_app.yml --check --limit db
# --limit - ограничиваем группу хостов, для которых применить плейбук

# применим playbook
ansible-playbook reddit_app.yml --limit db

# пробный прогон всех тасок с тегом app-tag для хостов группы app
ansible-playbook reddit_app.yml --check --limit app --tags app-tag

# применение изменений
ansible-playbook reddit_app.yml --limit app --tags app-tag
