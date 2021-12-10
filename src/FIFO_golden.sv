program FIFO_golden(virtual FIFO_signals.cons itf);
    data_ty queue_fifo[$];
    // addr_ty wr_ptr = '0;
    // addr_ty rd_ptr = '0;
    data_ty temporal = '0;

    fork
        forever @(posedge itf.wrclk or posedge itf.wr_rst)begin
            if (itf.wr_rst)begin
                queue_fifo.delete();
            end
            else if (itf.push & ~itf.full)begin
                queue_fifo.push_front(itf.data_in);
            end
        end

        forever @(posedge itf.rdclk or posedge itf.rd_rst)begin
            if (itf.rd_rst)begin
                queue_fifo.delete();
            end

            else if (itf.pop)begin
                if (~itf.empty) begin
                    queue_fifo.pop_back(temporal);
                    itf.data_out = temporal;
                end
                else itf.data_out = temporal;
            end
        end

        forever begin
            if (queue_fifo.size() == F_DEPTH)begin
                itf.full = 1'b1;
                itf.empty = 1'b0;
            end
            else if (queue_fifo.size() == 0) begin
                itf.full = 1'b0;
                itf.empty = 1'b1;
            end
            else begin
                itf.full = 1'b0;
                itf.empty = 1'b0;
            end
        end

    join

endprogram