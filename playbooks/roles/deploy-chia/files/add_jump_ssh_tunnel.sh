# ssh -fN -R hn-jump:10022:localhost:22 richardchen@hn-jump 

cd ~ && source <(grep = "autossh.conf")

autossh -M $mon_port -fN \
  -o "PubkeyAuthentication=yes" \
  -o "StrictHostKeyChecking=false" \
  -o "PasswordAuthentication=no" \
  -o "ServerAliveInterval 60" \
  -o "ServerAliveCountMax 3" \
  -R $jump_host:$ssh_port:localhost:22 $jump_user@$jump_host