conf=$1

cd ~/chia-ansible/playbooks/roles/deploy-chia/files/hpool

hpool-miner-chia -config $conf >/dev/null 2>&1 &