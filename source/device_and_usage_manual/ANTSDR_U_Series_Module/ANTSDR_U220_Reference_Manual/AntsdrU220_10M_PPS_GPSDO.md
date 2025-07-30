## U220 10M PPS GPS
[[中文]](../../../cn/device_and_usage_manual/ANTSDR_U_Series_Module/ANTSDR_U220_Reference_Manual/AntsdrU220_10M_PPS_GPSDO_cn.html)

If you are using the U220 to lock to an external 10M or PPS reference, you will need to set
```
usrp->set_clock_source("external");
```
or
```
usrp->set_time_source("external");
```
If you lock to external 10M, you can refer to the code below, and then you need to wait patiently until it is locked

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
```
If you lock to external PPS, you can refer to the code below, then you need to wait patiently for the 10M/PPS indicator to be constant and see the PPS time jump

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

If you use GPS, you can use the following code directly:

[https://github.com/MicroPhase/antsdr_uhd/blob/master/host/examples/sync_to_gps.cpp](https://github.com/MicroPhase/antsdr_uhd/blob/master/host/examples/sync_to_gps.cpp)