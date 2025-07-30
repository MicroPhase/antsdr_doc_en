## U220 10M PPS GPS
[[English]](../../../../device_and_usage_manual/ANTSDR_U_Series_Module/ANTSDR_U220_Reference_Manual/AntsdrU220_10M_PPS_GPSDO.html)

如果您使用U220 锁定到外部 10M 或者 PPS 参考，您需要设置
```
usrp->set_clock_source("external");
```
或者
```
usrp->set_time_source("external");
```

如果您锁定到外部10M，您可以参考下面的代码，然后您需要耐心等待直到锁上为止
```
std::vector<std::string> sensor_names = usrp->get_mboard_sensor_names(mboard);
if (std::find(sensor_names.begin(), sensor_names.end(), "ref_locked") != sensor_names.end() )
{
    std::cout << "Waiting for 10 MHz ref lock on mboard " << mboard << std::endl;
    for (int i = 0; i < 30; i++) {
        if (usrp->get_mboard_sensor("ref_locked", mboard).to_bool()) {
            std::cout << "10 MHz reference locked" << std::endl;
            break;
        }
        std::this_thread::sleep_for(std::chrono::seconds(1));
    }
}
如果您锁定到外部PPS，您可以参考下面的代码，然后您需要耐心等待10M/PPS指示灯常量，并看到PPS时间跳变
```
    const int max_wait_sec = 100;
    for (int i = 0; i < max_wait_sec; ++i) {
        std::this_thread::sleep_for(std::chrono::seconds(1));
        double new_pps_time = usrp->get_time_last_pps().get_real_secs();
        std::cout << "External PPS detected at time: " << new_pps_time << " seconds" << std::endl;
    }
External PPS detected at time: 14.3577 seconds
External PPS detected at time: 15.3577 seconds
External PPS detected at time: 16.8904 seconds
External PPS detected at time: 17.8904 seconds
```
```
如果您使用GPS，您可以直接使用下面的参考代码
```
https://github.com/MicroPhase/antsdr_uhd/blob/master/host/examples/sync_to_gps.cpp
```