module de0_nano_mor1kx
  (
   input 	 clk,
   input 	 rst,

   // Wishbone interface
   output [31:0] iwbm_adr_o,
   output 	 iwbm_stb_o,
   output 	 iwbm_cyc_o,
   output [3:0]  iwbm_sel_o,
   output 	 iwbm_we_o,
   output [2:0]  iwbm_cti_o,
   output [1:0]  iwbm_bte_o,
   output [31:0] iwbm_dat_o,
   input 	 iwbm_err_i,
   input 	 iwbm_ack_i,
   input [31:0]  iwbm_dat_i,
   input 	 iwbm_rty_i,
   
   output [31:0] dwbm_adr_o,
   output 	 dwbm_stb_o,
   output 	 dwbm_cyc_o,
   output [3:0]  dwbm_sel_o,
   output 	 dwbm_we_o,
   output [2:0]  dwbm_cti_o,
   output [1:0]  dwbm_bte_o,
   output [31:0] dwbm_dat_o,
   input 	 dwbm_err_i,
   input 	 dwbm_ack_i,
   input [31:0]  dwbm_dat_i,
   input 	 dwbm_rty_i,
   
   input [31:0]  irq_i,
   
   // Debug interface
   input [15:0]  du_addr_i,
   input 	 du_stb_i,
   input [31:0]  du_dat_i,
   input 	 du_we_i,
   output [31:0] du_dat_o,
   output 	 du_ack_o,
   // Stall control from debug interface
   input 	 du_stall_i,
   output 	 du_stall_o
   );
   
   mor1kx #(.OPTION_RESET_PC (32'hf0000000))
   mor1kx
     (// Interface: dbg
      .du_addr_i           (du_addr_i),
      .du_dat_i            (du_dat_o),
      .du_stall_i          (du_stall_o),
      .du_stb_i            (du_stb_o),
      .du_we_i             (du_we_i),
      .du_ack_o            (du_ack_o),
      .du_dat_o            (du_dat_o),
      .du_stall_o          (du_stall_o),
      // Interface: wb_d
      .dwbm_ack_i          (dwbm_ack_i),
      .dwbm_dat_i          (dwbm_dat_i),
      .dwbm_err_i          (dwbm_err_i),
      .dwbm_rty_i          (dwbm_rty_i),
      .dwbm_adr_o          (dwbm_adr_o),
      .dwbm_bte_o          (dwbm_bte_o),
      .dwbm_cti_o          (dwbm_cti_o),
      .dwbm_cyc_o          (dwbm_cyc_o),
      .dwbm_dat_o          (dwbm_dat_o),
      .dwbm_sel_o          (dwbm_sel_o),
      .dwbm_stb_o          (dwbm_stb_o),
      .dwbm_we_o           (dwbm_we_o),
      // Interface: wb_i
      .iwbm_ack_i          (iwbm_ack_i),
      .iwbm_dat_i          (iwbm_dat_i),
      .iwbm_err_i          (iwbm_err_i),
      .iwbm_rty_i          (iwbm_rty_i),
      .iwbm_adr_o          (iwbm_adr_o),
      .iwbm_bte_o          (iwbm_bte_o),
      .iwbm_cti_o          (iwbm_cti_o),
      .iwbm_cyc_o          (iwbm_cyc_o),
      .iwbm_dat_o          (iwbm_dat_o),
      .iwbm_sel_o          (iwbm_sel_o),
      .iwbm_stb_o          (iwbm_stb_o),
      .iwbm_we_o           (iwbm_we_o),
      // Interface: wb_sys
      .clk                 (clk),
      .rst                 (rst),
      // These ports are not in any interface
      .irq_i               (irq_i),
      .multicore_coreid_i  (32'd0),
      .multicore_numcores_i(32'd0),
      .snoop_adr_i         (32'd0),
      .snoop_en_i          (1'b0),
      .traceport_exec_pc_o     (),
      .traceport_exec_valid_o  (),
      .traceport_exec_wbdata_o (),
      .traceport_exec_wben_o   (),
      .traceport_exec_wbreg_o  ());
   
endmodule
