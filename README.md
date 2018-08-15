### Hive OS Custom Miner integration
Used manual at https://github.com/minershive/hiveos-linux/tree/master/hive/custom/

### Current XMRig-AMD version
* 2.7.3-beta https://github.com/xmrig/xmrig-amd/releases/tag/v2.7.3-beta

### Download

* Binary releases https://github.com/Kpaccyc/XMRig-AMD-HiveOS/releases/tag/v2.7.3-beta

### Usage
Fill the fields as follows:
* Miner name:
```xmrig-amd```
* Installation URL:
```https://github.com/Kpaccyc/XMRig-AMD-HiveOS/releases/download/v2.7.3-beta/xmrig-amd.tar.gz```
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

![image](https://user-images.githubusercontent.com/41443179/44172759-c2726800-a0e6-11e8-83ef-441791872ac4.png)



### Excta config arguments:

```json
-a                    cryptonight (default) cryptonight-lite or cryptonight-heavy
--variant             specificy the PoW variat to use: -> auto (default), 0 (v0), 1 (v1, aka monerov7, aeonv7), tube (ipbc), alloy, xtl (including autodetect for v5), msr, xhv, rto
--opencl-devices=N    list of OpenCL devices to use.
--opencl-launch=IxW   list of launch config, intensity and worksize
--opencl-affinity=N   affine GPU threads to a CPU
--opencl-platform=N   OpenCL platform index
--donate-level=N      donate level, default 5% (5 minutes in 100 minutes)
--nicehash            enable nicehash support
```
All configuration commands are entered sequentially as to start the miner from the command line


### Donations
Default donation 5% (5 minutes in 100 minutes) can be adjusted via command line option --donate-level

* Kpaccyc:

XMR:```47eCFEmyerT3PbEUYUL6XSgnvPohXmCJAcAFXXor1Mp2UxvHxTuB3fcbkPrxe6fbxJaGy91bDhTPEGo9yTQU6LsA97ozTMK```

* xmrig https://github.com/xmrig:

XMR:```48edfHu7V9Z84YzzMa6fUueoELZ9ZRXq9VetWzYGzKt52XU5xvqgzYnDK9URnRoJMk1j8nLwEVsaSWJ4fhdUyZijBGUicoD```
BTC:```1P7ujsXeX7GxQwHNnJsRMgAdNkFZmNVqJT```
