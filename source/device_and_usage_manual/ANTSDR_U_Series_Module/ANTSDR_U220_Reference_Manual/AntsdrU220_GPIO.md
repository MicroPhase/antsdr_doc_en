## U220 GPIO
[[中文]](../../../cn/device_and_usage_manual/ANTSDR_U_Series_Module/ANTSDR_U220_Reference_Manual/AntsdrU220_GPIO_cn.html)


U220 has 8 GPIOs that users can operate. The following code implements the GPIO flip function.
```
#include <iostream>
#include <uhd/usrp/multi_usrp.hpp>
#include <uhd/utils/safe_main.hpp>
#include <uhd/utils/static.hpp>
#include <uhd/utils/thread.hpp>
#include "wavetable.h"
#include <csignal>

static bool stop_signal_called = false;

void sig_int_handler(int) {
    stop_signal_called = true;
}

int main() {
    std::signal(SIGINT | SIGHUP | SIGTERM, &sig_int_handler);  
    uhd::device_addr_t hint;
    uhd::device_addrs_t dev_addrs = uhd::device::find(hint);
    std::string gpio;

    if (dev_addrs.size() <= 0) {
        printf("no device\n");
        return 0;
    }
    printf("got a device\n");

    for (unsigned i = 0; i != dev_addrs.size(); i++) {
        std::cout << "id:" << dev_addrs[i].to_string()
                  << "\nname:" << dev_addrs[i].get("name", "N/A")
                  << "\nserial:" << dev_addrs[i].get("serial", "N/A")
                  << "\nproduct:" << dev_addrs[i].get("product", "N/A") << std::endl;
    }

   std::string args("type=b200");
    std::cout << "Hello, World!" << std::endl;

    std::cout << std::endl;
    std::cout << boost::format("Creating the usrp device with: %s...") % args
              << std::endl;
    uhd::usrp::multi_usrp::sptr usrp = uhd::usrp::multi_usrp::make(args);
    std::this_thread::sleep_for(std::chrono::seconds(1));

    std::cout << "Using GPIO bank: FP0 "<< std::endl;

    usrp->set_gpio_attr("FP0", "DDR", 0xff, 0xff);  
    // set control register 
    usrp->set_gpio_attr("FP0", "CTRL", 0, 0xff);    

    while (1) {
        usrp->set_gpio_attr("FP0", "OUT", 0xFF, 0xFF);  
        std::this_thread::sleep_for(std::chrono::seconds(1));
        uint32_t rb = usrp->get_gpio_attr("FP0", "READBACK");
        std::cout << "READBACK: " << std::hex << rb << std::endl;

        usrp->set_gpio_attr("FP0", "OUT", 0x00, 0xFF); 
        std::this_thread::sleep_for(std::chrono::seconds(1));
        rb = usrp->get_gpio_attr("FP0", "READBACK");
        std::cout << "READBACK: " << std::hex << rb << std::endl;
    }

    std::cout << std::endl << "Done!" << std::endl << std::endl;
    return EXIT_SUCCESS;
}

```