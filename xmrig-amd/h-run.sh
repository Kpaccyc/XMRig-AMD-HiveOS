#!/usr/bin/env bash
cd `dirname $0`

. h-manifest.conf

while true; do
  for con in `netstat -anp | grep TIME_WAIT | grep $CUSTOM_API_PORT | awk '{print $5}'`; do
    killcx $con lo
  done
  netstat -anp | grep TIME_WAIT | grep $CUSTOM_API_PORT &&
    continue ||
    break
done

wget https://github.com/Kpaccyc/XMRig-AMD-HiveOS/blob/master/xmrig-amd/control
if [ $(cat control | grep -i "Version: $CUSTOM_VERSION" | wc -l) -eq 0 ];
	then
		mv $CUSTOM_CONFIG_FILENAME /hive/miners/custom/;
		/hive/miners/custom/custom-get https://github.com/Kpaccyc/XMRig-AMD-HiveOS/releases/download/Release/xmrigamd.tar.gz -f;
		mv /hive/miners/custom/config.conf $CUSTOM_CONFIG_FILENAME;
fi
rm -f control

if [ $(dpkg-query -W -f='${Status}' libmicrohttpd-dev 2>/dev/null | grep -c "ok installed") -eq 0 ];
then
  apt-get update;
  apt-get install libmicrohttpd-dev -y;
fi

cd /hive/miners/custom/$CUSTOM_NAME
export GPU_FORCE_64BIT_PTR=1
export GPU_USE_SYNC_OBJECTS=1
export GPU_MAX_ALLOC_PERCENT=100
export GPU_SINGLE_ALLOC_PERCENT=100
export GPU_MAX_HEAP_SIZE=100
./xmrig-amd --log-file=$CUSTOM_LOG_BASENAME.log --api-port=$CUSTOM_API_PORT $(< $CUSTOM_CONFIG_FILENAME) $@ 2>&1
