ssd_path=/media/ray/ssd
data_path=/media/ray/$1
plot_n=$2

chia plots create -n $plot_n -k32 -b4300 -u128 -r3 -t $ssd_path -d $data_path &