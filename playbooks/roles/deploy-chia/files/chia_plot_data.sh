ssdPath=/media/ray/$1
dataPath=/media/ray/$2
roundNum=$3     # round num
kNum=$4         # file format E.g. k32
taskRam=$5      # ram size per task

rNum=2          # threads per task

cd ~/chia-blockchain
. ./activate

chia plots create -n $roundNum -k $kNum -b $taskRam -u 128 -r $rNum \
    -t $ssdPath -d $dataPath >/dev/null 2>&1