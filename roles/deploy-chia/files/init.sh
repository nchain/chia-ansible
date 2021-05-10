sudo hostnamectl set-hostname {{ ansible_hostname }}

sudo mkdir -p /media/ray/ssd && sudo chown ray:ray /media/ray/ssd
sudo mkdir -p /media/ray/data1 && sudo chown ray:ray /media/ray/data1
sudo mkdir -p /media/ray/data2 && sudo chown ray:ray /media/ray/data2

cd ~/chia-blockhain
git remote set-url origin git@github.com:Chia-Network/chia-blockchain.git
git pull
git checkout tags/1.1.5

sh install.sh
. ./activate
chia init

mkdir -p ~/mnes

chia keys add -f /home/ray/mnes/{{ ansible_host }}.mne