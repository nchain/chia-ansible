#!/bin/bash

checkon="/home/ray/run-chia-ansible.sh ping"
bash_ding="bash /home/ray/chia-ansible/playbooks/roles/deploy-chia/files/ding.sh"


$checkon all > ~/checkon.log
res=$(cat ./checkon.log |grep "unreachable=1" |cut -d ' ' -f1)
echo $res

IFS=$'\n' read -rd '' -a hosts <<<"$res"
for host in "${hosts[@]}"; do
    offline_hosts="$offline_hosts $host"
done

echo $offline_hosts

$bash_ding "【Chia机器下线报警】" $offline_hosts