if [file exists work] {vdel -all}
vlib work
#vlog -f compile.f
vlog -writetoplevels questa.tops -timescale 1ns/1ns "+incdir+/playground_lib/uvm-1.2/src" -L /usr/share/questa/questasim//uvm-1.2 -f compile.f 
vsim  top +UVM_TESTNAME=random_test
set  NoQuitOnFinish 1
onbreak {resume}
run -all
vsim  top +UVM_TESTNAME=controlled_test
run -all
quit
