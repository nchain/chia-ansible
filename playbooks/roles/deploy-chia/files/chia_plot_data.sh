ssd_path=/media/ray/ssd
data_path=/media/ray/$1
plot_n=$2

cd ~/chia-blockchain
. ./activate

chia plots create -n $plot_n -k33 -b4300 -u128 -r3 -t $ssd_path -d $data_path >/dev/null 2>&1