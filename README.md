# FIR-Moving-Average-Filter-Verilog
# Testbench in Vivado of a Finite Impulse Response Moving Average Filter Made with D Flip-Flops
# ![Moving Average Filter Design](https://github.com/gaonjc/FIR-Moving-Average-Filter-Verilog/blob/main/img/movavgfilt.png)
## MATLAB is used to generate one period of a sin wave, create random noisyness, then scale it and export to a memory file so it can be loaded onto RAM in the Vivado testbench.
# The MATLAB code can be found [*here*](https://github.com/gaonjc/FIR-Moving-Average-Filter-Verilog/blob/main/MATLAB/createsindata.m)
## Noise generated randomly, the first noisy signal only adds noise as a random number between 0 and 0.1 to the base sin wave of amplitude 1 and the noisy signal is limited to its original amplitude
# ![Base Sin Wave](https://github.com/gaonjc/FIR-Moving-Average-Filter-Verilog/blob/main/img/sindefault.png)
# ![Noisy Sin Wave](https://github.com/gaonjc/FIR-Moving-Average-Filter-Verilog/blob/main/img/sinnoisy.png)
# ![Noisy Scaled Sin Wave](https://github.com/gaonjc/FIR-Moving-Average-Filter-Verilog/blob/main/img/sinnoisyscaled.png)
# The mem file generated by MATLAB can be found [*here*](https://github.com/gaonjc/FIR-Moving-Average-Filter-Verilog/blob/main/Verilog/noisy.mem)
## Now for Vivado simulation the moving average filter is implemented with D Flip-Flops to delay each signal by 1 clock cycle which are then averaged
# ![Schematic of Filter Implemented with D-FF's](https://github.com/gaonjc/FIR-Moving-Average-Filter-Verilog/blob/main/img/schematic_firfilter.png)
## A disadvantage of the moving average filter is that the output signal will be delayed which can be seen in the testbench
# The top Verilog module can be found [*here*](https://github.com/gaonjc/FIR-Moving-Average-Filter-Verilog/blob/main/Verilog/fir_moving_avg_filter.v)
## The noisy signal is made up of 32 16 bit samples when are then imported into vivado as a memory file and stored into RAM in the testbench once every clock cycle
# The test bench file can be found [*here*](https://github.com/gaonjc/FIR-Moving-Average-Filter-Verilog/blob/main/Verilog/fir_moving_avg_filter_tb.v)
# Analog Signal in Signed Decimal ![Testbench 3rd Order MAF](https://github.com/gaonjc/FIR-Moving-Average-Filter-Verilog/blob/main/img/3rdordertestbench.png)
## The delay on the output filtered signal is noticible even though there are only 3 delays however the signal is slightly more smooth
