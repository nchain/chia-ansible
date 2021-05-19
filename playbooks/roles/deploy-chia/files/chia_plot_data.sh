#!/bin/bash

kNum=$1         # file format E.g. k32
roundNum=$2     # round num
taskRam=$3      # ram size per task, E.g. 4000
ssdPath=$4
dataPath=$5
figerprint=$6
fpk=$7
ppk=$8

cachePath=/media/ray/data2/cache

LOG=/tmp/chia-plot.log

PARAMS="-k$kNum -n$roundNum -b$taskRam -t$ssdPath -2 $cachePath -d$dataPath -a$figerprint"
[ ! -z "$fpk" ] && PARAMS="$PARAMS -f$fpk"
[ ! -z "$ppk" ] && PARAMS="$PARAMS -p$ppk"

cd ~/chia-blockchain
. ./activate

echo "#############################################################" >> $LOG
echo "chia plots create $PARAMS" >> $LOG
echo "#############################################################" >> $LOG

STARTTIME=$(date +%s)
chia plots create $PARAMS > /dev/null 2>&1
ENDTIME=$(date +%s)

echo "It takes $(($ENDTIME - $STARTTIME)) sec to complete this plotting" >> $LOG