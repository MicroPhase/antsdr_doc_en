# How to set ip address

This document allows you to quickly set the IP address of the E200 under uhd firmware.

## SD card boot mode

UHD firmware can only be started under the SD card, so in order to conveniently set the IP, it can be modified after entering the system.

1. You can enter the linux system of E200 through ssh or serial port tool. The default ip is **192.168.1.10** and the baud rate of the serial port is **115200**. when using the network port, please make sure you can ping the board. 

   The **default username and password**:

   username:root 

   password:**microphase**

2. After enter the linux system, Set the mac address **using the command ip_set**, for example.

   ```sh
   # ip_set 192.168.1.10
   /** write ip length succeed **/
   /** write ip succeed **/
   ```

3. reboot

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