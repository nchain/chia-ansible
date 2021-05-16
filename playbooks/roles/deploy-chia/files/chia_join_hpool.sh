conf=$1

hpool_bin=~/chia-ansible/playbooks/roles/deploy-chia/files/hpool/hpool-miner-chia

$hpool_bin -config $conf >/dev/null 2>&1 &