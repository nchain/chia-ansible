ssdPath=$1
dataPath=$2
roundNum=$3     # round num
taskRam=$4      # ram size per task
kNum=$5         # file format E.g. k32
rNum=2          # threads per task

cd ~/chia-blockchain
. ./activate

echo chia plots create -n $roundNum -k$kNum -b$taskRam -u128 -r$rNum \
    -t $ssdPath -d $dataPath >/dev/null 2>&1 ~/plot.log