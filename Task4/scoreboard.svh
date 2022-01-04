 `include "uvm_macros.svh"

class scoreboard extends uvm_agent;
   `uvm_component_utils(scoreboard)    

   virtual interface fifo_if fif;
   /*logic [15:0] testmem [2**16-1:0];    */

   // constructor
   function new(string name = "scoreboard", uvm_component parent = null );
      super.new(name, parent);
   endfunction : new

   // build
   function void build();
      super.build();
      // Insert Build Code Here
      fif = global_fif;
   endfunction : build

   task run();
      forever begin
         @(posedge fif.clk);
         /*if (fif.rd) begin
            #1;
            assert(fif.data === testmem[fif.addr]) else
              `uvm_error("run",
                               $psprintf("expected %0h  actual: %0h",
                                         testmem[mif.addr],mif.data));
         end
         if (mif.wr) 
           testmem[mif.addr] = mif.data;
    end*/
endtask // run
endclass : scoreboard
