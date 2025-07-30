## E316 硬件手册

[[English]](../../../../device_and_usage_manual/ANTSDR_E_Series_Module/ANTSDR_E316_Reference_Manual/AntsdrE316_Reference_Manual.html)

### 概述

E316 是一款面向专业应用场景的软件无线电,支持70 MHz - 6 GHz 的宽频段射频信号收发，既可以作为 USB 外设使用，也可以通过编程实现脱机运行。经过两代产品的迭代，E316具有更强的发射功率，更优的接收灵敏度，更低的底噪和相噪，更完善的无线应用接口。ANTSDR在无线电应用领域已经积累了丰富的成功应用案例，涵盖频谱监测,无人机，GPS，无线电分析等多个方向。

![E316](./AntsdrE316_Reference_Manual_cn.assets/E316.jpg)

### 资源特性

- Xilinx Zynq 7020（集成双核 ARM Cortex A9 和 Artix-7 FPGA）
- Analog Devices AD9361/9363 
- 1 个PL侧的千兆以太网接口
- 1个TYPE-C USB2.0接口
- 1个TYPE-C USB-JTAG&UART接口
- 1个40-Pin 0.5mm间距FPC GPIO拓展口
- 1个外部 PPS/10MHz 参考输入接口
- 1个GPS同步输入接口
- 2 个发射通道和 2 个接收通道，支持半双工或全双工
- 灵活采样率的 12 位 ADC 和 DAC
- 集成射频前端（AD9361：70 MHz - 6 GHz，AD9363：325 MHz - 3.8 GHz）
- 可变模拟带宽（AD9361：200 kHz - 56 MHz，AD9363：200 kHz - 20 MHz）
