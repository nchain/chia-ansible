host=$1

cd ~/chia-blockchain
. ./activate
chia init
mne_file=~/${host}/mne

[ -f "$mne_file" ] && chia keys add -f $mne_file