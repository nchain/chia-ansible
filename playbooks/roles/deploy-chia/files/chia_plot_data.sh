#!/bin/bash

MYDIR="$(dirname "$(readlink -f "$0")")"
PLOT_CONF="$MYDIR"/plot.conf
cd $MYDIR
source <(grep = ./plot.conf )

tmp1Path=$1
tmp2Path=$2
dataPath=$3
LOG=/tmp/chia-plot.log

mkdir -p $ssd2Path

PARAMS="-k$kNum -n$roundNum -b$taskRam -r$taskThreads -t$tmp1Path -2$tmp2Path -d$dataPath"
[ ! -z "$fpk" ] && PARAMS="$PARAMS -f$fpk"
[ ! -z "$ppk" ] && PARAMS="$PARAMS -p$ppk"

echo "PARAMS='$PARAMS'"

echo "#############################################################" >> $LOG
echo "chia plots create $PARAMS" >> $LOG
echo "#############################################################" >> $LOG

STARTTIME=$(date +%s)
. ~/chia-blockchain/activate

echo "######################################################################"
echo "chia plots create $PARAMS"
echo "######################################################################"
# chia plots create $PARAMS > /dev/null 2>&1
chia plots create $PARAMS
ENDTIME=$(date +%s)

echo "Start: $STARTTIME" >> $LOG
echo "End: $ENDTIME" >> $LOG