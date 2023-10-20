#!/bin/bash
ansible  -i ./inventory -m ping
ansible appserver -i ./inventory -m ping
ansible dbserver -i inventory -m ping
