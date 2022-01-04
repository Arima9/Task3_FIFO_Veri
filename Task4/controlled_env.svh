class controlled_env extends uvm_env;

   `uvm_component_utils(controlled_env)    

   controlled_driver drv;
   scoreboard sb;
   printer prt;
    
   function new(string name = "controlled_env", uvm_component parent = null );
      super.new(name, parent);
   endfunction : new

   function void build_phase(uvm_phase phase);
      super.build_phase(phase);
      drv = controlled_driver::type_id::create("drv",this);
      sb  = scoreboard::type_id::create("sb",this);
      prt = printer::type_id::create("prt",this);
   endfunction : build_phase
endclass : controlled_env
