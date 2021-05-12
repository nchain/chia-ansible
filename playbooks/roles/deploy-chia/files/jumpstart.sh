#! /bin/bash

case "$(pidof autossh | wc -w)" in

0)  echo "Restarting autossh for to hn-jump:     $(date)" >> /var/log/jumpstart.txt
    sh add_jump_ssh_tunnel.sh &
    ;;
1)  # all ok
    ;;
*)  echo "Removed extra autossh: $(date)" >> /var/log/jumpstart.txt
    kill $(pidof autossh | awk '{print $1}')
    ;;
esac

### cronjob config (execute every 5 mins)
## */5 * * * * /home/ray/jumpstart.sh
###