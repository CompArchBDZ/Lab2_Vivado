connect -url tcp:127.0.0.1:3121
source /home/vagrant/Lab2/mp2_fpga_wrapper/spi_fpga/spi_fpga.sdk/design_1_wrapper_hw_platform_0/ps7_init.tcl
targets -set -filter {name =~"APU" && jtag_cable_name =~ "Digilent Zybo 210279652019A"} -index 0
loadhw /home/vagrant/Lab2/mp2_fpga_wrapper/spi_fpga/spi_fpga.sdk/design_1_wrapper_hw_platform_0/system.hdf
targets -set -filter {name =~"APU" && jtag_cable_name =~ "Digilent Zybo 210279652019A"} -index 0
stop
ps7_init
ps7_post_config
targets -set -nocase -filter {name =~ "ARM*#0" && jtag_cable_name =~ "Digilent Zybo 210279652019A"} -index 0
rst -processor
targets -set -nocase -filter {name =~ "ARM*#0" && jtag_cable_name =~ "Digilent Zybo 210279652019A"} -index 0
dow /home/vagrant/Lab2/mp2_fpga_wrapper/spi_fpga/spi_fpga.sdk/corespi/Debug/corespi.elf
bpadd -addr &main
