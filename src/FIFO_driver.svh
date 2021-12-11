import afifo_pkte::*;
import fifo_pkg::*;

class FIFO_driver;

    localparam DWIDTH = 8;
    localparam FDEPTH = 32;

    virtual fifo_if if_FIFO;

    data_ty queue_fifo[$];
    //Maybe 2 Queue's to simulate the write address and read address.
    data_ty temporal = '0;

    data_ty data_temp;
    push_e_t push_temp = push_e_t'(0);
    pop_e_t pop_temp;

    function new(virtual fifo_if.dvr A);
        if_FIFO = A;
    endfunction //new()

    /*task clear_FIFO(); //Task to reset the FIFO and the queue
        if_FIFO.wr_rst = 1'b1;
        if_FIFO.rd_rst = 1'b1;
        queue_fifo.delete();
        #1;
        if_FIFO.wr_rst = 1'b0;
        if_FIFO.rd_rst = 1'b0;
        #1;
        $display("Task FIFO_driver.clear_FIFO");        
    endtask*/

    task Data_inj(); //Task for random data injection
        #0.2;
        data_temp = $random() /*& (2**DWIDTH-1)*/;
        if_FIFO.data_in = data_temp;
        push_temp = PUSH;//$random() /*& 1'b1*/;
        if_FIFO.push = push_temp;
        if (push_temp) queue_fifo.push_front(data_temp);
        $display("Task FIFO_driver.Data_inj");
    endtask

    function data_ty Data_pop(); //Task for random data pop
        pop_temp = NO_POP/*$random()*/ /*& 1'b1*/;
        if_FIFO.pop = pop_temp;
        if (pop_temp) temporal = queue_fifo.pop_back();
        Data_pop = temporal;
        $display("Function FIFO_driver.Data_pop");
    endfunction

    function int queue_size();
        queue_size = queue_fifo.size();
        $display("Function FIFO_driver.queue_size");
    endfunction

endclass //FIFO_driver