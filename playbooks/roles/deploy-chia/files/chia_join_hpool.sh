host=$1

hpool_dir=~/chia-ansible/playbooks/roles/deploy-chia/files/hpool
hpool_bin=$hpool_dir/hpool-miner-chia
hpool_conf=$host/hpool_conf.yml

$hpool_bin -config $hpool_conf