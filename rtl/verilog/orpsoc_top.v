//FIXME: Used for tristate only
module orpsoc_top (
	input		sys_clk_pad_i,
	input		rst_n_pad_i,

	output	[1:0]	sdram_ba_pad_o,
	output	[12:0]	sdram_a_pad_o,
	output		sdram_cs_n_pad_o,
	output		sdram_ras_pad_o,
	output		sdram_cas_pad_o,
	output		sdram_we_pad_o,
	inout	[15:0]	sdram_dq_pad_io,
	output	[1:0]	sdram_dqm_pad_o,
	output		sdram_cke_pad_o,
	output		sdram_clk_pad_o,

	input		uart0_srx_pad_i,
	output		uart0_stx_pad_o,

	inout	[7:0]	gpio0_io,

    output          spi0_sck_o,
    output          spi0_mosi_o,
    input           spi0_miso_i,
    output          spi0_ss_o,
    output          accelerometer_cs_o
);

parameter	IDCODE_VALUE = 32'h14951185;

// choose I2C operation mode
assign accelerometer_cs_o = 1;

////////////////////////////////////////////////////////////////////////
//
// Clock and reset generation module
//
////////////////////////////////////////////////////////////////////////

wire	async_rst;
wire	wb_clk, wb_rst;
wire	dbg_tck;
wire	sdram_clk;
wire	sdram_rst;

assign	sdram_clk_pad_o = sdram_clk;




  
////////////////////////////////////////////////////////////////////////
//
// SDRAM Memory Controller
//
////////////////////////////////////////////////////////////////////////

assign	sdram_clk_pad_o = sdram_clk;


////////////////////////////////////////////////////////////////////////
//
// GPIO 0
//
////////////////////////////////////////////////////////////////////////


////////////////////////////////////////////////////////////////////////
//
// DE0 Nano core
//
////////////////////////////////////////////////////////////////////////
de0_nano
  de0_nano_core
    (
     .sys_clk_pad_i (sys_clk_pad_i),
     .rst_n_pad_i   (rst_n_pad_i),
     // Interface: sdram
     .dq_io	 (sdram_dq_pad_io),
     .a_pad_o	 (sdram_a_pad_o),	
     .ba_pad_o	 (sdram_ba_pad_o),	
     .cas_pad_o	 (sdram_cas_pad_o),	
     .cke_pad_o	 (sdram_cke_pad_o),	
     .clk_pad_o  (sdram_clk),
     .cs_n_pad_o (sdram_cs_n_pad_o),
     .dqm_pad_o	 (sdram_dqm_pad_o),	
     .ras_pad_o	 (sdram_ras_pad_o),	
     .we_pad_o   (sdram_we_pad_o),

     // Interface: spi
     .miso_i (spi0_miso_i),
     .mosi_o (spi0_mosi_o),
     .sck_o  (spi0_sck_o),

     // Interface: uart
     .uart_rx_i (uart0_srx_pad_i),
     .uart_tx_o (uart0_stx_pad_o),

     // GPIO
     .gpio_io     (gpio_io)
);

endmodule // orpsoc_top
