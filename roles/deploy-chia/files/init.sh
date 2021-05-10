sudo hostnamectl set-hostname {{ ansible_hostname }}
mv chia-blockchain/venv/chia-ansible ~/
cd ~/chia-ansible && GIT_ASKPASS=/bin/echo GIT_SSH_COMMAND="ssh -oBatchMode=yes" git pull
