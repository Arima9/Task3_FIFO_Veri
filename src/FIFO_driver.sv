class FIFO_driver;

    localparam DWIDTH = 8;
    localparam FDEPTH = 32;

    virtual FIFO_signals if_FIFO;
    virtual FIFO_signals if_QUEUE;

    data_ty data_temp;
    logic push_temp;
    logic pop_temp;


    function new(   virtual FIFO_signals.prov A,
                    virtual FIFO_signals.prov B,    
                );

        if_FIFO = A;
        if_QUEUE = B;

    endfunction //new()

    task clear_FIFO(); //Task to reset the FIFO
        if_FIFO.wr_rst = 1'b1;
        if_FIFO.rd_rst = 1'b1;
        if_QUEUE.wr_rst = 1'b1;
        if_QUEUE.rd_rst = 1'b1;
        #1;
        if_FIFO.wr_rst = 1'b0;
        if_FIFO.rd_rst = 1'b0;
        if_QUEUE.wr_rst = 1'b0;
        if_QUEUE.rd_rst = 1'b0;
        #1;        
    endtask

    task Data_inj(); //Task for random data injection
        #0.2;
        data_temp = $random() & (2**DWIDTH-1);
        if_FIFO.data_in = data_temp;
        if_QUEUE.data_in = data_temp;
        push_temp = $random() & 1'b1;
        if_FIFO.push = push_temp;
        if_QUEUE.push = push_temp;
        
    endtask

    task Data_pop(output data_ty data_task_out_FIFO, data_task_out_QUEUE); //Task for random data pop
        #0.2;
        pop_temp = $random() & 1'b1;
        if_FIFO.pop = pop_temp;
        if_QUEUE.pop = pop_temp;
        #0.2;
        data_task_out_FIFO = if_FIFO.data_out;
        data_task_out_QUEUE = if_QUEUE.data_out;
    endtask


endclass //FIFO_driver