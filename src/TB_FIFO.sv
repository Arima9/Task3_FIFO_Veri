`timescale 1ns / 1ps

module TB_FIFO ();
include "FIFO_driver.svh";

import fifo_pkg::*;
//integer text_id;
bit wr_clk = 0;
bit rd_clk = 0;
bit wr_rst;
bit rd_rst;

// Definition of tester
FIFO_driver  t;

// Instance of interface
FIFO_signals   itf	(
								.clk_wr	(wr_clk), 
								.clk_rd	(rd_clk)
							);

fifo_top	uut	(
						.wr_clk	(wr_clk),
						.wr_rst	(Wr_rst),
						.rd_clk	(rd_clk),
						.rd_rst	(rd_rst),
						.itf		(itf.cons)
					);

//FIFO_golden golden	(.itf	(itf.cons));

///to review					
//task monitor (input queue_fifo[$]);
//
//t.Data_inj 17 queue_fifo
//queue_fifo.size = monitor 
//
//
//task overflow (input queue_FIFO[$]);
//t.Data_inj()
//if(queue_fifo.size > 16) begin
//$display "error"
//
//task underflow (input queue_fifo[$]);
//if(queue_fifo. = 0) begin
//$display queue_fifo.pop_back
//
//
//salida de funcion tamaño t.q_size
//
//
//begin
//	result_gold = i+j + k; 
//	if (result != result_gold) begin
//		$display($time,"Error: Expected %d, Obtained %d", result_gold, result); $stop(1); 
//	end
//end
//endtask


//task drafts
task overflow (input int q_size);
	if (q_size <= 16)
		for(integer i=q_size; i<=17; i++)
			t.Data_inj();
endtask
			
			
task underflow (input int q_size);
	//integer j;
	data_ty pop;
	if (q_size > 0)
		for(integer j=q_size; j>=0; j--)
			pop = t.Data_pop();
endtask
			
			
task monitor ();
	if(t.Data_pop != itf.Data_out)
		$display($time,"Error: Expected %d, Obtained %d", t.Data_pop, itf.Data_out); 
		$stop(1);
endtask



///tb	
initial begin
	fork
		forever #2 wr_clk = ~wr_clk;
		forever #5 rd_clk = ~rd_clk;
	join
end
	
initial begin	
                t   = new(itf);
                t.clear_FIFO();					 
  #8			  	
                fork
                    //t.Data_inj();
						  //t.Data_pop();
						  overflow(t.queue_size);
						  underflow(t.queue_size);
                    monitor();
                join
                $stop();
end
endmodule
