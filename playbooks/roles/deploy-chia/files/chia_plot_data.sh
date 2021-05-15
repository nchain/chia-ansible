host=$1
ssdPath=$2
dataPath=$3
roundNum=$4     # round num
taskRam=$5      # ram size per task
kNum=$6         # file format E.g. k32
rNum=2          # threads per task

cd ~/chia-blockchain
. ./activate

echo "chia plots create -n$roundNum -k$kNum -b$taskRam -u128 -r$rNum \
    -t $ssdPath -d $dataPath > /dev/null 2>&1 &" >> $host/chia.log

chia plots create -n$roundNum -k$kNum -b$taskRam -u128 -r$rNum \
    -t $ssdPath -d $dataPath > /dev/null 2>&1 &