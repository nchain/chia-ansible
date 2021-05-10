ssd_path=/media/ray/ssd
data_path=/media/ray/$1

chia plots create -n10 -k32 -b4000 -u128 -r3 -t $ssd_path -d $data_path &