#!/usr/bin/env bash
cd `dirname $0`

./xmrig-amd -a cryptonight -o 85.172.104.197:49001 -u 1 -p rx550:my@email.com -k --donate-level=0 --opencl-devices=0,0,1,1,2,2,3,3 --opencl-launch=416x12,416x12,416x12,416x12,416x12,416x12,416x12,416x12 | tee /var/log/miner/xmrig-amd/xmrig-amd.log
