#!/bin/bash

MYDIR="$(dirname "$(readlink -f "$0")")"
PLOT_CONF="$MYDIR"/plot.conf
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

  cd ~/chia-batch
  source <(grep = "$PLOT_CONF")

  dataPath=$(getAvailableDataPath)
  [ -z "$dataPath" ] && echo $ALL_DONE && return #all disks filled w plots

  input_cnt=$1
  [ ! -z "$input_cnt" ] && todo_cnt=$input_cnt || todo_cnt=$batchPlotCount

  plotting_cnt=$(ps aux |grep [p]lots | wc -l)

  for i in $(seq $todo_cnt)
  do
    echo ">>> batch [$i]"
    plot_id=$(( $plotting_cnt + i))
    tmpPath1="$ssdPath/tmp$plot_id"
    tmpPath2="$ssd2Path/tmp$plot_id"
    mkdir -p tmp1 tmp2
    sh ./chia_plot_data.sh &

    echo "sleep $batchTaskInterval sec..."
    sleep $batchTaskInterval
  done

  echo $PARTIAL_DONE
}

function get_plots {
  dataPath=$1
  echo $(ls $dataPath/*.plot | wc -l)
}

echo '######################## Phase 0: clean up SSD caches...'
echo
rm -rf $ssdPath/tmp*
rm -rf $ssd2Path/tmp*

echo 
echo '######################## Phase I exec...'
echo 
batch_exec
# sleep $phaseInterval

# echo 
# echo '######################## Phase II exec...'
# echo 
# batch_exec
# sleep $phaseInterval

echo 
echo '######################## Phase III exec...'
echo 

for step in $(seq 1 $maxLoopCount);
do
  echo ">> $step: "
  source <(grep = "$PLOT_CONF")
  dataPath=$(getAvailableDataPath)
  [ -z "$dataPath" ] && echo $ALL_DONE  && sleep $maxPlottingPending && continue #all disks filled, can add new disks

  plotting_cnt=$(ps aux |grep [p]lots | wc -l)
  [ "$plotting_cnt" -ge "$maxPlotCount" ] && echo "max plotting count [ $maxPlotCount ] reached" && sleep $maxPlottingPending && continue #max plotting count reached

  [ "$plotting_cnt" -lt "$maxPlotCount" ] && batch_exec 1

  sleep $batchTaskInterval
done