OSS_BIN=$1
OSS_JDK=$2
JDK_IMG=$3
JRE_TAG=$4
NEW_JRE_TAG=$5

$OSS_BIN cp --update $OSS_JDK /tmp/$JDK_IMG
docker load < /tmp/$JDK_IMG
docker tag $JRE_TAG $NEW_JRE_TAG
docker rmi $JRE_TAG