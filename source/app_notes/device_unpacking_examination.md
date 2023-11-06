# Device Unpacking examination

At this time, I would like to briefly introduce the use of AntSDR.

It is well know that E200 supports Pluto and UHD firmware, so here we briefly introduce how to use it.

## Pluto firmware

E200 has burned the Pluto firmware into QSPI when it leaves the factory. Therefore, using the Pluto firmware is a relatively simple matter, you only need to set the device to QSPI boot mode. The pluto firmware default ip is **192.168.1.10**,The username and password are **root analog**.The baud rate is **115200**.

The DIP switch for setting the boot mode is under the network port. If you ordered the shell, you can clearly see the words BOOT QSPI SD under the network port of the shell.

Here, fluctuate the DIP switch to QSPI if it is SD boot now. When you power it up, you'll usually see a solid blue light and a flashing red light.

### Update the firmware 

Because many PlutoSDR users sometimes create new functions by themselves under FPGA or Linux, they need the ability to update the firmware. Although the E200 does not have a USB port and cannot be updated through dfu, you can manually update it by going into the system.

First, use the serial port or network port ssh service to connect to the device. Device **username: root Password: analog**.

```sh
Welcome to ANTSDR
ant login: root
Password: 
Welcome to:
    ___    _   _____________ ____  ____ 
   /   |  / | / /_  __/ ___// __ \/ __ \
  / /| | /  |/ / / /  \__ \/ / / / /_/ /
 / ___ |/ /|  / / /  ___/ / /_/ / _, _/ 
/_/  |_/_/ |_/ /_/  /____/_____/_/ |_|  
                                       
v0.34-dirty
https://github.com/MicroPhase/antsdr-fw
# 
```

It will appear such an interface, and then send the frm file antsdre200.frm you need to update to the device through the network port. The default network port ip of the device is **192.168.1.10**.  Use the ls command to check whether the firmware is sent.

```sh
# ls
antsdre200.frm
```

Use the command **update_frm.sh antsdre200.frm** to update the firmware. Next, the red light will keep flashing, please do not touch the device or power off during this process. Wait until the red light flashing is complete, restart the device. This way the device runs the firmware you made yourself.

### Change IP or MAC address

For users who have purchased multiple devices, they may be connected to the same device through a switch. At this time, you need to modify the IP address and MAC address to ensure that you can connect to the device.

Similarly, setting the mac or ip address also needs to be set in the device, you can set the mac address through the following command.

```sh
# fw_setenv ethaddr 00:0a:35:00:08:30
```

To set the ip address, enter the following command

```sh
# fw_setenv ipaddr_eth 192.168.2.1
```

Then restart the device, and you will find that the ip and mac addresses of the device have been modified.

## UHD firmware

The UHD firmware is in the sd card, so you need to dial the device switch to the sd card to start. The uhd firmware default ip is **192.168.1.10**,The username and password are **root microphase**.The baud rate is **115200**. Usually, your computer IP needs to be set to **192.168.1.xx** to establish a connection with the device.

To use uhd firmware, you need to install the uhd driver at https://github.com/MicroPhase/antsdr_uhd.git under this link. The installation method is described in detail in the README of the repo.

After installing the driver and starting the device, run the following command on the computer to find device.

```sh
jcc@jcc:~$ uhd_find_devices 
[INFO] [UHD] linux; GNU C++ version 9.4.0; Boost_107100; UHD_4.1.0.0-28-g6a9de76c
--------------------------------------------------
-- UHD Device 0
--------------------------------------------------
Device Address:
    serial: 0D78CF3537BF749554ED5474BEF64197
    addr: 192.168.1.10
    name: ANTSDR-E200
    product: E200  v1
    type: ant

```

Use the command uhd_usrp_probe to probe the device.

```sh
jcc@jcc:~$ uhd_usrp_probe 
[INFO] [UHD] linux; GNU C++ version 9.4.0; Boost_107100; UHD_4.1.0.0-28-g6a9de76c
[INFO] [ANT] Detected Device: ANTSDR
[INFO] [ANT] Initialize CODEC control...
[INFO] [ANT] Initialize Radio control...
[INFO] [ANT] Performing register loopback test... 
[INFO] [ANT] Register loopback test passed
[INFO] [ANT] Performing register loopback test... 
[INFO] [ANT] Register loopback test passed
[INFO] [ANT] Setting master clock rate selection to 'automatic'.
[INFO] [ANT] Asking for clock rate 16.000000 MHz... 
[INFO] [ANT] Actually got clock rate 16.000000 MHz.
  _____________________________________________________
 /
|       Device: B-Series Device
|     _____________________________________________________
|    /
*****************************************************************
|   |   
|   |   Time sources:  none, internal, external
|   |   Clock sources: internal, external
|   |   Sensors: ref_locked
|   |     _____________________________________________________
|   |    /
|   |   |       RX DSP: 0
|   |   |   
|   |   |   Freq range: -8.000 to 8.000 MHz
|   |     _____________________________________________________
|   |    /
|   |   |       RX DSP: 1
|   |   |   
|   |   |   Freq range: -8.000 to 8.000 MHz
|   |     _____________________________________________________
|   |    /
|   |   |       RX Dboard: A
|   |   |     _____________________________________________________
|   |   |    /
|   |   |   |       RX Frontend: A
|   |   |   |   Name: FE-RX1
|   |   |   |   Antennas: TX/RX, RX2
|   |   |   |   Sensors: temp, rssi, lo_locked
|   |   |   |   Freq range: 50.000 to 6000.000 MHz
|   |   |   |   Gain range PGA: 0.0 to 76.0 step 1.0 dB
|   |   |   |   Bandwidth range: 200000.0 to 56000000.0 step 0.0 Hz
|   |   |   |   Connection Type: IQ
|   |   |   |   Uses LO offset: No
|   |   |     _____________________________________________________
|   |   |    /
|   |   |   |       RX Frontend: B
|   |   |   |   Name: FE-RX2
|   |   |   |   Antennas: TX/RX, RX2
|   |   |   |   Sensors: temp, rssi, lo_locked
|   |   |   |   Freq range: 50.000 to 6000.000 MHz
|   |   |   |   Gain range PGA: 0.0 to 76.0 step 1.0 dB
|   |   |   |   Bandwidth range: 200000.0 to 56000000.0 step 0.0 Hz
|   |   |   |   Connection Type: IQ
|   |   |   |   Uses LO offset: No
|   |   |     _____________________________________________________
|   |   |    /
|   |   |   |       RX Codec: A
|   |   |   |   Name: B210 RX dual ADC
|   |   |   |   Gain Elements: None
|   |     _____________________________________________________
|   |    /
|   |   |       TX DSP: 0
|   |   |   
|   |   |   Freq range: -8.000 to 8.000 MHz
|   |     _____________________________________________________
|   |    /
|   |   |       TX DSP: 1
|   |   |   
|   |   |   Freq range: -8.000 to 8.000 MHz
|   |     _____________________________________________________
|   |    /
|   |   |       TX Dboard: A
|   |   |     _____________________________________________________
|   |   |    /
|   |   |   |       TX Frontend: A
|   |   |   |   Name: FE-TX1
|   |   |   |   Antennas: TX/RX
|   |   |   |   Sensors: temp, lo_locked
|   |   |   |   Freq range: 50.000 to 6000.000 MHz
|   |   |   |   Gain range PGA: 0.0 to 89.8 step 0.2 dB
|   |   |   |   Bandwidth range: 200000.0 to 56000000.0 step 0.0 Hz
|   |   |   |   Connection Type: IQ
|   |   |   |   Uses LO offset: No
|   |   |     _____________________________________________________
|   |   |    /
|   |   |   |       TX Frontend: B
|   |   |   |   Name: FE-TX2
|   |   |   |   Antennas: TX/RX
|   |   |   |   Sensors: temp, lo_locked
|   |   |   |   Freq range: 50.000 to 6000.000 MHz
|   |   |   |   Gain range PGA: 0.0 to 89.8 step 0.2 dB
|   |   |   |   Bandwidth range: 200000.0 to 56000000.0 step 0.0 Hz
|   |   |   |   Connection Type: IQ
|   |   |   |   Uses LO offset: No
|   |   |     _____________________________________________________
|   |   |    /
|   |   |   |       TX Codec: A
|   |   |   |   Name: B210 TX dual DAC
|   |   |   |   Gain Elements: None

```

After installing the driver, you can compile some sdr software through source code or point the uhd symbol from the original uhd symbol to the current driver.

Next you can use uhd firmware on E200.

We would like to take this opportunity to thank you once again for your support and patience.