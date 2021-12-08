`ifndef MY_FIFO_PKG
    `define FIFO_PKG_SV
package fifo_pkg;

    localparam D_WIDTH = 8;
    localparam ADDRS   = 4;
    localparam F_DEPTH = 2**ADDRS-1;
    typedef logic [D_WIDTH-1:0] data_ty;
    typedef logic [ADDRS-1:0]   addr_ty;
    
    /*
    localparam  D_WIDTH      = 8;
    localparam  W_ADDR      = 4;
    //localparam  ADDR_GRAY   = W_ADDR + 1;
    localparam  W_DEPTH     = 2**W_ADDR;
	localparam  ENB		    = 1'b1;

    typedef logic [W_DATA-1:0]        data_t;
    typedef logic [W_ADDR-1:0]        addr_t;
    typedef enum logic {
       NO_POP = 0,
       POP = 1
       }pop_e_t;

    typedef enum logic {
       NO_PUSH = 0,
       PUSH = 1
       } push_e_t;
    */
    
endpackage
`endif