miner=$1
sed -i 
cd /home/ray/chia-ansible/roles/deploy-chia/files
./hpool/hpool-miner-chia -config ./hpool/config.yaml &