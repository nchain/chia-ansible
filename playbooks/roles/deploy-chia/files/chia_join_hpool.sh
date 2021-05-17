host=$1


hpool_cnt=$(pidof chia_join_hpool | wc -w)
[[ $hpool_cnt -eq 0 ]] && exit 0

echo "cd ~/$host && ./hpool-miner-chia -config ./hpool_conf.yml" >> /tmp/hpool.log
cd ~/$host
./hpool-miner-chia -config ./hpool_conf.yml