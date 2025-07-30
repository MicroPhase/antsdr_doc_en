## ANTSDR FW Patch 

[[English]](../../../../device_and_usage_manual/ANTSDR_E_Series_Module/ANTSDR_E310_Reference_Manual/Antsdr-fw-patch.html)

该存储库用于制作 Microphase 软件无线电设备固件。

你可以在GitHub上找到这个项目的地址: [ANTSDR-FW-Patch](https://github.com/MicroPhase/antsdr-fw-patch). 不同版本有不同的区别。

### 构建说明

固件采用 [Xilinx Vivado 2023.2](https://account.amd.com/en/forms/downloads/xef.html?filename=FPGAs_AdaptiveSoCs_Unified_2023.2_1013_2256.tar.gz)(v0.39). 您需要在 Linux PC 上安装正确的 Vivado 版本，然后按照以下说明生成固件 [ANTSDR E310](https://item.taobao.com/item.htm?spm=a230r.1.14.16.34e21142YIlxqx&id=647986963313&ns=1&abbucket=2#detail) or [ANTSDR E200](https://item.taobao.com/item.htm?spm=a1z10.3-c-s.w4002-17060615344.9.4f201b9f6YDKU2&id=691394502321) or [ANTSDR E310V2](https://item.taobao.com/item.htm?spm=a21xtw.29178619.product_shelf.8.3b923f77eJKa3u&id=708976727818&) 然后。如果您想构建其他版本，请查看历史记录存储库。

### 安装构建要求

```sh
sudo apt-get install git build-essential fakeroot libncurses5-dev libssl-dev ccache 
sudo apt-get install dfu-util u-boot-tools device-tree-compiler mtools
sudo apt-get install bc python cpio zip unzip rsync file wget 
sudo apt-get install libtinfo5 device-tree-compiler bison flex u-boot-tools
sudo apt-get purge gcc-arm-linux-gnueabihf
sudo apt-get install libmpc-dev
sudo apt-get remove libfdt-de
```

### 获取源代码并设置 bash

1. 从 git 获取源代码
	- v0.39
		
		```sh
		git clone -b v0.39 --recursive https://github.com/MicroPhase/antsdr-fw-patch.git
		```
2. 工具链

   由于 **Vivado/Vitis** 附带的 AMD/Xilinx GCC 工具链与 **Buildroot** 不兼容，本项目已切换到 **Buildroot** 外部 工具链: **[Linaro GCC 7.3-2018.05 7.3.1](https://releases.linaro.org/components/toolchain/binaries/7.3-2018.05/arm-linux-gnueabihf/)**


3. 设置环境变量
	- v0.39
        ```sh
        export CROSS_COMPILE=arm-linux-gnueabihf-
        export PATH=$PATH:/Toolchain-PATH/gcc-linaro-7.3.1-2018.05-i686_arm-linux-gnueabihf/bin
        export VIVADO_SETTINGS=/opt/Xilinx/Vivado/2023.2/settings64.sh
        ```

### 导出目标

1. ant e310

   ```sh
   export TARGET=ant
   ```

2. ant e200
	```sh
	export TARGET=e200
	```
	
3. ant e310v2

   ```sh
   export TARGET=e310v2
   ```

  

### Patch

完成以上步骤后，开始Patch。

```sh
cd antsdr-fw-patch
```

1. ant e310

   ```sh
   sh patch.sh ant
   ```

2. ant e200

   ```sh
   sh patch.sh e200
   ```
   
3. ant e310v2

   ```sh
   sh patch.sh e310v2
   ```

   

如果补丁成功应用，您将看到以下信息。

```txt
jcc@jcc:~/work/Git/mp/antsdr-fw-patch$ sh patch.sh e200
Patch check...
 ...
 ...
 Makefile               |   29 +++++++-
 scripts/antsdre200.its |  174 ++++++++++++++++++++++++++++++++++++++++++++++++
 scripts/antsdre200.mk  |   10 +++
 3 files changed, 211 insertions(+), 2 deletions(-)
Patch...
...
...
patch finish

```

### 构建

然后你就可以制作固件了。

```sh
cd plutosdr-fw
make
```

固件编译完成后，您将在 build 文件夹中看到以下文件。这些文件用于闪存更新。（此设备为 e200 设备）

```txt
jcc@jcc:~/work/Git/mp/antsdr-fw-patch/plutosdr-fw$ ls -AGhl build
总用量 319M
-rw-rw-r-- 1 jcc  12M 12月 26 11:06 antsdre200.dfu
-rw-rw-r-- 1 jcc  12M 12月 26 11:06 antsdre200.frm
-rw-rw-r-- 1 jcc   33 12月 26 11:06 antsdre200.frm.md5
-rw-rw-r-- 1 jcc  12M 12月 26 11:06 antsdre200.itb
-rw-rw-r-- 1 jcc  20M 12月 26 11:06 antsdr-fw-v0.34-dirty.zip
-rw-rw-r-- 1 jcc 670K 12月 26 11:06 antsdr-jtag-bootstrap-v0.34-dirty.zip
-rw-rw-r-- 1 jcc   69 12月 26 11:06 boot.bif
-rw-rw-r-- 1 jcc 508K 12月 26 11:06 boot.bin
-rw-rw-r-- 1 jcc 508K 12月 26 11:06 boot.dfu
-rw-rw-r-- 1 jcc 637K 12月 26 11:06 boot.frm
-rw-rw-r-- 1 jcc 245M 12月 26 11:06 legal-info-v0.34-dirty.tar.gz
-rw-rw-r-- 1 jcc 527K 12月 26 10:51 LICENSE.html
-rw-rw-r-- 1 jcc 524K 12月 26 11:05 ps7_init.c
-rw-rw-r-- 1 jcc 524K 12月 26 11:05 ps7_init_gpl.c
-rw-rw-r-- 1 jcc 4.2K 12月 26 11:05 ps7_init_gpl.h
-rw-rw-r-- 1 jcc 4.8K 12月 26 11:05 ps7_init.h
-rw-rw-r-- 1 jcc 2.8M 12月 26 11:05 ps7_init.html
-rw-rw-r-- 1 jcc  35K 12月 26 11:05 ps7_init.tcl
-rw-r--r-- 1 jcc 5.4M 12月 26 10:56 rootfs.cpio.gz
drwxrwxr-x 6 jcc 4.0K 12月 26 11:06 sdk
-rw-rw-r-- 1 jcc 2.3M 12月 26 11:06 system_top.bit
-rw-rw-r-- 1 jcc 568K 12月 26 11:05 system_top.hdf
-rwxrwxr-x 1 jcc 471K 12月 26 11:06 u-boot.elf
-rw-rw---- 1 jcc 128K 12月 26 11:06 uboot-env.bin
-rw-rw---- 1 jcc 129K 12月 26 11:06 uboot-env.dfu
-rw-rw-r-- 1 jcc 6.8K 12月 26 11:06 uboot-env.txt
-rwxrwxr-x 1 jcc 4.0M 12月 26 10:45 zImage
-rw-rw-r-- 1 jcc  19K 12月 26 10:56 zynq-antsdre200.dtb
```



### 制作sd卡固件

固件构建完成后，您可以为设备构建 SD 卡启动映像。只需输入以下命令。

```sh
make sdimg
```

您将在 build_sdimg 文件夹中看到 SD 启动映像。您只需将该文件夹中的所有这些文件复制到 SD 卡中，将 SD 卡插入 ANTSDR，并将跳线设置为 SD 卡启动模式即可。

### DFU

DFU 模式仅适用于 ANTSDR E310 和 ANTSDR E316，**不支持 E200**。如果您的设备是 E310，您可以通过 DFU 模式更新闪存。将跳线设置为 Flash Boot 模式。设备通电后，按下 DFU 按钮，您将看到设备中的两个 LED 指示灯均变为绿色，现在就可以更新闪存了。您需要先进入 build 文件夹，然后将 Micro USB 插入 OTG 接口。然后，运行以下命令。
```sh
sudo dfu-util -a firmware.dfu -D ./ant.dfu
sudo dfu-util -a boot.dfu -D ./boot.dfu
sudo dfu-util -a uboot-env.dfu -D ./uboot-env.dfu
sudo dfu-util -a uboot-extra-env.dfu -U ./uboot-extra-env.dfu
```

现在您可以重新启动设备。



### 支持两手两发模式

如果要使用 2r2t 模式，需要进入系统并运行以下命令将模式配置写入 nor flash。**但是 SD 卡启动模式和 QSPI 启动模式略有不同**

### QSPI 启动模式
   ```sh
 fw_setenv attr_name compatible
 fw_setenv attr_val ad9361
 fw_setenv compatible ad9361
 fw_setenv mode 2r2t
 reboot
   ```

重启后，使用命令检测 flash 中的变量是否已写入。如果写入成功，则可以使用 2r2t 模式。

当然，还有另一种方法可以配置 2r2t 模式，并在 uboot 下使用命令写入 flash，例如

```sh
 setenv attr_name compatible
 setenv attr_val ad9361
 setenv compatible ad9361
 setenv mode 2r2t
 saveenv
 reset
```

 ### SD 启动模式

您需要修改uEnv.txt文件中的一些参数。

1. 您需要修改**adi_loadvals**的值，如下所示：

修复之前：
```txt
 adi_loadvals=fdt addr ${fit_load_address}......
```
修复之后：
 ```txt
 adi_loadvals=fdt addr ${devicetree_load_address}......
 ```

2. 您需要修改**mode**的值，如下所示：

修复之前：
```txt
maxcpus=1
mode=1r1t
```
修复之后：
```txt
maxcpus=1
mode=2r2t
```

3. 您需要修改**sdboot（添加运行 adi_loadvals 和 #{fit_config}）**的值，如下所示：


修复之前：

```txt
sdboot=if mmcinfo; then run uenvboot; echo Copying Linux from SD to RAM... && load mmc 0 ${fit_load_address} ${kernel_image} && load mmc 0 ${devicetree_load_address} ${devicetree_image} && load mmc 0 ${ramdisk_load_address} ${ramdisk_image} bootm ${fit_load_address} ${ramdisk_load_address} ${devicetree_load_address}; fi
```

修复之后：

```txt
sdboot=if mmcinfo; then run uenvboot; echo Copying Linux from SD to RAM... && load mmc 0 ${fit_load_address} ${kernel_image} && load mmc 0 ${devicetree_load_address} ${devicetree_image} && load mmc 0 ${ramdisk_load_address} ${ramdisk_image} && run adi_loadvals;bootm ${fit_load_address} ${ramdisk_load_address} ${devicetree_load_address}#{fit_config}; fi
```

4.您需要在最后一行**添加以下参数（attr_name attr_val compatible ）**：

修复之前：

```txt
usbboot=if usb start; then run uenvboot; echo Copying Linux from USB to RAM... && load usb 0 ${fit_load_address} ${kernel_image} && load usb 0 ${devicetree_load_address} ${devicetree_image} && load usb 0 ${ramdisk_load_address} ${ramdisk_image} && bootm ${fit_load_address} ${ramdisk_load_address} ${devicetree_load_address}; fi
```
修复之后：

```txt
usbboot=if usb start; then run uenvboot; echo Copying Linux from USB to RAM... && load usb 0 ${fit_load_address} ${kernel_image} && load usb 0 ${devicetree_load_address} ${devicetree_image} && load usb 0 ${ramdisk_load_address} ${ramdisk_image} && bootm ${fit_load_address} ${ramdisk_load_address} ${devicetree_load_address}; fi
attr_name=compatible
attr_val=ad9361
compatible=ad9361
```
然后你就可以享受2r2t模式了。