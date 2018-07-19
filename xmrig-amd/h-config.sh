#!/usr/bin/env bash

THIS_MINER_NAME="custom"
[ -t 1 ] && . colors

[[ `ps aux | grep "./xmrig-amd " | grep -v grep | wc -l` != 0 ]] &&
<-->echo -e "${RED}$CUSTOM_NAME miner is already running${NOCOLOR}" &&
<-->exit 1

[[ -z $CUSTOM_TEMPLATE ]] && echo -e "${YELLOW}CUSTOM_TEMPLATE is empty${NOCOLOR}" && return 1
[[ -z $CUSTOM_URL ]] && echo -e "${YELLOW}CUSTOM_URL is empty${NOCOLOR}" && return 1

conf=" -o ${CUSTOM_URL} -u ${CUSTOM_TEMPLATE} -p ${CUSTOM_PASS} ${CUSTOM_USER_CONFIG}"

#replace tpl values in whole file
[[ -z $EWAL && -z $ZWAL && -z $DWAL ]] && echo -e "${RED}No WAL address is set${NOCOLOR}"
[[ ! -z $EWAL ]] && conf=$(sed "s/%EWAL%/$EWAL/g" <<< "$conf") #|| echo "${RED}EWAL not set${NOCOLOR}"
[[ ! -z $DWAL ]] && conf=$(sed "s/%DWAL%/$DWAL/g" <<< "$conf") #|| echo "${RED}DWAL not set${NOCOLOR}"
[[ ! -z $ZWAL ]] && conf=$(sed "s/%ZWAL%/$ZWAL/g" <<< "$conf") #|| echo "${RED}ZWAL not set${NOCOLOR}"
[[ ! -z $EMAIL ]] && conf=$(sed "s/%EMAIL%/$EMAIL/g" <<< "$conf")
[[ ! -z $WORKER_NAME ]] && conf=$(sed "s/%WORKER_NAME%/$WORKER_NAME/g" <<< "$conf") #|| echo "${RED}WORKER_NAME not set${NOCOLOR}"

[[ -z $CUSTOM_CONFIG_FILENAME ]] && echo -e "${RED}No CUSTOM_CONFIG_FILENAME is set${NOCOLOR}" && return 1
echo "$conf" > $CUSTOM_CONFIG_FILENAME

