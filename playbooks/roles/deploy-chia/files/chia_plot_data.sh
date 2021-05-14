ssdPath=/media/ray/$1
dataPath=/media/ray/$2
plotNum=$2
kNum=$3
taskRam=$4
rNum=2

cd ~/chia-blockchain
. ./activate

chia plots create -n $plotNum -k $kNum -b $taskRam -u 128 -r $rNum \
    -t $ssdPath -d $dataPath >/dev/null 2>&1