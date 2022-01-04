module top;
import uvm_pkg::*;
import fifo_pkg::*;

   fifo_if fi();
   fifo_top dut /*(fi.mem_mp);*/
   
   initial begin
     string test_name;
       
      global_fif = fi;

     run_test(); 
   end
 
 endmodule: top
