ssd_path=/media/ray/ssd
data_path=/media/ray/$1
plot_n=$2

cd ~/chia-blockchain
. ./activate

chia plots create -n $plot_n -k 33 -b 9800 -u 128 -r 7 -t $ssd_path -d $data_path >/dev/null 2>&1