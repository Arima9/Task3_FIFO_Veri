class FIFO_driver;

    localparam DWIDTH = 8;
    localparam FDEPTH = 32;

    virtual FIFO_signals if_FIFO;

    data_ty queue_fifo[$];
    //Maybe 2 Queue's to simulate the write address and read address.
    data_ty temporal = '0;

    data_ty data_temp;
    logic push_temp;
    logic pop_temp;

    function new(virtual FIFO_signals.prov A);
        if_FIFO = A;
    endfunction //new()

    task clear_FIFO(); //Task to reset the FIFO and the queue
        if_FIFO.wr_rst = 1'b1;
        if_FIFO.rd_rst = 1'b1;
        queue_fifo.delete();
        #1;
        if_FIFO.wr_rst = 1'b0;
        if_FIFO.rd_rst = 1'b0;
        #1;        
    endtask

    task Data_inj(); //Task for random data injection
        #0.2;
        data_temp = $random() & (2**DWIDTH-1);
        if_FIFO.data_in = data_temp;
        push_temp = $random() & 1'b1;
        if_FIFO.push = push_temp;
        if (push_temp) queue_fifo.push_front(data_temp);
    endtask

    function data_ty Data_pop(); //Task for random data pop
        pop_temp = $random() & 1'b1;
        if_FIFO.pop = pop_temp;
        if (pop_temp) queue_fifo.pop_back(temporal);
        Data_pop = temporal;
    endfunction

    function int queue_size();
        queue_size = queue_fifo.size();
    endfunction

endclass //FIFO_driver