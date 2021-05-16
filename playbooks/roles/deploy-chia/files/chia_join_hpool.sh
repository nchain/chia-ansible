conf=$1

cd /home/ray/chia-ansible/roles/deploy-chia/files/hpool/

hpool-miner-chia -config $conf >/dev/null 2>&1 &