#!/bin/bash

checkon='~/run-chia-ansible.sh ping'
ding='~/chia-ansible/playbooks/roles/deploy-chia/files/ding.sh'


$checkon all > ~/checkon.log
res=$(cat ./checkon.log |grep "unreachable=1" |cut -d ' ' -f1)

$ding "checkon" $res