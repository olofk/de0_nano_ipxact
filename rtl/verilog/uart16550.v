//FIXME: Used for top-level renaming

module uart16550
  (// WISHBONE interface
   input 	wb_clk_i,
   input 	wb_rst_i,
   input [2:0] 	wb_adr_i,
   input [7:0] 	wb_dat_i,
   output [7:0] wb_dat_o,
   input 	wb_we_i,
   input 	wb_stb_i,
   input 	wb_cyc_i,
   input [3:0] 	wb_sel_i,
   output 	wb_ack_o,
   output 	int_o,

   // UART	signals
   input 	srx_pad_i,
   output 	stx_pad_o,
   output 	rts_pad_o,
   input 	cts_pad_i,
   output 	dtr_pad_o,
   input 	dsr_pad_i,
   input 	ri_pad_i,
   input 	dcd_pad_i);

   uart_top uart_top
     (.wb_clk_i (wb_clk_i),
      .wb_rst_i (wb_rst_i),
      .wb_adr_i (wb_adr_i),
      .wb_dat_i (wb_dat_i),
      .wb_dat_o (wb_dat_o),
      .wb_we_i  (wb_we_i),
      .wb_stb_i (wb_stb_i),
      .wb_cyc_i (wb_cyc_i),
      .wb_sel_i (wb_sel_i),
      .wb_ack_o (wb_ack_o),
      .int_o    (int_o),

      // UART	signals
      .srx_pad_i (srx_pad_i),
      .stx_pad_o (stx_pad_o),
      .rts_pad_o (rts_pad_o),
      .cts_pad_i (cts_pad_i),
      .dtr_pad_o (dtr_pad_o),
      .dsr_pad_i (dsr_pad_i),
      .ri_pad_i  (ri_pad_i),
      .dcd_pad_i (dcd_pad_i));

endmodule


