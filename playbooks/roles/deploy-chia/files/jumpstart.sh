#! /bin/bash

case "$(pidof autossh | wc -w)" in

0)  echo "Restarting autossh for to hn-jump:     $(date)" >> /tmp/jumpstart.log
    sh ./add_jump_ssh_tunnel.sh &
    ;;
1)  # all ok
    ;;
*)  echo "Removed extra autossh: $(date)" >> /tmp/jumpstart.log
    kill $(pidof autossh | awk '{print $1}')
    ;;
esac

### cronjob config (execute every 5 mins)
## */1 * * * * /home/ray/jumpstart.sh
###