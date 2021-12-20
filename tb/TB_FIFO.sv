`timescale 1ns / 10ps
module TB_FIFO ();
`include "FIFO_driver.svh";

import afifo_pkg::*;
bit clk_wr = 1'b0;
bit clk_rd = 1'b0;
bit wr_rst = 1'b1;
bit rd_rst = 1'b1;

// Definition of tester
FIFO_driver  t;

// Instance of interface
fifo_if	itf(
	//.clk_wr	(wr_clk), 
	//.clk_rd	(rd_clk)
);

fifo_top	uut	(
	.wr_clk	(clk_wr),
	.wr_rst	(wr_rst),
	.rd_clk	(clk_rd),
	.rd_rst	(rd_rst),
	.itf	(itf.fifo)
);

//task drafts
task overflow (input int q_size);
	$display("Tasky Overflow llamada...");
	
	if (q_size <= 16)begin
		$display("If del overflow");
		for(integer i=q_size; i<=16; i++)begin
			$display("For de Overflow");
			t.Data_inj();
		end
	end

endtask

task underflow (input int q_size);
	data_ty pop;	
	//integer j;
	$display("Tasky underflow llamada...");

	if (q_size > 0)begin
		$display("If del underflow");
		for(integer j=q_size; j>=0; j--)begin
			$display("For del underflow");
			pop = t.Data_poped;
		end	
	end
endtask
	
task monitor ();
	$display("Monitor llamado...");
	if(t.Data_poped != itf.data_out)begin
		$display("Time: %t, Error: Expected %d (%b), Obtained %d (%b)", $time,
		t.Data_poped, t.Data_poped, itf.data_out, itf.data_out); 
		$stop(2);
	end
endtask

///tb	
initial begin
	fork
		forever #3 clk_wr = ~clk_wr;
		forever #5 clk_rd = ~clk_rd;
		forever @(itf.data_out) monitor();
	join
end
	
initial begin	
	//Object created from class FIFO_driver
    t = new(itf);

	//Initialization sequence
	#3	wr_rst = 1'b1;	rd_rst = 1'b1;
    #3	wr_rst = 1'b0;	rd_rst = 1'b0;
	#3	wr_rst = 1'b1;	rd_rst = 1'b1;

	//TEST AREA

	//t.clear_FIFO();
	repeat (40)	@(posedge clk_wr) t.Data_inj();
	repeat (40)	@(posedge clk_rd) t.Data_pop();
	//t.Data_pop();
	//overflow(t.queue_size);
	//underflow(t.queue_size);
	//monitor();
	$display("TB initial finished...");
	$stop(2);
end

endmodule
