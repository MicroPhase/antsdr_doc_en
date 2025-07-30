# Set Firmware IP


[[中文]](../../../cn/device_and_usage_manual/ANTSDR_E_Series_Module/ANTSDR_E310_Reference_Manual/set_the_iio_firmware_ip_cn.html)

If you plan to use multiple ANTSDR-E310 devices with **PlutoSDR-compatible** firmware, you’ll need to configure unique MAC and IP addresses for each device. This guide will walk you through the process.
## QSPI Flash Boot Mode
### Setting MAC Address
1. 
    Access the E310 Linux system via SSH or a serial port tool. The default IP address is `192.168.1.10`, and the serial port baud rate is `115200`. If connecting over Ethernet, make sure you can ping the device.

    **Default login credentials**:

    - Username: `root`

    - Password: `analog`

2. After logging in, set the MAC address using the `fw_setenv` command. 

    For example:

    ```sh
    fw_setenv ethaddr 00:0a:35:00:08:30
    ```

3. 
    Reboot the device by running the following command or by power cycling the device:
    ```sh
    reboot
    ```

4. 
    Once the system restarts, use the `ifconfig` command to verify that the MAC address was successfully updated:

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
    The MAC address for `eth0` should now reflect the updated value.

### Set IP 
The default IP address is `192.168.1.10`. To change it, follow the steps below:

1. To **temporarily** change the IP address, use the `ifconfig` command, similar to how it's done on Ubuntu systems:

    ```
    ifconfig eth0 192.168.2.1
    ```

    > [!WARNING]
    >
    > This change is **not persistent**. The IP address will revert to `192.168.1.10` after a reboot.

    

2. 
    To **permanently** change the IP address, use the `fw_setenv` command:
    ```sh
    fw_setenv ipaddr_eth 192.168.2.1
    ```

3. 
    Restart the device for the changes to take effect.


## SD Card Boot Mode
### Setting MAC Address
1. If booting from an SD card, you’ll need to modify the `uEnv.txt` file on the SD card. 
    
    Locate the line:
    
    ```
    ethaddr=00:0a:35:00:01:22
    ```
    
    And replace it with your desired MAC address:
    
    ```
    ethaddr=xx:xx:xx:xx:xx:xx
    ```
    
    Then boot the device.


### Setting the IP Address
The process for setting the IP address when using SD card boot mode is identical to that of the QSPI flash boot method.