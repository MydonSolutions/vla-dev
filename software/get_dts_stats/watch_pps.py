import sys
import time
import numpy as np

import casperfpga
from casperfpga import i2c, i2c_sfp

LINKS = ['dts_firefly0_ss0', 'dts_firefly0_ss1']

if __name__ == "__main__":
    fpga = casperfpga.CasperFpga('local', transport=casperfpga.LocalPcieTransport)
    
    fpga.get_system_information(sys.argv[1])

    while(True):
        for linkn, link in enumerate(LINKS):
            print(time.time(), fpga.read_int(link+'_pps_count') // 8)
        time.sleep(0.05)

