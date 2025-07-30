## U220 开箱检查

[[English]](../../../../device_and_usage_manual/ANTSDR_U_Series_Module/ANTSDR_U220_Reference_Manual/AntsdrU220_Unpacking_examination.html)


### 1. 概述

U220 是一款面向创客和SDR爱好者同时也可以满足专业应用场景的软件无线电,支持70 MHz 到 6 GHz 的宽频段射频信号收发，既可以作为 USB 外设使用，也可以通过编程实现脱机运行。众多的开源项目支持和学习教程，让客户接触更多应用成为可能。

![U220](./AntsdrU220_Reference_Manual.assets/U220.jpg)

### 2. 物品清单

感谢您购买微相科技有限公司的 ANTSDR 系列软件无线电平台，当您拿到ANTSDR E310（标准版）之后，打开配件包，其中应包含如下内容，

- ANTSDR 软件无线电: X1

- USB 数据线: X1 

- 短胶棒天线: X2

- 托盘天线: X1

打开包裹之后接下来将机型 SDR 设备的检测


### Windows


ANTSDR 在能够运行 USRP UHD 的固件，在使用过程中，主要以 USRP b210 支持的软件来进行操作。首先将设备连接到电脑 USB3.0，一般来说，电脑上 USB3.0 的接口会是蓝色，具体需要看电脑的具体型号。接下来，右击菜单界面，进入设备管理器


我们可以在其他设备中看见 WestBridge 设备，这个时候并没有安装 USB 驱动。资料中在 firmware 目录下有一个 erllc_uhd_winusb_driver 压缩文件，解压后得到压缩安装包。

![u220_west](./AntsdrU220_Reference_Manual.assets/u220_west.png)

接下来双击该设备选择更新驱动程序，选择浏览我的电脑以查找驱动程序。选择资料中解压的 erllc_uhd_winusb_driver 文件。
点击下一页后开始安装驱动程序，安装成功后，我们可以在设备浏览器中看见 USRP 设备。

![u220](./AntsdrU220_Reference_Manual.assets/u220_usrp.png)

这时说明USB安装成功

#### UHD 驱动安装

安装完 USB 设备后，接下来需要安装 UHD 设备，在提供的 firmware 目录下有一个 windows 文件夹，右击以管理员身份运行应用程序。

![u220](./AntsdrU220_Reference_Manual.assets/u220_windows_driver.png)

选择将UHD添加到系统环境变量

![u220](./AntsdrU220_Reference_Manual.assets/U220_add_path.png)

接下来在 C 盘 ProgramFiles 目录下能看见 UHD 固件，我们将图中的 libusb-1.0.dll 库文件拷贝到 UHD/bin 目录下。

![U220](./AntsdrU220_Reference_Manual.assets/U220uhd_bin.png)

接下来进入 UHD/share 目录，新建一个文件夹名字为 image 。将如下图所示的usrp_b200_fw.hex文件复制到 image 目录下

![U220](./AntsdrU220_Reference_Manual.assets/U220_hex.png)

将 U220的 固件 .bin文件复制到 image目录下 。编辑系统环境变量，将 image 文件夹目录加到环境变量中

![U220](./AntsdrU220_Reference_Manual.assets/U220_path.png)

在 UHD/bin 目录下，连接设备到电脑的 USB3.0 接口，进入控制台程序

![U220](./AntsdrU220_Reference_Manual.assets/find_u220.png)

接下来运行 uhd_usrp_probe.exe 

![U220](./AntsdrU220_Reference_Manual.assets/U220_probe.png)

#### 软件测试

驱动完成安装后，开始测试 U220。我们使用一个开源无线电项目 sdrAngel 来测试。微相提供的 windows 文件夹下已经有了 sdrAngel 的安

![U220](./AntsdrU220_Reference_Manual.assets/U220_sdrangle.png)

将 UHD/bin 中的 uhd.dll 拷贝到 sdrangel 的安装目录，替换掉原有的 uhd.dll

![U220](./AntsdrU220_Reference_Manual.assets/U220_dll.png)

双击打开 sdrangel

![U220](./AntsdrU220_Reference_Manual.assets/SDRangle_add_rx.png)


![U220](./AntsdrU220_Reference_Manual.assets/SDRangle_device.png)

如果没有 u220 设备，请检查驱动是否安装成功，设备是否供电后重启软件。

成功连接后，选择接收为 RX2，选择中心频率，这里我们可以通过 FM 广播电台来测试设备

![U220](./AntsdrU220_Reference_Manual.assets/U220_rx2.png)

设置完成后启动设备

然后添加一个FM 解调器

![U220](./AntsdrU220_Reference_Manual.assets/U220_FM.png)

选择 Broadcast FM Demodulator

此时，能听见声音，但是并不清晰，因此接下来需要将接收频率调整到电台信号出，在笔者这 100.1Mhz 处有一个电台

![U220](./AntsdrU220_Reference_Manual.assets/U220_add_FM.png)

接下来就可以听见电台里的声音了。到这里，开箱检测全部完成

