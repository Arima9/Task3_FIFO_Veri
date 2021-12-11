interface FIFO_signals 
import fifo_pkg::*;
#(
    parameter WIDTH = 8
)
(   //Input signals of the two clocks
    input bit clk_wr, 
    input bit clk_rd
);

    logic   push;
    logic   wrclk;
    logic   wr_rst;
    logic   full;
    logic   pop;
    logic   rdclk;
    logic   rd_rst;
    logic   empty;
    data_ty data_in;
    data_ty data_out;

    modport prov ( //Provider of signals
        input full, 
        input empty,  
        input data_out,
        output data_in,
        output push, 
        input wrclk, 
        output wr_rst, 
        output pop, 
        input rdclk, 
        output rd_rst
    );

    modport cons ( //Consumer of signals
        input push, 
        input wrclk, 
        input wr_rst, 
        input pop, 
        input rdclk, 
        input rd_rst,
        input data_in,
        output full, 
        output empty,  
        output data_out
    );

endinterface //FIFO_signals