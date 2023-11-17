#!/bin/bash

ansible-vault encrypt environments/prod/credentials.yml

ansible-vault encrypt environments/stage/credentials.yml

ansible-playbook playbooks/site.yml —check
ansible-playbook playbooks/site.yml

# Для редактирования переменных нужно использовать команду
ansible-vault edit <file>

# для расшифровки
ansible-vault decrypt <file>
