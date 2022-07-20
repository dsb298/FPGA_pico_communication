import os

# os.system('ghdl -s spi_slave.vhd')
os.system('ghdl -a spi_slave.vhd')
os.system('ghdl -s spi_slave_tb.vhd')
os.system('ghdl -a spi_slave_tb.vhd')
os.system('ghdl -e spi_slave_tb')
os.system('ghdl -r spi_slave_tb --vcd=wave.vcd')
os.system('gtkwave wave.vcd')