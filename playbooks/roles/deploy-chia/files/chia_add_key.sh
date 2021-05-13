host=$1

cd ~/chia-blockchain
. ./activate
chia init
chia keys add -f ~/${host}/mne