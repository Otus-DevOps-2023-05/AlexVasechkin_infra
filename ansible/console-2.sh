#!/bin/bash
ansible-playbook reddit_app.yml --check --limit db
# --limit - ограничиваем группу хостов, для которых применить плейбук

# применим playbook
ansible-playbook reddit_app.yml --limit db
