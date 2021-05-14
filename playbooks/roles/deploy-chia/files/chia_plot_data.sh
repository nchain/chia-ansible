ssdPath=/media/ray/$1
dataPath=/media/ray/$2
plotNum=$3
kNum=$4
taskRam=$5

rNum=2

cd ~/chia-blockchain
. ./activate

chia plots create -n $plotNum -k $kNum -b $taskRam -u 128 -r $rNum \
    -t $ssdPath -d $dataPath >/dev/null 2>&1