class FIFO_driver;

    localparam DWIDTH = 8;
    localparam FDEPTH = 32;

    virtual FIFO_signals if_FIFO;

    function new(   virtual FIFO_signals.prov A,
                    int width, 
                    int depth);

        if_FIFO = A;
        data_width = width;
        FIFO_depth = depth;

    endfunction //new()

    task clear_FIFO(); //Task to reset the FIFO
        if_FIFO.wr_rst = 1'b1;
        if_FIFO.rd_rst = 1'b1;
        #1;
        if_FIFO.wr_rst = 1'b0;
        if_FIFO.rd_rst = 1'b0;
        #1;        
    endtask

    task Data_inj(); //Task for random data injection
        #0.2;
        if_FIFO.data_in = $random() & (2**DWIDTH-1);
        if_FIFO.push = $random() & 1'b1;
    endtask

    task Data_pop( logic data_task_out); //Task for random data pop
        #0.2;
        if_FIFO.pop = $random() & 1'b1;
        #0.2;
        data_task_out = if_FIFO.data_out;
    endtask


endclass //FIFO_driver