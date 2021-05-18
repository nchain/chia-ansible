#!/bin/bash

cd ~/chia-blockchain
. ./activate

for i in {1..32}
do
    #chia plots create -k$kNum -n$roundNum -b$taskRam -f$fpk -p$ppk -t$ssdPath -d$dataPath
    sh ./chia_plot_data.sh 32 1 4000 $fpk $ppk $ssdPath $dataPath &

    sleep 30
done