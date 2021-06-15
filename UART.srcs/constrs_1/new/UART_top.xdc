set_property -dict {PACKAGE_PIN W5 IOSTANDARD LVCMOS33} [get_ports system_clk]
create_clock -period 5.000 -name sys_clk_pin -waveform {0.000 10.000} -add [get_ports system_clk]

set_property -dict {PACKAGE_PIN T1 IOSTANDARD LVCMOS33} [get_ports system_rst]

set_property -dict {PACKAGE_PIN B18 IOSTANDARD LVCMOS33} [get_ports RX]
set_property -dict {PACKAGE_PIN A18 IOSTANDARD LVCMOS33} [get_ports TX]
