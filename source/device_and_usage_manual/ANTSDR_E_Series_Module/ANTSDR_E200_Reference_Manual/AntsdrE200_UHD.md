## E200 UHD

[[中文]](../../../cn/device_and_usage_manual/ANTSDR_E_Series_Module/ANTSDR_E200_Reference_Manual/AntsdrE200_UHD_cn.html)


You can find this project on GitHub: [ANTSDR UHD](https://github.com/MicroPhase/antsdr_uhd/blob/master/host/README.md). Different versions have different differences.

### Build on Ubuntu
#### Build Dependencies
You can install all the dependencies through the package manager:

```
sudo apt-get install autoconf automake build-essential ccache cmake cpufrequtils doxygen ethtool \
g++ git inetutils-tools libboost-all-dev libncurses5 libncurses5-dev libusb-1.0-0 libusb-1.0-0-dev \
libusb-dev python3-dev python3-mako python3-numpy python3-requests python3-scipy python3-setuptools \
python3-ruamel.yaml
```

#### Build Instructions
- **Generate Makefile with CMake**
```
cd host/
mkdir build
cd build
cmake -DENABLE_X400=OFF -DENABLE_N320=OFF -DENABLE_X300=OFF -DENABLE_USRP2=OFF -DENABLE_USRP1=OFF -DENABLE_N300=OFF -DENABLE_E320=OFF -DENABLE_E300=OFF ../
```
- **Make**
```
make
```
- **Install**
```
sudo make install
sudo ldconfig
```
The default installation path: `/usr/local/lib/uhd`

### Test with e200
After connecting the network port and powering on the E200, run the command `uhd_usrp_probe`. An example output is shown below:
```
jcc@jcc:~$ uhd_usrp_probe 
[INFO] [UHD] linux; GNU C++ version 8.4.0; Boost_106501; UHD_3.15.0.dev-0-8b82588b
[INFO] [ANTSDR] Search Microphase ANTSDR E200.
[INFO] [E200] Detected Device: ANTSDR
[INFO] [E200] Initialize CODEC control...
[INFO] [E200] _Product B205MINI(COMPATIBLE)...
[INFO] [E200] Initialize Radio control...
[INFO] [E200] Performing register loopback test... 
[INFO] [E200] Register loopback test passed
[INFO] [E200] Setting master clock rate selection to 'automatic'.
[INFO] [E200] Asking for clock rate 16.000000 MHz... 
[INFO] [E200] Actually got clock rate 16.000000 MHz.
  _____________________________________________________
 /
|       Device: ANT-E-Series Device
|     _____________________________________________________
|    /
|   |       Mboard: ANTSDR-EXXX
|   |   No mboard EEPROM found.
|   |   FPGA Version: 7.0
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
|   |   |   |       RX Codec: A
|   |   |   |   Name: ANTSDR-EXXX RX dual ADC
|   |   |   |   Gain Elements: None
|   |     _____________________________________________________
|   |    /
|   |   |       TX DSP: 0
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
|   |   |   |       TX Codec: A
|   |   |   |   Name: ANTSDR-EXXX TX dual DAC
|   |   |   |   Gain Elements: None
```
When you see the above output, it means UHD is successfully running on the E200.

