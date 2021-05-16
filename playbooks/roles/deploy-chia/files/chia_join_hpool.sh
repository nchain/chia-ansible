host=$1

echo "cd ~/$host && ./hpool-miner-chia -config ./hpool_conf.yml" >> /tmp/hpool.log
cd ~/$host
./hpool-miner-chia -config ./hpool_conf.yml