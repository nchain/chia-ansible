# chia-ansible

## `run-chia-deploy-ansible.sh`

```
ACTION=$1
HOST=$2

[ -z "$ACTION" ] && echo "ACTION must be of { initdisk | init | plot | joinpool }" && exit 1
[ -z "$HOST" ] && HOST=c002

PLAYBOOK=~/chia-ansible/playbooks/deploy-chia.yml
TAG=1.1.5
POOL=hpool

ANSIBLE_HOST_KEY_CHECKING=False ansible-playbook \
	-e ACTION=$ACTION \
	-e HOST=$HOST \
	-e CHIA_RELEASE_TAG=$TAG \
	-e POOL=$POOL \
	$PLAYBOOK
```

# install `community.general.filesystem` 

`ansible-galaxy collection install community.general`
