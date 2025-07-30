# 设置固件IP

[[English]](../../../../device_and_usage_manual/ANTSDR_E_Series_Module/ANTSDR_E310_Reference_Manual/set_the_iio_firmware_ip.html)

如果您想在使用**PlutoSdr**固件时兼容使用多个ANTSDR-E310设备，您将需要本指南来设置MAC和IP地址。

## QSPI 启动模式
### 设置 MAC 地址
1. 
    您可以通过ssh或者串口工具进入E310的linux系统，默认ip为 `192.168.1.10`，串口波特率为 `115200`，使用网口时请确保可以 ping 通开发板。

    **默认用户名和密码**：
    
    用户名: `root` 
    
    密码: `analog`

2. 
    进入linux系统后，例如，使用命令 `fw_setenv` 设置mac地址。

    ```sh
    fw_setenv ethaddr 00:0a:35:00:08:30
    ```

3. 
    然后输入`reboot`命令重启设备或者重新上电。
    ```sh
    reboot
    ```

4. 
    如果没有其他反应，可以进入系统使用 `ifconfig` 命令查看MAC地址是否修改成功。

    ```txt
    # ifconfig 
    eth0      Link encap:Ethernet  HWaddr 00:0A:35:00:08:30  
            inet addr:192.168.1.10  Bcast:0.0.0.0  Mask:255.255.255.0
            UP BROADCAST RUNNING MULTICAST  MTU:1500  Metric:1
            RX packets:10 errors:0 dropped:0 overruns:0 frame:0
            TX packets:18 errors:0 dropped:0 overruns:0 carrier:0
            collisions:0 txqueuelen:1000 
            RX bytes:1065 (1.0 KiB)  TX bytes:2904 (2.8 KiB)
            Interrupt:29 Base address:0xb000 
    
    lo        Link encap:Local Loopback  
            inet addr:127.0.0.1  Mask:255.0.0.0
            UP LOOPBACK RUNNING  MTU:65536  Metric:1
            RX packets:0 errors:0 dropped:0 overruns:0 frame:0
            TX packets:0 errors:0 dropped:0 overruns:0 carrier:0
            collisions:0 txqueuelen:1000 
            RX bytes:0 (0.0 B)  TX bytes:0 (0.0 B)
    
    usb0      Link encap:Ethernet  HWaddr 00:05:F7:19:E7:93  
            inet addr:192.168.2.1  Bcast:0.0.0.0  Mask:255.255.255.0
            UP BROADCAST MULTICAST  MTU:1500  Metric:1
            RX packets:0 errors:0 dropped:0 overruns:0 frame:0
            TX packets:0 errors:0 dropped:0 overruns:0 carrier:0
            collisions:0 txqueuelen:1000 
            RX bytes:0 (0.0 B)  TX bytes:0 (0.0 B)
    
    ```
    可以看到网卡`eth0`的MAC地址修改成功。

### 设置 IP

默认IP为 `192.168.1.10`，如果需要修改IP也需要进入系统。

1. 
    如果只是需要临时修改IP地址的话，可以像在 Ubuntu 系统上修改IP一样使用 `ifconfig` 命令进行修改。

    **使用此方法，重启设备后会恢复默认IP地址（192.168.1.10）。**

2. 
    如果要永久修改IP地址，就必须使用 `fw_setenv` 命令。
    ```sh
    fw_setenv ipaddr_eth 192.168.2.1
    ```

3. 
    重新启动设备。


## SD 启动模式
### 设置 MAC 地址
1. 
    如果是SD卡启动模式，那么需要修改SD卡 `uEnv.txt` 文件. 找到 ```ethaddr=00:0a:35:00:01:22``` 并改变它 ```ethaddr=xx:xx:xx:xx:xx:xx```

    然后重新启动设备。


### 设置 IP

通过SD卡启动更改IP的方法与通过QSPI启动更改IP的方法相同。