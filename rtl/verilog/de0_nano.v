//-----------------------------------------------------------------------------
// File          : de0_nano.v
// Creation date : 10.01.2016
// Creation time : 22:54:01
// Description   : 
// Created by    : 
// This file was generated with Kactus2 verilog generator
// based on IP-XACT component librecores.org:soc:de0_nano:1.0
// whose XML file is /home/olof/code/or1k/staging/de0_nano_ipxact/de0_nano.1.0.xml
//-----------------------------------------------------------------------------

module de0_nano(
    // Interface: gpio
    inout          [7:0]                gpio0_io,

    // Interface: sdram
    output         [12:0]               sdram_a_pad_o,
    output         [1:0]                sdram_ba_pad_o,
    output                              sdram_cas_pad_o,
    output                              sdram_cke_pad_o,
    output                              sdram_clk_pad_o,
    output                              sdram_cs_n_pad_o,
    output         [1:0]                sdram_dqm_pad_o,
    output                              sdram_ras_pad_o,
    output                              sdram_we_pad_o,
    inout          [15:0]               sdram_dq_io,

    // Interface: spi
    input                               spi0_miso_i,
    output                              spi0_mosi_o,
    output                              spi0_sck_o,
    output                              spi0_ss_o,

    // Interface: uart
    input                               uart_rx_i,
    output                              uart_tx_o,

    // These ports are not in any interface
    input                               rst_n_pad_i,
    input                               sys_clk_pad_i
);

    wire [31:0] mor1kx_irqs;
    wire        irq6;
    wire        irq2;
    wire        jtag_dbg_capture_dr;
    wire        jtag_dbg_debug_select;
    wire        jtag_dbg_pause_dr;
    wire        jtag_dbg_shift_dr;
    wire        jtag_dbg_tck;
    wire        jtag_dbg_tdi;
    wire        jtag_dbg_tdo;
    wire        jtag_dbg_update_dr;
    wire        sdram_sys_clk;
    wire        sdram_sys_rst;
    wire [31:0] wb_spi_flash_adr_o;
    wire [7:0]  wb_spi_flash_dat_o;
    wire        wb_spi_flash_we_o;
    wire        wb_spi_flash_cyc_o;
    wire        wb_spi_flash_stb_o;
    wire [2:0]  wb_spi_flash_cti_o;
    wire [1:0]  wb_spi_flash_bte_o;
    wire [7:0]  wb_spi_flash_dat_i;
    wire        wb_spi_flash_ack_i;
    wire [31:0] wb_cpu_i_adr_o;
    wire [31:0] wb_cpu_i_dat_o;
    wire [3:0]  wb_cpu_i_sel_o;
    wire        wb_cpu_i_we_o;
    wire        wb_cpu_i_cyc_o;
    wire        wb_cpu_i_stb_o;
    wire [2:0]  wb_cpu_i_cti_o;
    wire [1:0]  wb_cpu_i_bte_o;
    wire [31:0] wb_cpu_i_dat_i;
    wire        wb_cpu_i_ack_i;
    wire        wb_cpu_i_err_i;
    wire        wb_cpu_i_rty_i;
    wire [31:0] wb_cpu_d_adr_o;
    wire [31:0] wb_cpu_d_dat_o;
    wire [3:0]  wb_cpu_d_sel_o;
    wire        wb_cpu_d_we_o;
    wire        wb_cpu_d_cyc_o;
    wire        wb_cpu_d_stb_o;
    wire [2:0]  wb_cpu_d_cti_o;
    wire [1:0]  wb_cpu_d_bte_o;
    wire [31:0] wb_cpu_d_dat_i;
    wire        wb_cpu_d_ack_i;
    wire        wb_cpu_d_err_i;
    wire        wb_cpu_d_rty_i;
    wire [31:0] wb_gpio_led_adr_o;
    wire [7:0]  wb_gpio_led_dat_o;
    wire        wb_gpio_led_we_o;
    wire        wb_gpio_led_cyc_o;
    wire        wb_gpio_led_stb_o;
    wire [2:0]  wb_gpio_led_cti_o;
    wire [1:0]  wb_gpio_led_bte_o;
    wire [7:0]  wb_gpio_led_dat_i;
    wire        wb_gpio_led_ack_i;
    wire        wb_gpio_led_err_i;
    wire        wb_gpio_led_rty_i;
    wire [31:0] wb_uart_adr_o;
    wire [7:0]  wb_uart_dat_o;
    wire        wb_uart_we_o;
    wire        wb_uart_cyc_o;
    wire        wb_uart_stb_o;
    wire [2:0]  wb_uart_cti_o;
    wire [1:0]  wb_uart_bte_o;
    wire [7:0]  wb_uart_dat_i;
    wire        wb_uart_ack_i;
    wire        dbg_cpu0_ack_i;
    wire [31:0] dbg_cpu0_dat_i;
    wire [31:0] dbg_cpu0_dat_o;
    wire        dbg_cpu0_stall_o;
    wire        dbg_cpu0_stall_i;
    wire        dbg_cpu0_we_o;
    wire        dbg_cpu0_stb_o;
    wire [31:0] dbg_cpu0_addr_o;
    wire [31:0] wb_dbg_adr_o;
    wire [31:0] wb_dbg_dat_o;
    wire [3:0]  wb_dbg_sel_o;
    wire        wb_dbg_we_o;
    wire        wb_dbg_cyc_o;
    wire        wb_dbg_stb_o;
    wire [2:0]  wb_dbg_cti_o;
    wire [1:0]  wb_dbg_bte_o;
    wire [31:0] wb_dbg_dat_i;
    wire        wb_dbg_ack_i;
    wire [31:0] wb_sdram_d_adr_o;
    wire [31:0] wb_sdram_d_dat_o;
    wire [3:0]  wb_sdram_d_sel_o;
    wire        wb_sdram_d_we_o;
    wire        wb_sdram_d_cyc_o;
    wire        wb_sdram_d_stb_o;
    wire [2:0]  wb_sdram_d_cti_o;
    wire [1:0]  wb_sdram_d_bte_o;
    wire [31:0] wb_sdram_d_dat_i;
    wire        wb_sdram_d_ack_i;
    wire [31:0] wb_sdram_i_adr_o;
    wire [31:0] wb_sdram_i_dat_o;
    wire [3:0]  wb_sdram_i_sel_o;
    wire        wb_sdram_i_we_o;
    wire        wb_sdram_i_cyc_o;
    wire        wb_sdram_i_stb_o;
    wire [2:0]  wb_sdram_i_cti_o;
    wire [1:0]  wb_sdram_i_bte_o;
    wire [31:0] wb_sdram_i_dat_i;
    wire        wb_sdram_i_ack_i;
    wire        clkgen_wb_sys_clk;
    wire        clkgen_wb_sys_rst;
    wire [31:0] wb_bootrom_adr_o;
    wire [31:0] wb_bootrom_dat_o;
    wire [3:0]  wb_bootrom_sel_o;
    wire        wb_bootrom_we_o;
    wire        wb_bootrom_cyc_o;
    wire        wb_bootrom_stb_o;
    wire [2:0]  wb_bootrom_cti_o;
    wire [1:0]  wb_bootrom_bte_o;
    wire [31:0] wb_bootrom_dat_i;
    wire        wb_bootrom_ack_i;

    // IP-XACT VLNV: librecores.org:ip:adv_debug_sys:1.0
    adv_debug_sys adv_debug_sys(
        // Interface: dbg_cpu0
        .cpu0_ack_i          (dbg_cpu0_ack_i),
        .cpu0_bp_i           (dbg_cpu0_stall_i),
        .cpu0_data_i         (dbg_cpu0_dat_i),
        .cpu0_addr_o         (dbg_cpu0_addr_o),
        .cpu0_data_o         (dbg_cpu0_dat_o),
        .cpu0_stall_o        (dbg_cpu0_stall_o),
        .cpu0_stb_o          (dbg_cpu0_stb_o),
        .cpu0_we_o           (dbg_cpu0_we_o),
        // Interface: jsp
        .wb_jsp_adr_i        ( ),
        .wb_jsp_bte_i        ( ),
        .wb_jsp_cti_i        ( ),
        .wb_jsp_cyc_i        ( ),
        .wb_jsp_dat_i        ( ),
        .wb_jsp_sel_i        ( ),
        .wb_jsp_stb_i        ( ),
        .wb_jsp_we_i         ( ),
        .wb_jsp_ack_o        ( ),
        .wb_jsp_dat_o        ( ),
        .wb_jsp_err_o        ( ),
        // Interface: jtag
        .capture_dr_i        (jtag_dbg_capture_dr),
        .debug_select_i      (jtag_dbg_debug_select),
        .pause_dr_i          (jtag_dbg_pause_dr),
        .shift_dr_i          (jtag_dbg_shift_dr),
        .tck_i               (jtag_dbg_tck),
        .tdi_i               (jtag_dbg_tdo),
        .update_dr_i         (jtag_dbg_update_dr),
        .tdo_o               (jtag_dbg_tdi),
        // Interface: wb_sys
        .wb_clk_i            (clkgen_wb_sys_clk),
        .wb_rst_i            (clkgen_wb_sys_rst),
        // Interface: wbm
        .wb_ack_i            (wb_dbg_ack_i),
        .wb_dat_i            (wb_dbg_dat_i),
        .wb_adr_o            (wb_dbg_adr_o),
        .wb_bte_o            (wb_dbg_bte_o),
        .wb_cti_o            (wb_dbg_cti_o),
        .wb_cyc_o            (wb_dbg_cyc_o),
        .wb_dat_o            (wb_dbg_dat_o),
        .wb_sel_o            (wb_dbg_sel_o),
        .wb_stb_o            (wb_dbg_stb_o),
        .wb_we_o             (wb_dbg_we_o),
        // These ports are not in any interface
        .cpu0_clk_i          ( ),
        .cpu1_ack_i          ( ),
        .cpu1_bp_i           ( ),
        .cpu1_clk_i          ( ),
        .cpu1_data_i         ( ),
        .rst_i               ( ),
        .wb_err_i            ( ),
        .wb_jsp_cab_i        ( ),
        .cpu0_rst_o          ( ),
        .cpu1_addr_o         ( ),
        .cpu1_data_o         ( ),
        .cpu1_rst_o          ( ),
        .cpu1_stall_o        ( ),
        .cpu1_stb_o          ( ),
        .cpu1_we_o           ( ),
        .int_o               ( ),
        .wb_cab_o            ( ));

    // IP-XACT VLNV: librecores.org:ip:altera_virtual_jtag:1.0
    altera_virtual_jtag altera_virtual_jtag(
        // Interface: debug
        .debug_tdo_i         (jtag_dbg_tdi),
        .capture_dr_o        (jtag_dbg_capture_dr),
        .debug_select_o      (jtag_dbg_debug_select),
        .pause_dr_o          (jtag_dbg_pause_dr),
        .shift_dr_o          (jtag_dbg_shift_dr),
        .tck_o               (jtag_dbg_tck),
        .tdi_o               (jtag_dbg_tdo),
        .update_dr_o         (jtag_dbg_update_dr),
        // These ports are not in any interface
        .run_test_idle_o     ( ),
        .test_logic_reset_o  ( ));

    // IP-XACT VLNV: librecores.org:ip:de0_nano_bootrom:0
    de0_nano_bootrom bootrom(
        // Interface: wb
        .wb_adr_i            (wb_bootrom_adr_o),
        .wb_cyc_i            (wb_bootrom_cyc_o),
        .wb_stb_i            (wb_bootrom_stb_o),
        .wb_ack_o            (wb_bootrom_ack_i),
        .wb_dat_o            (wb_bootrom_dat_i),
        // Interface: wb_sys
        .wb_clk_i            (clkgen_wb_sys_clk),
        .wb_rst_i            (clkgen_wb_sys_rst));

    // IP-XACT VLNV: librecores.org:ip:de0_nano_clkgen:1.0
    de0_nano_clkgen clkgen(
        // Interface: sdram_sys
        .sdram_clk_o         (sdram_sys_clk),
        .sdram_rst_o         (sdram_sys_rst),
        // Interface: wb_sys
        .wb_clk_o            (clkgen_wb_sys_clk),
        .wb_rst_o            (clkgen_wb_sys_rst),
        // These ports are not in any interface
        .rst_n_pad_i         (rst_n_pad_i),
        .sys_clk_pad_i       (sys_clk_pad_i),
        .async_rst_o         ( ));

    // IP-XACT VLNV: librecores.org:ip:wb_gpio:1.0
    wb_gpio gpio_led(
        // Interface: gpio
        .gpio_io             (gpio0_io),
        // Interface: wb
        .wb_adr_i            (wb_gpio_led_adr_o[0]),
        .wb_bte_i            (wb_gpio_led_bte_o),
        .wb_cti_i            (wb_gpio_led_cti_o),
        .wb_cyc_i            (wb_gpio_led_cyc_o),
        .wb_dat_i            (wb_gpio_led_dat_o),
        .wb_stb_i            (wb_gpio_led_stb_o),
        .wb_we_i             (wb_gpio_led_we_o),
        .wb_ack_o            (wb_gpio_led_ack_i),
        .wb_dat_o            (wb_gpio_led_dat_i),
        .wb_err_o            (wb_gpio_led_err_i),
        .wb_rty_o            (wb_gpio_led_rty_i),
        // Interface: wb_sys
        .wb_clk              (clkgen_wb_sys_clk),
        .wb_rst              (clkgen_wb_sys_rst));

    // IP-XACT VLNV: librecores.org:ip:de0_nano_mor1kx:3.1
    de0_nano_mor1kx mor1kx(
        // Interface: dbg
        .du_addr_i           (dbg_cpu0_addr_o[15:0]),
        .du_dat_i            (dbg_cpu0_dat_o),
        .du_stall_i          (dbg_cpu0_stall_o),
        .du_stb_i            (dbg_cpu0_stb_o),
        .du_we_i             (dbg_cpu0_we_o),
        .du_ack_o            (dbg_cpu0_ack_i),
        .du_dat_o            (dbg_cpu0_dat_i),
        .du_stall_o          (dbg_cpu0_stall_i),
        // Interface: wb_d
        .dwbm_ack_i          (wb_cpu_d_ack_i),
        .dwbm_dat_i          (wb_cpu_d_dat_i),
        .dwbm_err_i          (wb_cpu_d_err_i),
        .dwbm_rty_i          (wb_cpu_d_rty_i),
        .dwbm_adr_o          (wb_cpu_d_adr_o),
        .dwbm_bte_o          (wb_cpu_d_bte_o),
        .dwbm_cti_o          (wb_cpu_d_cti_o),
        .dwbm_cyc_o          (wb_cpu_d_cyc_o),
        .dwbm_dat_o          (wb_cpu_d_dat_o),
        .dwbm_sel_o          (wb_cpu_d_sel_o),
        .dwbm_stb_o          (wb_cpu_d_stb_o),
        .dwbm_we_o           (wb_cpu_d_we_o),
        // Interface: wb_i
        .iwbm_ack_i          (wb_cpu_i_ack_i),
        .iwbm_dat_i          (wb_cpu_i_dat_i),
        .iwbm_err_i          (wb_cpu_i_err_i),
        .iwbm_rty_i          (wb_cpu_i_rty_i),
        .iwbm_adr_o          (wb_cpu_i_adr_o),
        .iwbm_bte_o          (wb_cpu_i_bte_o),
        .iwbm_cti_o          (wb_cpu_i_cti_o),
        .iwbm_cyc_o          (wb_cpu_i_cyc_o),
        .iwbm_dat_o          (wb_cpu_i_dat_o),
        .iwbm_sel_o          (wb_cpu_i_sel_o),
        .iwbm_stb_o          (wb_cpu_i_stb_o),
        .iwbm_we_o           (wb_cpu_i_we_o),
        // Interface: wb_sys
        .clk                 (clkgen_wb_sys_clk),
        .rst                 (clkgen_wb_sys_rst),
        // These ports are not in any interface
        .irq_i               (mor1kx_irqs));

    // IP-XACT VLNV: librecores.org:ip:mor1kx_irq:1.0
    mor1kx_irq mor1kx_irq(
        // These ports are not in any interface
        .irq0                (1'b0),
        .irq1                (1'b0),
        .irq10               (1'b0),
        .irq11               (1'b0),
        .irq12               (1'b0),
        .irq2                (irq2),
        .irq3                (1'b0),
        .irq4                (1'b0),
        .irq6                (irq6),
        .irq7                (1'b0),
        .irq8                (1'b0),
        .irq9                (1'b0),
        .irq_o               (mor1kx_irqs));

    // IP-XACT VLNV: librecores.org:ip:simple_spi:1.0
    simple_spi spi_flash_ctrl(
        // Interface: spi
        .miso_i              (spi0_miso_i),
        .mosi_o              (spi0_mosi_o),
        .sck_o               (spi0_sck_o),
        .ss_o                (spi0_ss_o),
        // Interface: wb
        .adr_i               (wb_spi_flash_adr_o[2:0]),
        .cyc_i               (wb_spi_flash_cyc_o),
        .dat_i               (wb_spi_flash_dat_o),
        .stb_i               (wb_spi_flash_stb_o),
        .we_i                (wb_spi_flash_we_o),
        .ack_o               (wb_spi_flash_ack_i),
        .dat_o               (wb_spi_flash_dat_i),
        // Interface: wb_sys
        .clk_i               (clkgen_wb_sys_clk),
        .rst_i               (clkgen_wb_sys_rst),
        // These ports are not in any interface
        .inta_o              (irq6));

    // IP-XACT VLNV: librecores.org:ip:uart16550:1.4
    uart16550 uart(
        // Interface: uart
        .srx_pad_i           (uart_rx_i),
        .stx_pad_o           (uart_tx_o),
        // Interface: wb_sys
        .wb_clk_i            (clkgen_wb_sys_clk),
        .wb_rst_i            (clkgen_wb_sys_rst),
        // Interface: wbs
        .wb_adr_i            (wb_uart_adr_o[2:0]),
        .wb_cyc_i            (wb_uart_cyc_o),
        .wb_dat_i            (wb_uart_dat_o),
        .wb_stb_i            (wb_uart_stb_o),
        .wb_we_i             (wb_uart_we_o),
        .wb_ack_o            (wb_uart_ack_i),
        .wb_dat_o            (wb_uart_dat_i),
        // These ports are not in any interface
        .int_o               (irq2));

    // IP-XACT VLNV: librecores.org:ip:de0_nano_wb_intercon:1.0
    de0_nano_wb_intercon wb_intercon(
        // Interface: wb_sys
        .wb_clk_i            (clkgen_wb_sys_clk),
        .wb_rst_i            (clkgen_wb_sys_rst),
        // Interface: wbm_gpio0
        .wb_gpio0_ack_i      (wb_gpio_led_ack_i),
        .wb_gpio0_dat_i      (wb_gpio_led_dat_i),
        .wb_gpio0_err_i      (wb_gpio_led_err_i),
        .wb_gpio0_rty_i      (wb_gpio_led_rty_i),
        .wb_gpio0_adr_o      (wb_gpio_led_adr_o),
        .wb_gpio0_bte_o      (wb_gpio_led_bte_o),
        .wb_gpio0_cti_o      (wb_gpio_led_cti_o),
        .wb_gpio0_cyc_o      (wb_gpio_led_cyc_o),
        .wb_gpio0_dat_o      (wb_gpio_led_dat_o),
        .wb_gpio0_stb_o      (wb_gpio_led_stb_o),
        .wb_gpio0_we_o       (wb_gpio_led_we_o),
        // Interface: wbm_rom0
        .wb_rom0_ack_i       (wb_bootrom_ack_i),
        .wb_rom0_dat_i       (wb_bootrom_dat_i),
        .wb_rom0_adr_o       (wb_bootrom_adr_o),
        .wb_rom0_bte_o       (wb_bootrom_bte_o),
        .wb_rom0_cti_o       (wb_bootrom_cti_o),
        .wb_rom0_cyc_o       (wb_bootrom_cyc_o),
        .wb_rom0_dat_o       (wb_bootrom_dat_o),
        .wb_rom0_sel_o       (wb_bootrom_sel_o),
        .wb_rom0_stb_o       (wb_bootrom_stb_o),
        .wb_rom0_we_o        (wb_bootrom_we_o),
        // Interface: wbm_sdram_dbus
        .wb_sdram_dbus_ack_i (wb_sdram_d_ack_i),
        .wb_sdram_dbus_dat_i (wb_sdram_d_dat_i),
        .wb_sdram_dbus_adr_o (wb_sdram_d_adr_o),
        .wb_sdram_dbus_bte_o (wb_sdram_d_bte_o),
        .wb_sdram_dbus_cti_o (wb_sdram_d_cti_o),
        .wb_sdram_dbus_cyc_o (wb_sdram_d_cyc_o),
        .wb_sdram_dbus_dat_o (wb_sdram_d_dat_o),
        .wb_sdram_dbus_sel_o (wb_sdram_d_sel_o),
        .wb_sdram_dbus_stb_o (wb_sdram_d_stb_o),
        .wb_sdram_dbus_we_o  (wb_sdram_d_we_o),
        // Interface: wbm_sdram_ibus
        .wb_sdram_ibus_ack_i (wb_sdram_i_ack_i),
        .wb_sdram_ibus_dat_i (wb_sdram_i_dat_i),
        .wb_sdram_ibus_adr_o (wb_sdram_i_adr_o),
        .wb_sdram_ibus_bte_o (wb_sdram_i_bte_o),
        .wb_sdram_ibus_cti_o (wb_sdram_i_cti_o),
        .wb_sdram_ibus_cyc_o (wb_sdram_i_cyc_o),
        .wb_sdram_ibus_dat_o (wb_sdram_i_dat_o),
        .wb_sdram_ibus_sel_o (wb_sdram_i_sel_o),
        .wb_sdram_ibus_stb_o (wb_sdram_i_stb_o),
        .wb_sdram_ibus_we_o  (wb_sdram_i_we_o),
        // Interface: wbm_spi0
        .wb_spi0_ack_i       (wb_spi_flash_ack_i),
        .wb_spi0_dat_i       (wb_spi_flash_dat_i),
        .wb_spi0_adr_o       (wb_spi_flash_adr_o),
        .wb_spi0_bte_o       (wb_spi_flash_bte_o),
        .wb_spi0_cti_o       (wb_spi_flash_cti_o),
        .wb_spi0_cyc_o       (wb_spi_flash_cyc_o),
        .wb_spi0_dat_o       (wb_spi_flash_dat_o),
        .wb_spi0_stb_o       (wb_spi_flash_stb_o),
        .wb_spi0_we_o        (wb_spi_flash_we_o),
        // Interface: wbm_uart0
        .wb_uart0_ack_i      (wb_uart_ack_i),
        .wb_uart0_dat_i      (wb_uart_dat_i),
        .wb_uart0_adr_o      (wb_uart_adr_o),
        .wb_uart0_bte_o      (wb_uart_bte_o),
        .wb_uart0_cti_o      (wb_uart_cti_o),
        .wb_uart0_cyc_o      (wb_uart_cyc_o),
        .wb_uart0_dat_o      (wb_uart_dat_o),
        .wb_uart0_stb_o      (wb_uart_stb_o),
        .wb_uart0_we_o       (wb_uart_we_o),
        // Interface: wbs_dbg
        .wb_dbg_adr_i        (wb_dbg_adr_o),
        .wb_dbg_bte_i        (wb_dbg_bte_o),
        .wb_dbg_cti_i        (wb_dbg_cti_o),
        .wb_dbg_cyc_i        (wb_dbg_cyc_o),
        .wb_dbg_dat_i        (wb_dbg_dat_o),
        .wb_dbg_sel_i        (wb_dbg_sel_o),
        .wb_dbg_stb_i        (wb_dbg_stb_o),
        .wb_dbg_we_i         (wb_dbg_we_o),
        .wb_dbg_ack_o        (wb_dbg_ack_i),
        .wb_dbg_dat_o        (wb_dbg_dat_i),
        .wb_dbg_err_o        ( ),
        .wb_dbg_rty_o        ( ),
        // Interface: wbs_or1k_d
        .wb_dbus_adr_i       (wb_cpu_d_adr_o),
        .wb_dbus_bte_i       (wb_cpu_d_bte_o),
        .wb_dbus_cti_i       (wb_cpu_d_cti_o),
        .wb_dbus_cyc_i       (wb_cpu_d_cyc_o),
        .wb_dbus_dat_i       (wb_cpu_d_dat_o),
        .wb_dbus_sel_i       (wb_cpu_d_sel_o),
        .wb_dbus_stb_i       (wb_cpu_d_stb_o),
        .wb_dbus_we_i        (wb_cpu_d_we_o),
        .wb_dbus_ack_o       (wb_cpu_d_ack_i),
        .wb_dbus_dat_o       (wb_cpu_d_dat_i),
        .wb_dbus_err_o       (wb_cpu_d_err_i),
        .wb_dbus_rty_o       (wb_cpu_d_rty_i),
        // Interface: wbs_or1k_i
        .wb_or1k_i_adr_i     (wb_cpu_i_adr_o),
        .wb_or1k_i_bte_i     (wb_cpu_i_bte_o),
        .wb_or1k_i_cti_i     (wb_cpu_i_cti_o),
        .wb_or1k_i_cyc_i     (wb_cpu_i_cyc_o),
        .wb_or1k_i_dat_i     (wb_cpu_i_dat_o),
        .wb_or1k_i_sel_i     (wb_cpu_i_sel_o),
        .wb_or1k_i_stb_i     (wb_cpu_i_stb_o),
        .wb_or1k_i_we_i      (wb_cpu_i_we_o),
        .wb_or1k_i_ack_o     (wb_cpu_i_ack_i),
        .wb_or1k_i_dat_o     (wb_cpu_i_dat_i),
        .wb_or1k_i_err_o     (wb_cpu_i_err_i),
        .wb_or1k_i_rty_o     (wb_cpu_i_rty_i),
        // These ports are not in any interface
        .wb_i2c1_ack_i       ( ),
        .wb_i2c1_dat_i       ( ),
        .wb_i2c1_err_i       (1'b0),
        .wb_i2c1_rty_i       (1'b0),
        .wb_rom0_err_i       (1'b0),
        .wb_rom0_rty_i       (1'b0),
        .wb_sdram_dbus_err_i (1'b0),
        .wb_sdram_dbus_rty_i (1'b0),
        .wb_sdram_ibus_err_i (1'b0),
        .wb_sdram_ibus_rty_i (1'b0),
        .wb_spi0_err_i       (1'b0),
        .wb_spi0_rty_i       (1'b0),
        .wb_uart0_err_i      (1'b0),
        .wb_uart0_rty_i      (1'b0),
        .wb_i2c1_adr_o       ( ),
        .wb_i2c1_bte_o       ( ),
        .wb_i2c1_cti_o       ( ),
        .wb_i2c1_cyc_o       ( ),
        .wb_i2c1_dat_o       ( ),
        .wb_i2c1_stb_o       ( ),
        .wb_i2c1_we_o        ( ));

    // IP-XACT VLNV: librecores.org:ip:de0_nano_wb_sdram_ctrl:1.0
    de0_nano_wb_sdram_ctrl wb_sdram_ctrl(
        // Interface: sdram
        .a_pad_o             (sdram_a_pad_o),
        .ba_pad_o            (sdram_ba_pad_o),
        .cas_pad_o           (sdram_cas_pad_o),
        .cke_pad_o           (sdram_cke_pad_o),
        .clk_pad_o           (sdram_clk_pad_o),
        .cs_n_pad_o          (sdram_cs_n_pad_o),
        .dqm_pad_o           (sdram_dqm_pad_o),
        .ras_pad_o           (sdram_ras_pad_o),
        .we_pad_o            (sdram_we_pad_o),
        .dq_io               (sdram_dq_io),
        // Interface: sdram_sys
        .sdram_clk           (sdram_sys_clk),
        .sdram_rst           (sdram_sys_rst),
        // Interface: wb_dbus
        .wb_sdram_dbus_adr_i (wb_sdram_d_adr_o),
        .wb_sdram_dbus_bte_i (wb_sdram_d_bte_o),
        .wb_sdram_dbus_cti_i (wb_sdram_d_cti_o),
        .wb_sdram_dbus_cyc_i (wb_sdram_d_cyc_o),
        .wb_sdram_dbus_dat_i (wb_sdram_d_dat_o),
        .wb_sdram_dbus_sel_i (wb_sdram_d_sel_o),
        .wb_sdram_dbus_stb_i (wb_sdram_d_stb_o),
        .wb_sdram_dbus_we_i  (wb_sdram_d_we_o),
        .wb_sdram_dbus_ack_o (wb_sdram_d_ack_i),
        .wb_sdram_dbus_dat_o (wb_sdram_d_dat_i),
        // Interface: wb_ibus
        .wb_sdram_ibus_adr_i (wb_sdram_i_adr_o),
        .wb_sdram_ibus_bte_i (wb_sdram_i_bte_o),
        .wb_sdram_ibus_cti_i (wb_sdram_i_cti_o),
        .wb_sdram_ibus_cyc_i (wb_sdram_i_cyc_o),
        .wb_sdram_ibus_dat_i (wb_sdram_i_dat_o),
        .wb_sdram_ibus_sel_i (wb_sdram_i_sel_o),
        .wb_sdram_ibus_stb_i (wb_sdram_i_stb_o),
        .wb_sdram_ibus_we_i  (wb_sdram_i_we_o),
        .wb_sdram_ibus_ack_o (wb_sdram_i_ack_i),
        .wb_sdram_ibus_dat_o (wb_sdram_i_dat_i),
        // Interface: wb_sys
        .wb_clk              (clkgen_wb_sys_clk),
        .wb_rst              (clkgen_wb_sys_rst));


endmodule
