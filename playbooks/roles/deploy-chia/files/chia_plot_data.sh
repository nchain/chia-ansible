#!/bin/bash

kNum=$1         # file format E.g. k32
roundNum=$2     # round num
taskRam=$3      # ram size per task, E.g. 4000
fpk=$4
ppk=$5
ssdPath=$6
dataPath=$7

LOG=/tmp/chia-plot.log

cd ~/chia-blockchain
. ./activate

echo "#############################################################"
echo "chia plots create -k$kNum -n$roundNum -b$taskRam -f$fpk -p$ppk -t$ssdPath -d$dataPath" >> $LOG
echo "#############################################################"

STARTTIME=$(date +%s)
chia plots create -k$kNum -n$roundNum -b$taskRam -f$fpk -p$ppk -t$ssdPath -d$dataPath
ENDTIME=$(date +%s)

echo "It takes $($ENDTIME - $STARTTIME) sec to complete this plotting" >> $LOG