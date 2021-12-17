`timescale 1ns / 1ns

module TB_FIFO ();
include "FIFO_driver.svh";

import afifo_pkte::*;
bit clk_wr = 0;
bit clk_rd = 0;
bit wr_rst;
bit rd_rst;

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
						.itf		(itf.fifo)
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
			pop = t.Data_pop();
		end	
	end
endtask
			
			
task monitor ();
	$display("Monitor llamado...");
	if(t.Data_pop != itf.data_out)begin
		$display("Time: %t, Error: Expected %d, Obtained %d", $time, t.Data_pop, itf.data_out); 
		$stop(2);
	end
endtask



///tb	
initial begin
	fork
		forever #2 clk_wr = ~clk_wr;
		forever #5 clk_rd = ~clk_rd;
	join
end
	
initial begin	
                t   = new(itf);
                //t.clear_FIFO();					 
  #8			  	
                fork
					$display("Hilo de ejecucion Fork creado...");
                 t.Data_inj();
					//t.Data_pop();
					//overflow(t.queue_size);
					//underflow(t.queue_size);
                    monitor();
                join
				$display("TB initial finished...");

				#10000 $stop(2);
end

endmodule
