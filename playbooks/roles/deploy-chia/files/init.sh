host=$1

sudo update-alternatives --install /usr/bin/python python /usr/bin/python3 1
mkdir -p ~/$host

sudo hostnamectl set-hostname $host

sudo mkdir -p /media/ray/ssd && sudo chown ray:ray /media/ray/ssd
sudo mkdir -p /media/ray/data1 && sudo chown ray:ray /media/ray/data1
sudo mkdir -p /media/ray/data2 && sudo chown ray:ray /media/ray/data2

cd ~/chia-blockchain
git remote set-url origin git@github.com:Chia-Network/chia-blockchain.git
git pull
git checkout tags/1.1.5
sh install.sh
. ./activate
chia init