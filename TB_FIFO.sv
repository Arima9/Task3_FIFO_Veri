`timescale 1ns / 1ps
include "FIFO_driver.sv";
module TB_FIFO ();

import fifo_pkg::*;
//integer text_id;
bit wr_clk;
bit rd_clk;
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

					
///to review					
task monitor (input queue_fifo[$]);

t.Data_inj 17 queue_fifo
$size queue_fifo = monitor 


task overflow (input queue_FIFO[$]);
if(queue_fifo.size > 16) begin
$display "error"

task underflow (input queue_fifo[$]);
if(queue_fifo. = 0) begin
$display queue_fifo.pop_back



begin
	result_gold = i+j + k; 
	if (result != result_gold) begin
		$display($time,"Error: Expected %d (%8b), Obtained %d (%8b)", result_gold, result_gold, result, result); $stop(1); 
	end
end
endtask



///tb		
initial begin
                t   = new(itf);
                t.clear_FIFO();
                wr_clk = 'd0;
					 rd_clk = 'd0;
                wr_rst = 'd1;
					 rd_rst = 'd1;
  #8
                wr_rst = 'd0;
					 rd_rst = 'd0;
					 
  #8			  	
					wr_rst = 'd1;
					 rd_rst = 'd1;
                fork
                    t.Data_inj();
						  t.Data_pop();
                    monitor();
                join
                $stop();
end

always begin
    #2 clk = !clk;
end

endmodule






