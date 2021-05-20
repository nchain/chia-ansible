host=$1

function join_pool {
    echo "cd ~/$host && ./hpool-miner-chia -config ./hpool_conf.yml" >> /tmp/hpool.log
    cd ~/$host
    ./hpool-miner-chia -config ./hpool_conf.yml
}

cnt1=$(ls /media/ray/data1/*.plot |wc -l)
cnt2=$(ls /media/ray/data2/*.plot |wc -l)
cnt=$(( $cnt1 + $cnt2 ))
[ "$cnt" -eq 0 ] && exit 1

hpool_cnt=$(ps aux |grep chia_join_hpool | wc -l)
[[ "$hpool_cnt" -eq 1 ]] && join_pool
