ssdPath=/media/ray/$1
dataPath=/media/ray/$2
roundNum=$3     # round num
taskRam=$4      # ram size per task
kNum=$4         # file format E.g. k32

rNum=2          # threads per task

cd ~/chia-blockchain
. ./activate

echo chia plots create -n $roundNum -k $kNum -b $taskRam -u 128 -r $rNum \
    -t $ssdPath -d $dataPath >/dev/null 2>&1 >> run-cmd.sh