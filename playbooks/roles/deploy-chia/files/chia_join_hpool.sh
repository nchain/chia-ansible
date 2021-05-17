host=$1


hpool_cnt=$(ps aux |grep chia_join_hpool | wc -l)
[[ "$hpool_cnt" -gt 1 ]] && exit 0

echo "cd ~/$host && ./hpool-miner-chia -config ./hpool_conf.yml" >> /tmp/hpool.log
cd ~/$host
./hpool-miner-chia -config ./hpool_conf.yml