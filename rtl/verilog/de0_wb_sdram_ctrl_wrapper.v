//FIXME: Used for top-level renaming and deflatten buses
module de0_nano_wb_sdram_ctrl
  (// SDRAM interface
   input 	 sdram_rst,
   input 	 sdram_clk,
   output 	 clk_pad_o,
   output [1:0]  ba_pad_o,
   output [12:0] a_pad_o,
   output 	 cs_n_pad_o,
   output 	 ras_pad_o,
   output 	 cas_pad_o,
   output 	 we_pad_o,
   inout [15:0]  dq_io,
   output [1:0]  dqm_pad_o,
   output 	 cke_pad_o,

   // Wishbone interface
   input 	 wb_clk,
   input 	 wb_rst,

   input [31:0]  wb_sdram_ibus_adr_i,
   input [31:0]  wb_sdram_ibus_dat_i,
   input [3:0] 	 wb_sdram_ibus_sel_i,
   input 	 wb_sdram_ibus_we_i,
   input 	 wb_sdram_ibus_cyc_i,
   input 	 wb_sdram_ibus_stb_i,
   input [2:0] 	 wb_sdram_ibus_cti_i,
   input [1:0] 	 wb_sdram_ibus_bte_i,
   output [31:0] wb_sdram_ibus_dat_o,
   output 	 wb_sdram_ibus_ack_o,

   input [31:0]  wb_sdram_dbus_adr_i,
   input [31:0]  wb_sdram_dbus_dat_i,
   input [3:0] 	 wb_sdram_dbus_sel_i,
   input 	 wb_sdram_dbus_we_i,
   input 	 wb_sdram_dbus_cyc_i,
   input 	 wb_sdram_dbus_stb_i,
   input [2:0] 	 wb_sdram_dbus_cti_i,
   input [1:0] 	 wb_sdram_dbus_bte_i,
   output [31:0] wb_sdram_dbus_dat_o,
   output 	 wb_sdram_dbus_ack_o);

   assign clk_pad_o = sdram_clk;

wire	[15:0]	dq_i;
wire	[15:0]	dq_o;
wire		dq_oe;

assign	dq_i  = dq_io;
assign	dq_io = dq_oe ? dq_o : 16'bz;
   
wb_sdram_ctrl #(
`ifndef SIM
	.TECHNOLOGY			("ALTERA"),
`endif
	.CLK_FREQ_MHZ			(100),	// sdram_clk freq in MHZ
	.POWERUP_DELAY			(200),	// power up delay in us
	.WB_PORTS			(2),	// Number of wishbone ports
	.ROW_WIDTH			(13),	// Row width
	.COL_WIDTH			(9),	// Column width
	.BA_WIDTH			(2),	// Ba width
	.tCAC				(2),	// CAS Latency
	.tRAC				(5),	// RAS Latency
	.tRP				(2),	// Command Period (PRE to ACT)
	.tRC				(7),	// Command Period (REF to REF / ACT to ACT)
	.tMRD				(2)	// Mode Register Set To Command Delay time
)

wb_sdram_ctrl0 (
	// External SDRAM interface
	.ba_pad_o	(ba_pad_o),
	.a_pad_o	(a_pad_o[12:0]),
	.cs_n_pad_o	(cs_n_pad_o),
	.ras_pad_o	(ras_pad_o),
	.cas_pad_o	(cas_pad_o),
	.we_pad_o	(we_pad_o),
	.dq_i		(dq_i[15:0]),
	.dq_o		(dq_o[15:0]),
	.dqm_pad_o	(dqm_pad_o[1:0]),
	.dq_oe		(dq_oe),
	.cke_pad_o	(cke_pad_o),
	.sdram_clk	(sdram_clk),
	.sdram_rst	(sdram_rst),

	.wb_clk		(wb_clk),
	.wb_rst		(wb_rst),

	.wb_adr_i	({wb_sdram_ibus_adr_i, wb_sdram_dbus_adr_i}),
	.wb_stb_i	({wb_sdram_ibus_stb_i, wb_sdram_dbus_stb_i}),
	.wb_cyc_i	({wb_sdram_ibus_cyc_i, wb_sdram_dbus_cyc_i}),
	.wb_cti_i	({wb_sdram_ibus_cti_i, wb_sdram_dbus_cti_i}),
	.wb_bte_i	({wb_sdram_ibus_bte_i, wb_sdram_dbus_bte_i}),
	.wb_we_i	({wb_sdram_ibus_we_i , wb_sdram_dbus_we_i }),
	.wb_sel_i	({wb_sdram_ibus_sel_i, wb_sdram_dbus_sel_i}),
	.wb_dat_i	({wb_sdram_ibus_dat_i, wb_sdram_dbus_dat_i}),
	.wb_dat_o	({wb_sdram_ibus_dat_o, wb_sdram_dbus_dat_o}),
	.wb_ack_o	({wb_sdram_ibus_ack_o, wb_sdram_dbus_ack_o}));
endmodule
