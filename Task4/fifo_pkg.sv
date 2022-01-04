package fifo_pkg;
  import uvm_pkg::*;

   virtual interface fifo_if global_fif;

  `include "uvm_macros.svh"
  `include "random_driver.svh"
  `include "controlled_driver.svh"
  `include "scoreboard.svh"
  `include "printer.svh"
  `include "random_env.svh"  
  `include "controlled_env.svh"  
  `include "random_test.svh"  
  `include "controlled_test.svh"  

endpackage: fifo_pkg
