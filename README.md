# FIR-Moving-Average-Filter-Verilog
# Testbench in Vivado of a Finite Impulse Response Moving Average Filter Made with D Flip-Flops
# Moving Average Filter Design ![Moving Average Filter Design](https://github.com/gaonjc/FIR-Moving-Average-Filter-Verilog/blob/main/img/movavgfilt.png)
## A moving average filter works by averaging the current impulse with a certain amount of delays in order to reduce noise.
## MATLAB is used to generate one period of a sin wave with 32 16 bit samples with random noisyness, then the samples are scaled and exported to a memory file so it can be loaded onto some memory in the Vivado testbench.
# The MATLAB code can be found [*here*](https://github.com/gaonjc/FIR-Moving-Average-Filter-Verilog/blob/main/MATLAB/createsindata.m)
## Noise generated randomly, the first noisy signal only adds noise as a random number between 0 and 0.1 to the base sin wave of amplitude 1 and the noisy signal is limited to its original amplitude
# Base Sin Wave ![Base Sin Wave](https://github.com/gaonjc/FIR-Moving-Average-Filter-Verilog/blob/main/img/sindefault.png)
# Noisy Sin Wave ![Noisy Sin Wave](https://github.com/gaonjc/FIR-Moving-Average-Filter-Verilog/blob/main/img/sinnoisy.png)
# Noisy Scaled Sin Wave ![Noisy Scaled Sin Wave](https://github.com/gaonjc/FIR-Moving-Average-Filter-Verilog/blob/main/img/sinnoisyscaled.png)
# The mem file generated by MATLAB can be found [*here*](https://github.com/gaonjc/FIR-Moving-Average-Filter-Verilog/blob/main/Verilog/noisy.mem)
## Now for Vivado simulation the moving average filter is implemented with D Flip-Flops to delay each signal by 1 clock cycle which are then averaged
# Schematic of Filter Implemented with D-FF's ![Schematic of Filter Implemented with D-FF's](https://github.com/gaonjc/FIR-Moving-Average-Filter-Verilog/blob/main/img/schematic_firfilter.png)
## A disadvantage of the moving average filter is that the output signal will be delayed which can be seen in the testbench
# The top Verilog module can be found [*here*](https://github.com/gaonjc/FIR-Moving-Average-Filter-Verilog/blob/main/Verilog/fir_moving_avg_filter.v)
## The noisy signal is made up of 32 16 bit samples when are then imported into vivado as a memory file and stored into RAM in the testbench once every clock cycle
# The test bench file can be found [*here*](https://github.com/gaonjc/FIR-Moving-Average-Filter-Verilog/blob/main/Verilog/fir_moving_avg_filter_tb.v)
# Analog Signal in Signed Decimal Testbench 3rd Order MAF ![Testbench 3rd Order MAF](https://github.com/gaonjc/FIR-Moving-Average-Filter-Verilog/blob/main/img/3rdordertestbench.png)
## The delay on the output filtered signal is noticible even though there are only 3 delays however the signal is slightly more smooth
# Same Filter Testbenched with twice the Noise (3rd Order) ![Testbench 3rd Order MAF](https://github.com/gaonjc/FIR-Moving-Average-Filter-Verilog/blob/main/img/3rdorder_x2noisetestbench.png)
# Same Filter Testbenched with 8 times the Noise (3rd Order) ![Testbench 3rd Order MAF](https://github.com/gaonjc/FIR-Moving-Average-Filter-Verilog/blob/main/img/8xnoisetestbench3rdorder.png)
## With 8 times the noise the 3 D Flip-Flops have a hard time smoothing it out so here is the implementation for a 7th order moving average filter. Verilog [*here*](https://github.com/gaonjc/FIR-Moving-Average-Filter-Verilog/blob/main/Verilog/fir_moving_avg_filter_7thorder.v)
# A 7th Order Filter Testbenched with 8 times the Noise (7th Order) ![Testbench 3rd Order MAF](https://github.com/gaonjc/FIR-Moving-Average-Filter-Verilog/blob/main/img/8xnoisetest7thorder.png)
## The signal is smoother with more delays but the output signal is also delayed by 4 more clock cycles than the 3rd order filter, but with only 7 Flip Flops if implemented physically 8 clock cycles is miniscule.
## An example of an application of this filter is audio processing, the filter can be used to eliminate white noises and high frequencies.
