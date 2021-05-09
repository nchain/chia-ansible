# ssh -fN -R hn-jump:10022:localhost:22 richardchen@hn-jump 

autossh -M 10021 -fN \
  -o "PubkeyAuthentication=yes" \
  -o "StrictHostKeyChecking=false" \
  -o "PasswordAuthentication=no" \
  -o "ServerAliveInterval 60" \
  -o "ServerAliveCountMax 3" \
  -R hn-jump:10022:localhost:22 richardchen@hn-jump