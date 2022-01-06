class controlled_test extends uvm_test;

  `uvm_component_utils(random_test)    
  controlled_env t_env;

  function new(string name, uvm_component parent);
    super.new(name, parent);
  endfunction : new

  function void build_phase (uvm_phase phase);
    super.build_phase(phase);
     t_env = controlled_env::type_id::create("t_env", this);
  endfunction : build_phase
   
endclass : controlled_test
