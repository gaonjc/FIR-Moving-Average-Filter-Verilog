# FIR-Moving-Average-Filter-Verilog
## Testbench in Vivado of a Finite Impulse Response Moving Average Filter Made with D Flip-Flops
## MATLAB is used to generate one period of a sin wave, create random noisyness, then scale it and export to a memory file so it can be loaded onto RAM in the Vivado testbench.
# The MATLAB code can be found [*here*](https://github.com/gaonjc/FIR-Moving-Average-Filter-Verilog/blob/main/MATLAB/createsindata.m)
## Noise generated randomly, the first noisy signal only adds noise as a random number between 0 and 0.1 to the base sin wave of amplitude 1 and the noisy signal is limited to its original amplitude
# ![Base Sin Wave](https://github.com/gaonjc/FIR-Moving-Average-Filter-Verilog/blob/main/img/sindefault.png)
# ![Noisy Sin Wave](https://github.com/gaonjc/FIR-Moving-Average-Filter-Verilog/blob/main/img/sinnoisy.png)
# ![Nosiy Scaled Sin Wave](https://github.com/gaonjc/FIR-Moving-Average-Filter-Verilog/blob/main/img/sinnoisyscaled.png)
# The mem file generated by MATLAB can be found [*here*](https://github.com/gaonjc/FIR-Moving-Average-Filter-Verilog/blob/main/Verilog/noisy.mem)
