## U200 RF Parameters

[[中文]](../../../cn/device_and_usage_manual/ANTSDR_U_Series_Module/ANTSDR_U200_Reference_Manual/AntsdrU200_RF_parameters_cn.html)

### U200 TX Power
The AD9361 is a high performance, highly integrated radio frequency (RF) Agile Transceiver™ designed for use in 3G and 4G base station applications. Its programmability and wideband capability make it ideal for a broad range of transceiver applications. The device combines a RF front end with a flexible mixed-signal baseband section and integrated frequency synthesizers, simplifying design-in by providing a configurable digital interface to a processor. The AD9361 receiver LO operates from 70 MHz to 6.0 GHz and the transmitter LO operates from 47 MHz to 6.0 GHz range, covering most licensed and unlicensed bands. Channel bandwidths from less than 200 kHz to 56 MHz are supported.

### AD9361 Data Sheet

You can find the ad9361 Data Sheet here:

[Data Sheet](https://www.analog.com/en/products/ad9361.html)

### ANTSDR Selection

| Signal Name   |     U220        |  U200     |E200              | E310      | E316        |
| ------------- | ----------      |------     | --------------   | ----------| ----------  |   
| RFIC          | AD9361/3        |  AD9363           |   AD9361/3       |AD9361/3  |  AD9361/3    |
| RF channel    |  2T2R MIMO      |SMA:1T1R IPEX:1T1R  |SMA:1T1R IPEX:1T1R|2T2R MIMO  |2T2R MIMO      |
| FPGA/SoC      | ARTIX7 200T     | ARTIX7 100T |ZYNQ XC7Z020  | ZYNQ XC7Z020   |ZYNQ XC7Z020   |
| DDR3          |  PL 512MB       | PL 512MB        |PS 512MB     | PS 1GB         | PS 1GB        |
| Host Interface                  |    USB3.0 | USB3.0        |      1G ETH      | 1G ETH         |1G ETH           |
| Transmission bandwidth to host  |  56MSPS    |56MSPS       |     20MSPS      | 10MSPS         | 20MSPS          | 
|Clock synchronization            |   10M/PPS /GPS  | 10M/PPS  |10M/PPS          | 10M/PPS        | 10M/PPS          |
| API        |  UHD & C/C++ /PYTHON  | UHD & C/C++ /PYTHON  | Libiio & UHD /C/C++ /PYTHON  | Libiio &  C/C++ /PYTHON  |   Libiio & UHD & C/C++ /PYTHON |  
