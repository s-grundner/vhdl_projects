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

add wave -expand -group {TL-DUT} -radix unsigned -color {Cornflower Blue} top_level_tb/top_level_dut/*

add wave -expand -group {X-Axis} -radix unsigned -color Orange top_level_tb/top_level_dut/tilt_x/*
add wave -expand -group {X-Axis} -radix unsigned -color Orange top_level_tb/top_level_dut/tilt_x/mov_avg_ent/*

add wave -radix unsigned -radix unsigned -color Green top_level_tb/top_level_dut/tilt_x/sample_hold_ent/*
add wave -radix unsigned -radix unsigned -color Green top_level_tb/top_level_dut/tilt_x/tilt_ent/*

run 50 ms

WaveRestoreZoom {0 ps} {5000000 ps}	