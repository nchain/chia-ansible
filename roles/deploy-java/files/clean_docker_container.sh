CON_NAME=$1
echo $CON_NAME

if [ -z $(docker ps -f name="^/${CON_NAME}$" -q -a| xargs) ];then
    echo "docker [${CON_NAME}] not existing..."
elif [ -z $(docker ps -f name="^/${CON_NAME}$" -q| xargs) ];then
    echo "docker  [${CON_NAME}] not running so remove it 1st..."
    docker rm $CON_NAME
else
    echo "docker  [${CON_NAME}] already running so stop and rm it now..."
    docker stop $CON_NAME && docker rm $CON_NAME
fi