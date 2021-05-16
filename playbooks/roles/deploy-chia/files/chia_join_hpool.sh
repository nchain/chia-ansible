host=$1

hpool_bin=~/chia-ansible/playbooks/roles/deploy-chia/files/hpool/hpool-miner-chia
hpool_conf=$host/hpool_conf.yml

$hpool_bin -config $hpool_conf