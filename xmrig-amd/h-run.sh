#!/usr/bin/env bash
cd `dirname $0`

[ -t 1 ] && . colors

#CUSTOM_MINER="xmrig-amd"
#. /hive-config/wallet.conf
#[[ -z $CUSTOM_MINER ]] && echo -e "${RED}No CUSTOM_MINER is set${NOCOLOR}" && exit 1
#. /hive/custom/$CUSTOM_MINER/h-manifest.conf
export LD_LIBRARY_PATH=/hive/xmr-stak/fireice-uk
. h-manifest.conf

#echo $CUSTOM_MINER
#echo $CUSTOM_LOG_BASENAME
#echo $CUSTOM_CONFIG_FILENAME

[[ -z $CUSTOM_LOG_BASENAME ]] && echo -e "${RED}No CUSTOM_LOG_BASENAME is set${NOCOLOR}" && exit 1
[[ -z $CUSTOM_CONFIG_FILENAME ]] && echo -e "${RED}No CUSTOM_CONFIG_FILENAME is set${NOCOLOR}" && exit 1
[[ ! -f $CUSTOM_CONFIG_FILENAME ]] && echo -e "${RED}Custom config ${YELLOW}$CUSTOM_CONFIG_FILENAME${RED} is not found${NOCOLOR}" && exit 1
CUSTOM_LOG_BASEDIR=`dirname "$CUSTOM_LOG_BASENAME"`
[[ ! -d $CUSTOM_LOG_BASEDIR ]] && mkdir -p $CUSTOM_LOG_BASEDIR

cd /hive/custom/$CUSTOM_MINER
./xmrig-amd --api-port=60050 $(< /hive/custom/$CUSTOM_NAME/config.conf) $@ 2>&1 | tee $CUSTOM_LOG_BASENAME.log
