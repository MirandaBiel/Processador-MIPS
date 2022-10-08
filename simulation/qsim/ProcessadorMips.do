onerror {quit -f}
vlib work
vlog -work work ProcessadorMips.vo
vlog -work work ProcessadorMips.vt
vsim -novopt -c -t 1ps -L cycloneiv_ver -L altera_ver -L altera_mf_ver -L 220model_ver -L sgate work.ProcessadorMips_vlg_vec_tst
vcd file -direction ProcessadorMips.msim.vcd
vcd add -internal ProcessadorMips_vlg_vec_tst/*
vcd add -internal ProcessadorMips_vlg_vec_tst/i1/*
add wave /*
run -all
