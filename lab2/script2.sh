#!/bin/bash


# Run Ansible command to update MOTD directly
ansible node1 -m lineinfile -a "dest=/etc/motd line='Hello Ansible' create=yes"

