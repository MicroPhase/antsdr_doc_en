## E310 RF Parameters


[[中文]](../../../cn/device_and_usage_manual/ANTSDR_E_Series_Module/ANTSDR_E310_Reference_Manual/AntsdrE310_RF_parameters_cn.html)

### E310 Tx Power
![e310](./ANTSDR_E310_Reference_Manual.assets/e310_rf_power.png)

The AD9361 is a high performance, highly integrated radio frequency (RF) Agile Transceiver™ designed for use in 3G and 4G base station applications. Its programmability and wideband capability make it ideal for a broad range of transceiver applications. The device combines a RF front end with a flexible mixed-signal baseband section and integrated frequency synthesizers, simplifying design-in by providing a configurable digital interface to a processor. The AD9361 receiver LO operates from 70 MHz to 6.0 GHz and the transmitter LO operates from 47 MHz to 6.0 GHz range, covering most licensed and unlicensed bands. Channel bandwidths from less than 200 kHz to 56 MHz are supported.

### TX1 Single Signal Transmission Test at 1.8 GHz
![e310](./ANTSDR_E310_Reference_Manual.assets/tx1_1.8g_e310.png)

### Receiver Input Isolation Test at 1.8 GHz

Manual gain control is used, with the gain set to 0 dB

RX1:
![e310](./ANTSDR_E310_Reference_Manual.assets/RX1-16.54-1.png)

RX2
![e310](./ANTSDR_E310_Reference_Manual.assets/RX2-67.9-1.png)

The isolation between RX1 and RX2 is about 51.36db

### Transmitter-to-Receiver Isolation Test at 1.8 GHz

Both attenuation and gain are set to 0 dB.tx output power is 0dbm

RX1：
![e310](./ANTSDR_E310_Reference_Manual.assets/TX1_0dbm_rx1-79.54dbm.png)

RX2：
![e310](./ANTSDR_E310_Reference_Manual.assets/tx1_0dbm_rx2_-74.76dbm.png)

### Transmitter-to-Transmitter Isolation Test at 1.8 GHz

TX attenuation is set to 0 dB

![e310](./ANTSDR_E310_Reference_Manual.assets/TX1-1.png)

![e310](./ANTSDR_E310_Reference_Manual.assets/TX2-1.png)

### AD9361 Data Sheet

You can find the ad9361 Data Sheet here:

[Data Sheet](https://www.analog.com/en/products/ad9361.html)

### ANTSDR Selection

| Signal Name                      | E200                        | E310                     | E316                            |
| -------------                    | ----------                  | --------------           | ----------                      | 
| RFIC                             | AD9361/3                    |   AD9361/3               |AD9361/3                         | 
| RF channel                       | SMA:1T1R IPEX:1T1R          |2T2R MIMO                 |2T2R MIMO                        |
| Instantaneous bandwidth          |56M (9361), 20M (9363)       |56M (9361), 20M (9363)    |56M (9361), 20M (9363)           |
| FPGA/SoC                         | ZYNQ XC7Z020                | ZYNQ XC7Z020             |ZYNQ XC7Z020                     |
| DDR3                             |PS 512MB                     | PS 1GB                   | PS 1GB                          |  
| Host Interface                   | 1G ETH                      | 1G ETH                   |1G ETH                           |        
| Transmission bandwidth to host   | 20MSPS                      | 10MSPS                   | 20MSPS                          |        
|Clock synchronization             | 10M/PPS                     | 10M/PPS                  | 10M/PPS                         |   
| API                              | Libiio & UHD /C/C++ /PYTHON | Libiio &  C/C++ /PYTHON  |   Libiio & UHD & C/C++ /PYTHON  |     

