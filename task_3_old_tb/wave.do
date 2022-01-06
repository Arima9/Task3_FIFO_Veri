onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /TB_FIFO/uut/wr_clk
add wave -noupdate /TB_FIFO/uut/rd_clk
add wave -noupdate /TB_FIFO/wr_rst
add wave -noupdate /TB_FIFO/rd_rst
add wave -noupdate -expand /TB_FIFO/t
add wave -noupdate /TB_FIFO/itf/push
add wave -noupdate /TB_FIFO/itf/full
add wave -noupdate /TB_FIFO/itf/data_in
add wave -noupdate /TB_FIFO/itf/pop
add wave -noupdate /TB_FIFO/itf/empty
add wave -noupdate /TB_FIFO/itf/data_out
add wave -noupdate /TB_FIFO/uut/rptr_r2w_1
add wave -noupdate /TB_FIFO/uut/rptr_r2w_2
add wave -noupdate /TB_FIFO/uut/wq2_rptr
add wave -noupdate /TB_FIFO/uut/ram_w_addr
add wave -noupdate /TB_FIFO/uut/wptr_w2r_1
add wave -noupdate /TB_FIFO/uut/wptr_w2r_2
add wave -noupdate /TB_FIFO/uut/rq2_wptr
add wave -noupdate /TB_FIFO/uut/ram_r_addr
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {49900 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 179
configure wave -valuecolwidth 100
configure wave -justifyvalue left
configure wave -signalnamewidth 0
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ps
update
WaveRestoreZoom {235540 ps} {309440 ps}
