# ssh -fN -R hn-jump:10022:localhost:22 richardchen@hn-jump 

AUTOSSH_CONF=~/autossh.conf

source <(grep = "$AUTOSSH_CONF")

autossh -M $mon_port -fN \
  -o "PubkeyAuthentication=yes" \
  -o "StrictHostKeyChecking=false" \
  -o "PasswordAuthentication=no" \
  -o "ServerAliveInterval 60" \
  -o "ServerAliveCountMax 3" \
  -R hn-jump:$ssh_port:localhost:22 richardchen@hn-jump