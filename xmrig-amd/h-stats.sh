#!/usr/bin/env bash

stats_raw=`curl --connect-timeout 2 --max-time $API_TIMEOUT --silent --noproxy '*' http://127.0.0.1:65056`
threads_raw=`curl --connect-timeout 2 --max-time $API_TIMEOUT --silent --noproxy '*' http://127.0.0.1:65056/1/threads`
if [[ $? -ne 0 || -z $stats_raw ]]; then
echo -e "${YELLOW}Failed to read $miner from localhost:65056${NOCOLOR}"
else
khs=`echo $stats_raw | jq -r '.hashrate.total[0]' | awk '{print $1/1000}'`
local hs_units="hs"
local hr=`echo $threads_raw | jq -c '.threads[] | {index, hashrate}' | awk -F"," '{a[$1]+=$3}END{for(i in a) print i,a[i]}' | sort | sed -r 's/^[^ ]+//' | tr -d ' '`
local gpu_worked=`echo $threads_raw | jq '.threads[].index' | sort | uniq`
local gpu_busid=(`echo "$gpu_detect_json" | jq -r '[ . | to_entries[] | select(.value) | .value.busid [0:2] ] | .[]' | sed '/^00/d'`)
local busids=''
local idx=0
for i in $gpu_worked; do
gpu=${gpu_busid[$i]}
busids[idx]=$((16#$gpu))
idx=$((idx+1))
done
local iv=`cat /var/log/miner/custom/xmrigamd.log | grep -i 'COMPUTE ERROR' | wc -l`
local temp=$(jq '.temp' <<< $gpu_stats)
local fan=$(jq '.fan' <<< $gpu_stats)

stats=$(jq \
--arg hs_units "$hs_units" \
--argjson temp "$temp" \
--argjson fan "$fan" \
--arg iv "$iv" \
--argjson hr "`echo ${hr} | jq -cs '.'`" \
--argjson bus_numbers "`echo ${busids[@]} | jq -cs '.'`" \
'{hs: $hr, algo: .algo, $temp, $fan, $hs_units, uptime: .connection.uptime, ar: [.results.shares_good, .results.shares_total - .results.shares_good, $iv], $bus_numbers, ver: .version}' <<< "$stats_raw")
fi
