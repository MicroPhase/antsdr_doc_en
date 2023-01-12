# E200 Getting Started Guides


## E200 Overview

The main CPU of the E200 is a Xilinx Zynq SoC XC7Z020. It is both a dual-core ARM Cortex A9 CPU and Artix-7 FPGA on a single die. 

The programmable logic (PL, or FPGA) section of the SoC is responsible for handling all sampling data, DMA connections, and any other high-speed utility such as DDC/DUC. The processing system (PS, or CPU) is running a custom-build buildroot Linux operating system. The OS is responsible for all the device and peripheral management.

- Hardware Capabilities:
    - Xilinx Zynq SoC with dual-core ARM Cortex A9 and Artix-7 FPGA (XC7Z020)
    - Analog Devices AD9361 RFIC direct-conversion transceiver
    - 1 Gigabit Ethernet port 
    - External PPS/10M reference input
    - 2 transmitters and 2 receivers, half or full duplex
    - Flexible rate, 12-bit ADC and DAC
    - Integrated RF frontend (AD9361: 70 MHz - 6 GHz, AD9363: 325MHz - 3.8GHz)
    - Variable analog bandwidth (AD9361: 200 kHz - 56 MHz, AD9363: 200KHz - 20MHz)
- Software Capabilities: 
  - Full Linux system running on the ARM core
  - Communication between host computer and E200 is through libiio or uhd interface.


## Getting Started
This will run you through the first steps relevant to getting your E200 up and running. Note: This guide was creating on an Ubuntu 20.04 machine, and other distributions or OS's may have different names/methods.

- Required equipment
  - one SD card
  - one ethernet cable
  - one usb Type-C cable
### IIO based firmware
#### Download and update firmware
You can download the latest firmware form our [antsdr-fw-patch github release](https://github.com/MicroPhase/antsdr-fw-patch).

Unzip the released file, and copy the boot image into a sd card (the sd card need fat32 partition). And then, insert the SD card into the device. Power on the board.

#### Install drivers on host

- Install dependencies
  ```bash
  sudo apt install libxml2 libxml2-dev bison flex cmake git libaio-dev libboost-all-dev \
  libusb-1.0-0-dev libavahi-common-dev libavahi-client-dev doxygen bison flex cmake git \
  libgmp-dev liborc-dev swig
  ```
- Download and build libiio
  ```bash
  git clone https://github.com/analogdevicesinc/libiio.git
  cd libiio
  mkdir build
  cd build
  cmake .. -DPYTHON_BINDINGS=ON
  make 
  sudo make install
  sudo ldconfig
  cd ../..
  ```
- Download and build libad9361-iio
  ```bash
  git clone https://github.com/analogdevicesinc/libad9361-iio.git
  cd libad9361-iio
  mkdir build
  cd build
  cmake .. -DPYTHON_BINDINGS=ON
  make 
  sudo make install
  sudo ldconfig
  cd ../..
  ```

#### Verifying the Connection
Plug an Ethernet cable into the Ethernet port of E200.
Connect the other end of the Ethernet cable to the Ethernet port on your computer.

The devices has a static ip address of 192.168.1.10, you should set your host ethernet port ip address to the same domain, such as 192.168.1.100.

Open the Network and Sharing Center. Click on Change adapter settings.  Right-click on the Ethernet adapter and select Properties. Select Internet Protocol Version 4 (TCP/IPv4) and click the Properties button. Select the Use the following IP address option
Enter the IP address as 192.168.1.100.
Enter the Subnet mask as 255.255.255.0.
Enter the Default gateway as 192.168.1.1.
Click OK to save the settings.

You can `ping 192.168.1.10` to check the network connection, then you can use 
`iio_info -u "ip:192.168.1.10"` to get the device's information.


### UHD based firmware
#### Download and update firmware
You can download the latest firmware form our [antsdr-uhd github release](https://github.com/MicroPhase/antsdr_uhd).
Unzip the released file, and copy the boot image into a sd card (the sd card need fat32 partition). And then, insert the SD card into the device. Power on the board.
#### Install drivers on host
- Install dependencies
  ```bash
  sudo apt-get install autoconf automake build-essential ccache cmake cpufrequtils doxygen ethtool \
  g++ git inetutils-tools libboost-all-dev libncurses5 libncurses5-dev libusb-1.0-0 libusb-1.0-0-dev \
  libusb-dev python3-dev python3-mako python3-numpy python3-requests python3-scipy python3-setuptools \
  python3-ruamel.yaml 
  ```
- Getting the source code
  ```bash
  git clone https://github.com/MicroPhase/antsdr_uhd
  ```
  Our source code repository contains of the following branch or tags:
  master: This is the main development branch, the uhd version is 4.1.0.0 for this branch now.
  uhd-3.15-release is for uhd 3.15-LTS.

#### Install drivers on host
```bash
cd antsdr_uhd/host
mkdir build
cd build
```
The default install path for uhd is **/usr/local**, if you want a custom install prefix, configuration variables can be passed into CMake via the command line. 

For a custom install prefix: **-DCMAKE_INSTALL_PREFIX=<install-path>**, for example:
```bash
cmake -DCMAKE_INSTALL_PREFIX=/usr ../
```
In this guide, we use the default path.
```bash
cmake ../
make -j$(nproc)
sudo make install
sudo ldconfig
```
#### Verifying the Connection
You can set your computer's ip address to `192.168.1.x`. Then you can use `uhd_find_devices` and `uhd_usrp_probe` to get the information of the board.