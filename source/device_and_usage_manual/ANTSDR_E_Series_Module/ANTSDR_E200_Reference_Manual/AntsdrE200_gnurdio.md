## E200 GNU Radio

[[中文]](../../../cn/device_and_usage_manual/ANTSDR_E_Series_Module/ANTSDR_E200_Reference_Manual/AntsdrE200_gnurdio_cn.html)

For information on using ANTSDR E200 with GNU Radio, please refer to E310: [ANTSDR GNU Radio](../ANTSDR_E310_Reference_Manual/AntsdrE310_gnurdio.md).

The same method is applicable to this device.


### UHD 
If you are using UHD firmware, you need to install GNU Radio correctly.

Installing Gnu Radio from source
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
Next, add the environment variables:
```
gedit ~/.bashrc
```
Add in the last line
```
export PYTHONPATH=/usr/local/lib/python3/dist-packages:/usr/local/lib/python3.8/dist-packages:$PYTHONPATH
export LD_LIBRARY_PATH=/usr/local/lib:$LD_LIBRARY_PATH
```
After the installation is complete, you can open
```
gnuradio-companion
```



