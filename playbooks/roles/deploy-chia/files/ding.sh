#!/bin/bash 

DingdingUrl=https://oapi.dingtalk.com/robot/send?access_token=2b8cf0781734a2db5cac5bc647169fe1fe7d5c25eab26f8dfd9e91d1c9870104
Subject=$1
Body=$2

function SendMessageToDingding {
curl $DingdingUrl -H 'Content-Type: application/json' --data-binary @- << EOF
{
    "actionCard": {
        "title": "$1", 
        "text": "$2", 
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
} 

SendMessageToDingding $Subject $Body