# chia-ansible

## `run-chia-deploy-ansible.sh`

```
HOST=$2
PARAM=$3
P1=$4
P2=$5

[ -z "$ACTION" ] && echo "ACTION must be of { initdisk | init | plot | joinpool | upgrade/up }" && exit 1
[ -z "$HOST" ] && HOST=c002

PLAYBOOK=~/chia-ansible/playbooks/deploy-chia.yml
TAG=1.1.5
POOL=hpool

ANSIBLE_HOST_KEY_CHECKING=False && ANSIBLE_STDOUT_CALLBACK=debug ansible-playbook \
        -e ACTION=$ACTION \
        -e HOST=$HOST \
        -e PARAM=$PARAM \
        -e P1=$P1 \
        -e P2=$P2 \
        -e CHIA_RELEASE_TAG=$TAG \
        -e POOL=$POOL \
        $PLAYBOOK
```

# install `community.general.filesystem` 

`ansible-galaxy collection install community.general`
