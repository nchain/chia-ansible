conf=$1

hpool_dir=~/chia-ansible/playbooks/roles/deploy-chia/files/hpool
hpool_bin=$hpool_dir/hpool-miner-chia
hpool_conf=$hpool_dir/$conf

$hpool_bin -config $hpool_conf >/dev/null 2>&1 &