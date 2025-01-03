vlib work
vmap work work

vcom -work work ../packages/std_definitions.vhd
vcom -work work ../packages/servo_pkg.vhd

vcom -work work ../bcd_to_7seg_ea.vhd
vcom -work work ../bin2bcd_ea.vhd

vcom -work work ../counter_ea.vhd
vcom -work work ../pwm_ea.vhd
vcom -work work ../strb_generator_ea.vhd
vcom -work work ../delta_adc_ea.vhd
vcom -work work ../sample_hold_ea.vhd
vcom -work work ../servo_ea.vhd
vcom -work work ../sync_ea.vhd
vcom -work work ../moving_average_ea.vhd
vcom -work work ../tilt_ea.vhd
vcom -work work ../tilt_axis_ea.vhd
vcom -work work ../top_level_ea.vhd

vcom -work work ../test/top_level_tb.vhd
vsim work.top_level_tb

# --- INSTERT WAVES ---

# Top Level
add wave -noupdate -expand -group TL-DUT -color {Cornflower Blue} -label CLK /top_level_tb/top_level_dut/clk_i
add wave -noupdate -expand -group TL-DUT -color {Cornflower Blue} -label RST /top_level_tb/top_level_dut/rst_i
add wave -noupdate -expand -group TL-DUT -color {Lime} -label {X Comp In} /top_level_tb/top_level_dut/x_comp
add wave -noupdate -expand -group TL-DUT -color {Lime} -label {Y Comp In} /top_level_tb/top_level_dut/y_comp
add wave -noupdate -expand -group TL-DUT -color {Cornflower Blue} -label {X Servo PWM} /top_level_tb/top_level_dut/x_servo_pwm_o
add wave -noupdate -expand -group TL-DUT -color {Cornflower Blue} -label {Y Servo PWM} /top_level_tb/top_level_dut/y_servo_pwm_o
add wave -noupdate -expand -group TL-DUT -color {Cornflower Blue} -label {X ADC PWM} /top_level_tb/top_level_dut/x_adc_pwm_o
add wave -noupdate -expand -group TL-DUT -color {Cornflower Blue} -label {Y ADC PWM} /top_level_tb/top_level_dut/y_adc_pwm_o

add wave -noupdate -expand -group TL-DUT -group DISPLAY -color {Violet Red} -itemcolor {Violet Red} -radix hexadecimal /top_level_tb/top_level_dut/x_seg_ones_o
add wave -noupdate -expand -group TL-DUT -group DISPLAY -color {Violet Red} -itemcolor {Violet Red} -radix hexadecimal /top_level_tb/top_level_dut/x_seg_tens_o
add wave -noupdate -expand -group TL-DUT -group DISPLAY -color {Violet Red} -itemcolor {Violet Red} -radix hexadecimal /top_level_tb/top_level_dut/x_seg_hundreds_o
add wave -noupdate -expand -group TL-DUT -group DISPLAY -color {Violet Red} -itemcolor {Violet Red} -radix hexadecimal /top_level_tb/top_level_dut/y_seg_ones_o
add wave -noupdate -expand -group TL-DUT -group DISPLAY -color {Violet Red} -itemcolor {Violet Red} -radix hexadecimal /top_level_tb/top_level_dut/y_seg_tens_o
add wave -noupdate -expand -group TL-DUT -group DISPLAY -color {Violet Red} -itemcolor {Violet Red} -radix hexadecimal /top_level_tb/top_level_dut/y_seg_hundreds_o

# X-Axis
add wave -noupdate -expand -group X-Axis -color Cyan -label {ADC Sampling Strobe} /top_level_tb/top_level_dut/tilt_x/adc_ent/sampling_strobe
add wave -noupdate -expand -group X-Axis -color Cyan -label {ADC Valid Strobe (Filter)} /top_level_tb/top_level_dut/tilt_x/adc_valid_strb_filter
add wave -noupdate -expand -group X-Axis -color Cyan -label {ADC Value (Filter)} -radix unsigned /top_level_tb/top_level_dut/tilt_x/adc_value_filter
add wave -noupdate -expand -group X-Axis -color Cyan -label {ADC Value} -radix unsigned /top_level_tb/top_level_dut/tilt_x/adc_value
add wave -noupdate -expand -group X-Axis -color {Cornflower Blue} -label Holdvalue -radix unsigned /top_level_tb/top_level_dut/tilt_x/hold_value
add wave -noupdate -expand -group X-Axis -color {Cornflower Blue} -label {Current Servo Period} -radix unsigned /top_level_tb/top_level_dut/tilt_x/servo_ent/ON_counter_val

add wave -noupdate -expand -group X-Axis -expand -group Filter -color {Medium Spring Green} -label {Filter Register} -radix unsigned /top_level_tb/top_level_dut/tilt_x/mov_avg_ent/filter_reg
add wave -noupdate -expand -group X-Axis -expand -group Filter -color {Medium Spring Green} -label {Filter In} -radix unsigned /top_level_tb/top_level_dut/tilt_x/mov_avg_ent/data_i
add wave -noupdate -expand -group X-Axis -expand -group Filter -color {Medium Spring Green} -label {Filter Out} -radix unsigned /top_level_tb/top_level_dut/tilt_x/mov_avg_ent/data_o

# Y-Axis
add wave -noupdate -expand -group Y-Axis -color Salmon -label {ADC Sampling Strobe} /top_level_tb/top_level_dut/tilt_y/adc_ent/sampling_strobe
add wave -noupdate -expand -group Y-Axis -color Salmon -label {ADC Valid Strobe (Filter)} /top_level_tb/top_level_dut/tilt_y/adc_valid_strb_filter
add wave -noupdate -expand -group Y-Axis -color Salmon -label {ADC Value (Filter)} -radix unsigned /top_level_tb/top_level_dut/tilt_y/adc_value_filter
add wave -noupdate -expand -group Y-Axis -color Salmon -label {ADC Value} -radix unsigned /top_level_tb/top_level_dut/tilt_y/adc_value
add wave -noupdate -expand -group Y-Axis -color {Orange Red} -label Holdvalue -radix unsigned /top_level_tb/top_level_dut/tilt_y/hold_value
add wave -noupdate -expand -group Y-Axis -color {Orange Red} -label {Current Servo Period} -radix unsigned /top_level_tb/top_level_dut/tilt_y/servo_ent/ON_counter_val

add wave -noupdate -expand -group Y-Axis -expand -group Filter -color Gold -label {Filter Register} -radix unsigned /top_level_tb/top_level_dut/tilt_y/mov_avg_ent/filter_reg
add wave -noupdate -expand -group Y-Axis -expand -group Filter -color Gold -label {Filter In} -radix unsigned /top_level_tb/top_level_dut/tilt_y/mov_avg_ent/data_i
add wave -noupdate -expand -group Y-Axis -expand -group Filter -color Gold -label {Filter Out} -radix unsigned /top_level_tb/top_level_dut/tilt_y/mov_avg_ent/data_o

# ---

run 50 ms

WaveRestoreZoom {0 ps} {50 ms}

configure wave -timelineunits us
configure wave -namecolwidth 339
configure wave -valuecolwidth 165