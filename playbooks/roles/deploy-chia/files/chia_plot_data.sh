#!/bin/bash

PLOT_CONF=$1/plot.conf
source <(grep = "$PLOT_CONF")

LOG=/tmp/chia-plot.log

PARAMS="-k $kNum -n $roundNum -b $taskRam -r$taskThreads -t $ssdPath -2 $ssd2Path -2 $ssdPath -d $dataPath"
[ ! -z "$fpk" ] && PARAMS="$PARAMS -f $fpk"
[ ! -z "$ppk" ] && PARAMS="$PARAMS -p $ppk"

echo "PARAMS='$PARAMS'"

echo "#############################################################" >> $LOG
echo "chia plots create $PARAMS" >> $LOG
echo "#############################################################" >> $LOG

STARTTIME=$(date +%s)
cd ~/chia-blockchain
. ./activate
echo "######################################################################"
echo "chia plots create $PARAMS"
echo "######################################################################"
# chia plots create $PARAMS > /dev/null 2>&1
chia plots create $PARAMS
ENDTIME=$(date +%s)

echo "Start: $STARTTIME" >> $LOG
echo "End: $ENDTIME" >> $LOG