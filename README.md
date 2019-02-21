### Hive OS Custom Miner integration
Used manual at https://github.com/minershive/hiveos-linux/tree/master/hive/custom/

### Current XMRig-AMD version
* 2.13.0 https://github.com/xmrig/xmrig-amd/releases/tag/v2.13.0

### Download

* Binary releases https://github.com/Kpaccyc/XMRig-AMD-HiveOS/releases

### Upgrade
### Since version 2.12.0, miner automatically checks the new version and updates.

* stop miner
* Run at console ```/hive/miners/custom/custom-get https://github.com/Kpaccyc/XMRig-AMD-HiveOS/releases/download/Release/xmrigamd.tar.gz -f```
* start miner

![image](https://user-images.githubusercontent.com/41443179/46308860-6e064780-c5c3-11e8-9536-215d94c82325.png)

### Usage
Fill the fields as follows:
* Miner name:
```xmrigamd```
* Installation URL:
```https://github.com/Kpaccyc/XMRig-AMD-HiveOS/releases/download/Release/xmrigamd.tar.gz```
* Hash algorithm:
```Chose coin algo```
* Wallet and worker template:
```%WAL%```
* Pool URL:
```You'r pool ORL and port```
* Pass:
```Check you'r pool settings```
* Extra config arguments:
``` -a (algo) -k --opencl-devices=(you devices ID) --opencl-launch=(intensity(x)worksize)```

![image](https://user-images.githubusercontent.com/41443179/45201110-9036cf00-b27c-11e8-9bd2-b40556f6cee4.png)



### Excta config arguments:

```json
-a                       cryptonight (default) cryptonight-lite, cryptonight-heavy, cryptonight-turtle
--variant                specificy the PoW variat to use: -> auto (default), 0 (v0), 1 (v1, aka monerov7, aeonv7), tube (ipbc), alloy, msr, xhv, rto, half (xtl)
--tls                    enable SSL/TLS support (needs pool support)
--tls-fingerprint=F      pool TLS certificate fingerprint, if set enable strict certificate pinning
--opencl-devices=N       list of OpenCL devices to use.
--opencl-launch=IxW      list of launch config, intensity and worksize
--opencl-strided-index=N list of strided_index option values for each thread
--opencl-mem-chunk=N     list of mem_chunk option values for each thread
--opencl-comp-mode=N     list of comp_mode option values for each thread
--opencl-unroll          list of unroll option values for each thread
--opencl-affinity=N      affine GPU threads to a CPU
--opencl-platform=N      OpenCL platform index
--donate-level=N         donate level, default 1% (1 minute in 100 minutes)
--nicehash               enable nicehash support
```
All configuration commands are entered sequentially as to start the miner from the command line


### Donations
Default donation 1% (1 minute in 100 minutes) can be adjusted via command line option --donate-level

* Kpaccyc:

XMR:```47eCFEmyerT3PbEUYUL6XSgnvPohXmCJAcAFXXor1Mp2UxvHxTuB3fcbkPrxe6fbxJaGy91bDhTPEGo9yTQU6LsA97ozTMK```

* xmrig https://github.com/xmrig:

XMR:```48edfHu7V9Z84YzzMa6fUueoELZ9ZRXq9VetWzYGzKt52XU5xvqgzYnDK9URnRoJMk1j8nLwEVsaSWJ4fhdUyZijBGUicoD```
BTC:```1P7ujsXeX7GxQwHNnJsRMgAdNkFZmNVqJT```
