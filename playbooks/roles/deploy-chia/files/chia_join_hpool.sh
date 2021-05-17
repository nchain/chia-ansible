host=$1

function join_pool {
    echo "cd ~/$host && ./hpool-miner-chia -config ./hpool_conf.yml" >> /tmp/hpool.log
    cd ~/$host
    ./hpool-miner-chia -config ./hpool_conf.yml
}

hpool_cnt=$(ps aux |grep chia_join_hpool | wc -l)
[[ "$hpool_cnt" -eq 1 ]] && join_pool
