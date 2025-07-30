## E316 Hardware Manual
[[中文]](../../../cn/device_and_usage_manual/ANTSDR_E_Series_Module/ANTSDR_E316_Reference_Manual/AntsdrE316_Reference_Manual_cn.html)

### Overview

E316 is a software-defined radio (SDR) designed for professional applications, supporting wideband RF signal transmission and reception across 70 MHz to 6 GHz. It can operate as a USB peripheral or run standalone via programmable control. Through two generations of iteration, the E316 features enhanced transmit power, improved receive sensitivity, lower noise floor and phase noise, and a more complete set of wireless application interfaces.

ANTSDR has accumulated a wealth of successful use cases in the field of radio applications, including spectrum monitoring, UAVs, GPS, and radio signal analysis.

![](./AntsdrE316_Reference_Manual.assets/E316.jpg)

### Hardware Resources

- Xilinx Zynq-7020 (integrated dual-core ARM Cortex-A9 and Artix-7 FPGA)
- Analog Devices AD9361/9363 
- 1 PL side Gigabit Ethernet interface
- TYPE-C USB 2.0 connector 
- TYPE-C USB-JTAG&UART connection
- 40-Pin 0.5mm FPC GPIO expansion port
- 1 external PPS/10MHz reference entrance
- 1 GPS sync input interface
- 2 transmit channels and 2 receive channels, supporting half-duplex or full-duplex operation.
- Flexible sampling rate 12-bit ADC and DAC
- Integrated RF front-end (AD9361: 70 MHz – 6 GHz, AD9363: 325 MHz – 3.8 GHz)
- Tunable analog bandwidth (AD9361: 200 kHz – 56 MHz, AD9363: 200 kHz – 20 MHz)
