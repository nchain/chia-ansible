#!/bin/bash 

DingdingUrl=https://oapi.dingtalk.com/robot/send?access_token=2b8cf0781734a2db5cac5bc647169fe1fe7d5c25eab26f8dfd9e91d1c9870104
subject=$1
offlines=$2

echo $offlines

body='('
for i in "${offlines[@]}"; do
    body="$body $i"
done
body=')'

body="Chia-offline:\n\n$body"

curl $DingdingUrl -H 'Content-Type: application/json' --data-binary @- << EOF
{
    "actionCard": {
        "title": "$subject", 
        "text": "$body", 
        "hideAvatar": "0", 
        "btnOrientation": "0", 
        "btns": [
            {
                "title": "$1", 
                "actionURL": ""
            }
        ]
    }, 
    "msgtype": "actionCard"
}
EOF