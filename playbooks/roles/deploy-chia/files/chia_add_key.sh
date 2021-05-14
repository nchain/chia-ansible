host=$1

cd ~/chia-blockchain
. ./activate
chia init
mne_file=~/${host}/mne

[ test -f "$mne_file" ] && chia keys add -f $mne_file