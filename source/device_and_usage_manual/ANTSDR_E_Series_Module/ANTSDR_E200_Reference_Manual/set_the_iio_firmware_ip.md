## Set Firmware IP

[[中文]](../../../cn/device_and_usage_manual/ANTSDR_E_Series_Module/ANTSDR_E200_Reference_Manual/set_the_iio_firmware_ip.html)


### Pluto Firmware
If you want to use multiple ANTSDR-E200 devices when using **PlutoSDR** compatible firmware, you will need this guide to set the mac and ip address.
### QSPI Flash boot mode
#### Set mac address
1. 
    You can enter the linux system of E200 through ssh or serial port tool. The default ip is `192.168.1.10` and the baud rate of the serial port is `115200`. when using the network port, please make sure you can ping the board. 

    **Default login credentials**:

    - Username: `root`

    - Password: `analog`

2. 
    After enter the linux system, Set the mac address **using the command fw_setenv**, for example.

    ```sh
    fw_setenv ethaddr 00:0a:35:00:08:30
    ```

3. 
    Then enter the command reboot to restart the device or re-power.
    ```sh
    reboot
    ```

4. 
    If nothing else, Enter system and you can use the `ifconfig` command to check that the mac address has been successfully modified.

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
    The mac address of the network card `eth0` has been successfully modified.

#### Set IP 
The default IP is `192.168.1.10` , if you need to modify the IP, you also need to enter the system.

1. 
    If you just need to temporarily modify the IP address, you can use the `ifconfig` command like modifying the IP on the ubuntu system is enough.

    **However, this method will restore the default IP address(192.168.1.10) after restarting the device.**

2. 
    If you want to permanently modify the IP address, you must use the `fw_setenv` command such as this.
    ```sh
    fw_setenv ipaddr_eth 192.168.2.1
    ```

3. 
    Then restart the device.


### SD card boot mode
#### Set mac address
1. 
    If it is in the sd card boot mode, then you need to modify the sd card `uEnv.txt` file. Find ```ethaddr=00:0a:35:00:01:22``` and change it ```ethaddr=xx:xx:xx:xx:xx:xx```

    Then start the device.


#### Set IP
The method of changing IP by starting sd card is the same as starting and changing IP by qspi.




### UHD firmware

Setting the E200 IP address using uhd firmware

#### SD card boot mode

UHD firmware can only be started under the SD card, so in order to conveniently set the IP, it can be modified after entering the system.

1. You can enter the Linux system of E200 through ssh or serial port tool. The default IP is `192.168.1.10` and the baud rate of the serial port is `115200`. when using the network port, please make sure you can ping the board. 

    **Default login credentials**:

    - Username: `root`

    - Password: `microphase`

2. After enter the Linux system, Set the mac address **using the command` ip_set`**, for example.

   ```sh
   # ip_set 192.168.1.10
   /** write ip length succeed **/
   /** write ip succeed **/
   ```

3. Reboot

4. If nothing else, Enter system and you can use the ifconfig command to check that the ip address has been successfully modified.

   ```sh
   # ifconfig 
   eth0      Link encap:Ethernet  HWaddr A2:40:4C:87:D6:1E  
             inet addr:192.168.1.10  Bcast:0.0.0.0  Mask:255.255.255.0
             UP BROADCAST RUNNING MULTICAST  MTU:1500  Metric:1
             RX packets:0 errors:0 dropped:0 overruns:0 frame:0
             TX packets:23 errors:0 dropped:0 overruns:0 carrier:0
             collisions:0 txqueuelen:1000 
             RX bytes:0 (0.0 B)  TX bytes:2981 (2.9 KiB)
   
   lo        Link encap:Local Loopback  
             inet addr:127.0.0.1  Mask:255.0.0.0
             UP LOOPBACK RUNNING  MTU:65536  Metric:1
             RX packets:0 errors:0 dropped:0 overruns:0 frame:0
             TX packets:0 errors:0 dropped:0 overruns:0 carrier:0
             collisions:0 txqueuelen:1000 
             RX bytes:0 (0.0 B)  TX bytes:0 (0.0 B)
   
   ```