interface FIFO_signals 
import afifo_pkg::*;
#(
    parameter WIDTH = 8
)
(   //Input signals of the two clocks
    input bit clk_wr, 
    input bit clk_rd
);

    logic   push;
    logic   wr_rst;
    logic   full;
    logic   pop;
    logic   rd_rst;
    logic   empty;
    data_ty data_in;
    data_ty data_out;

    modport prov ( //Provider of signals
        input full, 
        input empty,
        input clk_wr,
        input clk_rd, 
        input data_out,
        output data_in,
        output push, 
        output wr_rst, 
        output pop, 
        output rd_rst
    );

    modport cons ( //Consumer of signals
        input push, 
        input clk_wr, 
        input wr_rst, 
        input pop, 
        input clk_rd, 
        input rd_rst,
        input data_in,
        output full, 
        output empty,  
        output data_out
    );

endinterface //FIFO_signals