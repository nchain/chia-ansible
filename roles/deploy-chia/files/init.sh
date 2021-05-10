sudo hostnamectl set-hostname {{ ansible_hostname }}

sudo mkdir -p /media/ray/ssd && chown ray:ray /media/ray/ssd
sudo mkdir -p /media/ray/data1 && chown ray:ray /media/ray/data1
sudo mkdir -p /media/ray/data2 && chown ray:ray /media/ray/data2

(
echo 1 # jumpt parrtition 1
echo Delete # delete M$ partition
echo 2 # just to partition 2
echo Delete # delete M$ parition
echo New # Primary partition
echo   # First sector (Accept default: 1)
echo   # Last sector (Accept default: varies)
echo   # GUID
echo   # partition name
echo 1 # jumpt to part#1
echo Write # Write changes
echo yes # confirm writing

) | sudo cgdisk  /dev/nvme1n1
