#!/bin/bash
ansible-playbook reddit_app.yml --check --limit db
# --limit - ограничиваем группу хостов, для которых применить плейбук

# применим playbook
ansible-playbook reddit_app.yml --limit db

# пробный прогон всех тасок с тегом app-tag для хостов группы app
ansible-playbook reddit_app.yml --check --limit app --tags app-tag

# применение изменений
ansible-playbook reddit_app.yml --limit app --tags app-tag

# пробный прогон деплоя
ansible-playbook reddit_app.yml --check --limit app --tags deploy-tag

# выполнение деплоя
ansible-playbook reddit_app.yml --limit app --tags deploy-tag

ansible-playbook reddit_app2.yml --tags db-tag --check
ansible-playbook reddit_app2.yml --tags db-tag

ansible-playbook reddit_app2.yml --tags app-tag --check
ansible-playbook reddit_app2.yml --tags app-tag

ansible-playbook reddit_app2.yml --tags deploy-tag --check
ansible-playbook reddit_app2.yml --tags deploy-tag

ansible-playbook site.yml --check
ansible-playbook site.yml

ansible-playbook -i environments/prod/inventory deploy.yml
