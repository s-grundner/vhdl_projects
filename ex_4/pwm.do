vlib work
vmap work work

vcom -work work counter_e.vhd
vcom -work work counter_a.vhd
vcom -work work pwm_e.vhd
vcom -work work pwm_a.vhd
vcom -work work pwm_tb.vhd

vsim work.pwm_tb

add wave -r -label {CLK} 		-color {Cyan} 			/pwm_tb/tb_clk
add wave -r -label {RST} 		-color {Red} 			/pwm_tb/tb_rst
add wave -r -label {PWM Period} -color {Medium Orchid} 	/pwm_tb/tb_Period_counter_val
add wave -r -label {ON Period} 	-color {Lime Green} 	/pwm_tb/tb_ON_counter_val
add wave -r -label {PWM} 		-color {Yellow} 		/pwm_tb/tb_PWM_pin
add wave -r -label {Next PWM} 	-color {Salmon} 		/pwm_tb/pwm_dut/next_pwm
add wave -r -label {CNT RST} 	-color {Orange} 		/pwm_tb/pwm_dut/counter/counter_rst_strobe_i
add wave -r -label {CNT} 		-color {Green} 			/pwm_tb/pwm_dut/counter/counter_o
add wave -r -label {Next CNT} 	-color {Green} 			/pwm_tb/pwm_dut/counter/next_cnt

run 2000 ns

WaveRestoreZoom {0 ps} {2000000 ps}	