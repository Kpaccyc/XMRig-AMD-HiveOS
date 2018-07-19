#!/usr/bin/env bash

stats_raw=`curl --connect-timeout 2 --max-time $API_TIMEOUT --silent --noproxy '*' http://127.0.0.1:60050`
#echo $stats_raw | jq .
if [[ $? -ne 0 || -z $stats_raw ]]; then
echo -e "${YELLOW}Failed to read $miner from localhost:60050${NOCOLOR}"
else
khs=`echo $stats_raw | jq -r '.hashrate.total[0]' | awk '{print $1/1000}'`
local ac=$(jq '.results.shares_good' <<< "$stats_raw")
local rj=$(( $(jq '.results.shares_total' <<< "$stats_raw") - $ac ))
stats=$(jq --argjson temp "$temp" --argjson fan "$fan" --arg ac "$ac" --arg rj "$rj"  \
'{hs: [.hashrate.threads[][0]], algo: .algo, $temp, $fan, uptime: .connection.uptime, ar: [$ac, $rj]}' <<< "$stats_raw")
fi

