//FIXME: Only required to provide correct top-level name
//TODO: Move tristate to separate component
module wb_gpio
  (//WB
   input 	wb_clk,
   input 	wb_rst,

   input 	wb_adr_i,
   input [7:0] 	wb_dat_i,
   input 	wb_we_i,
   input 	wb_cyc_i,
   input 	wb_stb_i,
   input [2:0] 	wb_cti_i,
   input [1:0] 	wb_bte_i,
   output [7:0] wb_dat_o,
   output 	wb_ack_o,
   output 	wb_err_o,
   output 	wb_rty_o,

   inout [7:0] 	gpio_io
);

wire [7:0]	gpio_i;
wire [7:0]	gpio_o;
wire [7:0]	gpio_dir_o;

// Tristate logic for IO
// 0 = input, 1 = output
genvar                    i;
generate
	for (i = 0; i < 8; i = i+1) begin: gpio_tris
		assign gpio_io[i] = gpio_dir_o[i] ? gpio_o[i] : 1'bz;
		assign gpio_i[i]  = gpio_dir_o[i] ? gpio_o[i] : gpio_io[i];
	end
endgenerate

   gpio gpio
     (//WB
      .wb_clk   (wb_clk),
      .wb_rst   (wb_rst),
      .wb_adr_i (wb_adr_i),
      .wb_dat_i (wb_dat_i),
      .wb_we_i  (wb_we_i ),
      .wb_cyc_i (wb_cyc_i),
      .wb_stb_i (wb_stb_i),
      .wb_cti_i (wb_cti_i),
      .wb_bte_i (wb_bte_i),
      .wb_dat_o (wb_dat_o),
      .wb_ack_o (wb_ack_o),
      .wb_err_o (wb_err_o),
      .wb_rty_o (wb_rty_o),
      
      .gpio_i    (gpio_i),
      .gpio_o    (gpio_o),
      .gpio_dir_o (gpio_dir_o));

endmodule
