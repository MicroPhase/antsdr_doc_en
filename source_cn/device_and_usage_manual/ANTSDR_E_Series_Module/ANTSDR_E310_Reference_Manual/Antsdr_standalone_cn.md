## ANTSDR Standalone (裸机) 

[[English]](../../../../device_and_usage_manual/ANTSDR_E_Series_Module/ANTSDR_E310_Reference_Manual/Antsdr_standalone.html)

### ANTSDR_no-OS
[项目地址](https://github.com/MicroPhase/antsdr_standalone)

基于 ADI hdl 和 no_OS 的 ANTSDR 裸机程序。

### 在Windows和Linux下恢复vivado项目

#### 所需软件

- git（用于从 GitHub 下载源代码）
- vivado2021.1（用于恢复项目）
- vitis 2021.1（用于构建裸机系统测试程序）

#### 下载源代码

首先需要从GitHub下载相应的源码，打开**git bash**，然后在mingwin中使用以下命令下载源码。

```
git clone --recursive https://github.com/MicroPhase/antsdr_standalone.git
```

![image-20210924190649784](ANTSDR_E310_Reference_Manual.assets/image-20210924190649784.png)

注意：在下载源码的时候，使用--recursive会递归的下载子模块当中的文件，只有这样才能保证所需要的版本是一致的。

![image-20221107172649783](ANTSDR_E310_Reference_Manual.assets/image-20221107172649783.png)

下载完源码之后，你将会看到有一个**hdl**文件夹。接下来就介绍如何在windows下使用vivado2021.1来复原工程。

#### 使用vivado tcl命令行复原工程

关于使用vivado恢复工程，请参考adi官方说明：[ADI HDL Building](https://wiki.analog.com/resources/fpga/docs/build)

打开vivado2021.1，在tcl命令窗口中进入到antsdr工程所在的目录：具体的路径你自己的情况而定。主要是定位到hdl/project/antsdre310或者hdl/project/antsdre200或者hdl/project/antsdre316(e310v2)目录下。

![image-20221107172535645](ANTSDR_E310_Reference_Manual.assets/image-20221107172535645.png)

然后依次执行如下命令：

```
source ../scripts/adi_make.tcl
adi_make::lib all
source ./system_project.tcl
```

执行上述命令后，vivado将会依次检查所需要的IP，创建所需要的IP，生成Vivado工程并完成bit文件的生成。

![image-20210924191721108](ANTSDR_E310_Reference_Manual.assets/image-20210924191721108.png)

Vivado在构建IP和工程的时候，需要等待较长的时间，请耐心等待。

![image-20210924193419017](ANTSDR_E310_Reference_Manual.assets/image-20210924193419017.png)



![image-20210924193351690](ANTSDR_E310_Reference_Manual.assets/image-20210924193351690.png)


等到整个工程综合完成之后，可以在该工程的 **antsdre310.sdk**或**antsdre200.sdk**或**antsdre316.sdk**文件夹下找到硬件描述文件，使用这个硬件描述文件，可以用来搭建no-OS工程。


#### 构建 no-OS 工程
为了简单构建no-OS的过程，请直接使用已经提供好的no-OS源码，即从git下载的源文件下的app_e310或app_e200或app_e316文件夹中的代码。

打开vitis软件，定位到**antsdrxxx.sdk**目录下

![image-20230207130507006](ANTSDR_E310_Reference_Manual.assets/image-20230207130507006.png)

创建新的工程

![image-20230207130611520](ANTSDR_E310_Reference_Manual.assets/image-20230207130611520.png)

首先需要根据导出的.xsa文件,创建一个硬件平台。

![image-20230207130651797](ANTSDR_E310_Reference_Manual.assets/image-20230207130651797.png)

![image-20230207130938975](ANTSDR_E310_Reference_Manual.assets/image-20230207130938975.png)

![image-20230207131005309](ANTSDR_E310_Reference_Manual.assets/image-20230207131005309.png)

创建好硬件平台之后，就可以创建一个新的软件工程了

![image-20230207131059350](ANTSDR_E310_Reference_Manual.assets/image-20230207131059350.png)

在选择模板的时候，选择一个空的工程就可以了。

![image-20230207131141754](ANTSDR_E310_Reference_Manual.assets/image-20230207131141754.png)

然后将仓库当中的app_e200或者app_e310或者app_e316拷贝到当前的src文件夹下，然后点击编译，就可以生成可执行程序了。

![image-20230207131326326](ANTSDR_E310_Reference_Manual.assets/image-20230207131326326.png)

### 功能测试

接下来就可以连接串口jtag到到电脑上，然后在SDK中生成调试用的elf文件进行调试了。

![image-20210924232424492](ANTSDR_E310_Reference_Manual.assets/image-20210924232424492.png)



### 注意

工程基于ADRV9361,可以支持2R2T,可以通过串口修改本振，采样率，增益，基带信号的频率，幅度等。