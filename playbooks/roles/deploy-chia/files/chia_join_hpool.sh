conf=$1

cd ~/chia-ansible/roles/deploy-chia/files/hpool/

hpool-miner-chia -config $conf >/dev/null 2>&1 &