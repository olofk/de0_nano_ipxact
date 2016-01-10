module de0_nano_bootrom
  #(parameter DEPTH = 1024,             // Memory size in bytes
    parameter WB_AW = $clog2(DEPTH), // Wishbone address width
    parameter MEMFILE = "../src/de0_nano_bootrom/sw/spi_uimage_loader.vh")          // Initialization file
  (input 	 wb_clk_i,
   input 	 wb_rst_i,
   input [31:0]  wb_adr_i,
   input 	 wb_cyc_i,
   input 	 wb_stb_i,
   output [31:0] wb_dat_o,
   output 	 wb_ack_o);

wb_bootrom
  #(.DEPTH   (DEPTH),
    .MEMFILE (MEMFILE))
   bootrom
     (//Wishbone Master interface
      .wb_clk_i (wb_clk_i),
      .wb_rst_i (wb_rst_i),
      .wb_adr_i	(wb_adr_i),
      .wb_cyc_i	(wb_cyc_i),
      .wb_stb_i	(wb_stb_i),
      .wb_dat_o	(wb_dat_o),
      .wb_ack_o (wb_ack_o));

endmodule
