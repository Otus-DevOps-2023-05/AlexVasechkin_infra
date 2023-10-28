#!/bin/bash
vagrant provision dbserver

vagrant provision appserver

molecule init scenario --scenario-name default -r db -d vagrant
