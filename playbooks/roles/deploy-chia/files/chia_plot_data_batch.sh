#!/bin/bash

MYDIR="$(dirname "$(readlink -f "$0")")"
PLOT_CONF="$MYDIR"/plot.conf
LOG=/tmp/chia-plot.log
PARTIAL_DONE='partially-done'
ALL_DONE='all-done'


function getAvailableDataPath {
  source <(grep = "$PLOT_CONF")

  for mount_path in "${dataPathArr[@]}"
  do
    mnt_stat=$(df -h |grep $mount_path)
    [ -z "$mnt_stat" ] && continue

    read -r a b c d e f <<< "${mnt_stat}"
    unit=${d: -1}

    if [ "$unit" = 'T' ]; then
      echo $mount_path
      return

    elif [ "$unit" = 'G' ]; then
      free_size=$(echo $d | sed 's/.$//')
      [ "$free_size" -gt "$plotSize" ] && $( echo $mount_path && return ) || continue

    else
      continue

    fi

    echo ""
  done
}

function batch_exec {
  source <(grep = "$PLOT_CONF")

  dataPath=$(getAvailableDataPath)
  [ -z "$dataPath" ] && echo $ALL_DONE && return #all disks filled w plots

  input_cnt=$1
  [ ! -z "$input_cnt" ] && todo_cnt=$input_cnt || todo_cnt=$batchPlotCount

  plotting_cnt=$(ps aux |grep [p]lots | wc -l)

  echo "" >> $LOG
  echo "" >> $LOG
  echo "run $todo_cnt plotting tasks in parallel..." >> $LOG
  echo "" >> $LOG
  for i in $(seq $todo_cnt)
  do
    echo ">>> Starting batch[$i]" >> $LOG

    plot_id=$(( $plotting_cnt + i))
    tmp1Path="$ssdPath/tmp$plot_id"
    tmp2Path="$ssd2Path/tmp$plot_id"
    mkdir -p $tmp1Path $tmp2Path
    echo "$MYDIR/chia_plot_data.sh $tmp1Path $tmp2Path $dataPath &" >> $LOG
    
    $MYDIR/chia_plot_data.sh $tmp1Path $tmp2Path $dataPath &

    echo ">>> sleep $batchTaskInterval sec..." >> $LOG
    sleep $batchTaskInterval
  done

  echo $PARTIAL_DONE >> $LOG
}

function get_plots {
  dataPath=$1
  echo $(ls $dataPath/*.plot | wc -l)
}

source <(grep = "$PLOT_CONF")

echo '######################## Phase 0: clean up SSD caches...' > $LOG
echo
rm -rf $ssdPath/tmp*
rm -rf $ssd2Path/tmp*
chmod a+x $MYDIR/chia_plot_data.sh

echo 
echo '######################## Phase I exec...' >> $LOG
echo "maxPlottingPending=$maxPlottingPending" >> $LOG
echo "maxLoopCount=$maxLoopCount" >> $LOG
echo "maxPlotCount=$maxPlotCount" >> $LOG
echo '' >> $LOG
batch_exec
# sleep $phaseInterval

for step in $(seq 1 $maxLoopCount);
do
  echo ">> $step: "
  source <(grep = "$PLOT_CONF")
  dataPath=$(getAvailableDataPath)
  [ -z "$dataPath" ] && echo $ALL_DONE  && sleep $maxPlottingPending && continue #all disks filled, can add new disks

  plotting_cnt=$(ps aux |grep "[p]lots" | wc -l)
  [ "$plotting_cnt" -ge "$maxPlotCount" ] && echo "max plotting count [ $maxPlotCount ] reached" && sleep $maxPlottingPending && continue #max plotting count reached

  [ "$plotting_cnt" -lt "$maxPlotCount" ] && batch_exec 1

  sleep $batchTaskInterval
done