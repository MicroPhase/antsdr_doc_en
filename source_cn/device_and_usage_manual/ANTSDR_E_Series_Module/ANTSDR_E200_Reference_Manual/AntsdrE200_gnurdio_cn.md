## E200 GNU Radio 

[[English]](../../../../device_and_usage_manual/ANTSDR_E_Series_Module/ANTSDR_E200_Reference_Manual/AntsdrE200_gnurdio.html)

有关ANTSDR E200 GNU Radio 使用方法，可以参考 E310：

[ANTSDR GNU Radio](../ANTSDR_E310_Reference_Manual/AntsdrE310_gnurdio_cn.md)，其方法与 E310 类似，同样适用与本项目。

### UHD 固件
如果您使用UHD固件，您需要正确的安装 GNU Radio
从源安装 Gnu Radio
```
git clone https://github.com/gnuradio/gnuradio.git
cd gnuradio
git checkout maint-3.8
git submodule update --init --recursive
mkdir build
cd build
cmake -DCMAKE_BUILD_TYPE=Release -DPYTHON_EXECUTABLE=/usr/bin/python3 ../
make
sudo make install
sudo ldconfi
```
接下来添加环境变量：
```
gedit ~/.bashrc
```
在最后一行加入
```
export PYTHONPATH=/usr/local/lib/python3/dist-packages:/usr/local/lib/python3.8/dist-packages:$PYTHONPATH
export LD_LIBRARY_PATH=/usr/local/lib:$LD_LIBRARY_PATH
```
安装完成后就可以打开了
```
gnuradio-companion
```