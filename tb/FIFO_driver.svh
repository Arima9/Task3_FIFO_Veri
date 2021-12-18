import afifo_pkg::*;
import fifo_pkg::*;

class FIFO_driver;

    localparam DWIDTH = 8;
    localparam FDEPTH = 32;

    virtual fifo_if if_FIFO;

    data_ty queue_fifo[$];
    //Maybe 2 Queue's to simulate the write address and read address.
    data_ty Data_poped = '0;

    data_ty data_temp = '0;
    push_e_t push_temp = push_e_t'(0);
    pop_e_t pop_temp = pop_e_t'(0);

    function new(virtual fifo_if.dvr A);
        if_FIFO = A;
    endfunction //new()

    task Data_inj(); //Task for random data injection
        #0.2;
        data_temp = data_ty'($random());
        if_FIFO.data_in = data_temp;
        push_temp = push_e_t'($random());
        if_FIFO.push = push_temp;
        if (push_temp == PUSH && queue_fifo.size() < 16) queue_fifo.push_front(data_temp);
        $display("Task FIFO_driver.Data_inj");
    endtask

    task Data_pop(); //Task for random data pop
        #0.2;
        pop_temp = pop_e_t'($random());
        if_FIFO.pop = pop_temp;
        if (pop_temp == POP && queue_fifo.size() > 0) Data_poped = queue_fifo.pop_back();
        $display("Function FIFO_driver.Data_pop");
    endtask

    function int queue_size();
        queue_size = queue_fifo.size();
        $display("Function FIFO_driver.queue_size");
    endfunction

endclass //FIFO_driver