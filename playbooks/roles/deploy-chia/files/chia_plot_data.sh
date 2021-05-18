#!/bin/bash

kNum=$1         # file format E.g. k32
roundNum=$2     # round num
taskRam=$3      # ram size per task, E.g. 4000
ssdPath=$4
dataPath=$5
fpk=$6
ppk=$7

LOG=/tmp/chia-plot.log

PARAMS="-k$kNum -n$roundNum -b$taskRam -t$ssdPath -d$dataPath"
[ -z "$fpk" ] && PARAMS="$PARAMS -f$fpk"
[ -z "$ppk" ] && PARAMS="$PARAMS -p$ppk"

cd ~/chia-blockchain
. ./activate

echo "#############################################################"
echo "chia plots create $PARMS" >> $LOG
echo "#############################################################"

STARTTIME=$(date +%s)
chia plots create $PARAMS > /dev/null 2>&1
ENDTIME=$(date +%s)

echo "It takes $($ENDTIME - $STARTTIME) sec to complete this plotting" >> $LOG