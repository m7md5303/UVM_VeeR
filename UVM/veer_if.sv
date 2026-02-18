interface veer_if(clk);
    `include "common_defines.vh"
   import veer_types::*;

   input logic        clk;
   logic        rst_l;
   logic        dbg_rst_l;
   logic [31:1] rst_vec;
   logic        nmi_int;
   logic [31:1] nmi_vec;
   logic [31:1] jtag_id;


   logic [63:0] trace_rv_i_insn_ip;
   logic [63:0] trace_rv_i_address_ip;
   logic [2:0]  trace_rv_i_valid_ip;
   logic [2:0]  trace_rv_i_exception_ip;
   logic [4:0]  trace_rv_i_ecause_ip;
   logic [2:0]  trace_rv_i_interrupt_ip;
   logic [31:0] trace_rv_i_tval_ip;

   // Bus signals

   //-------------------------- LSU AXI signals--------------------------
   // AXI Write Channels
   logic             lsu_axi_awvalid;
   logic             lsu_axi_awready;
   logic [`RV_LSU_BUS_TAG-1:0]      lsu_axi_awid;
   logic [31:0]      lsu_axi_awaddr;
   logic [3:0]       lsu_axi_awregion;
   logic [7:0]       lsu_axi_awlen;
   logic [2:0]       lsu_axi_awsize;
   logic [1:0]       lsu_axi_awburst;
   logic             lsu_axi_awlock;
   logic [3:0]       lsu_axi_awcache;
   logic [2:0]       lsu_axi_awprot;
   logic [3:0]       lsu_axi_awqos;

   logic             lsu_axi_wvalid;
   logic             lsu_axi_wready;
   logic [63:0]      lsu_axi_wdata;
   logic [7:0]       lsu_axi_wstrb;
   logic             lsu_axi_wlast;

   logic             lsu_axi_bvalid;
   logic             lsu_axi_bready;
   logic [1:0]       lsu_axi_bresp;
   logic [`RV_LSU_BUS_TAG-1:0]      lsu_axi_bid;

   // AXI Read Channels
   logic             lsu_axi_arvalid;
   logic             lsu_axi_arready;
   logic [`RV_LSU_BUS_TAG-1:0]      lsu_axi_arid;
   logic [31:0]      lsu_axi_araddr;
   logic [3:0]       lsu_axi_arregion;
   logic [7:0]       lsu_axi_arlen;
   logic [2:0]       lsu_axi_arsize;
   logic [1:0]       lsu_axi_arburst;
   logic             lsu_axi_arlock;
   logic [3:0]       lsu_axi_arcache;
   logic [2:0]       lsu_axi_arprot;
   logic [3:0]       lsu_axi_arqos;

   logic             lsu_axi_rvalid;
   logic             lsu_axi_rready;
   logic [`RV_LSU_BUS_TAG-1:0]      lsu_axi_rid;
   logic [63:0]      lsu_axi_rdata;
   logic [1:0]       lsu_axi_rresp;
   logic             lsu_axi_rlast;

   //-------------------------- IFU AXI signals--------------------------
   // AXI Write Channels
   logic             ifu_axi_awvalid;
   logic             ifu_axi_awready;
   logic [`RV_IFU_BUS_TAG-1:0]      ifu_axi_awid;
   logic [31:0]      ifu_axi_awaddr;
   logic [3:0]       ifu_axi_awregion;
   logic [7:0]       ifu_axi_awlen;
   logic [2:0]       ifu_axi_awsize;
   logic [1:0]       ifu_axi_awburst;
   logic             ifu_axi_awlock;
   logic [3:0]       ifu_axi_awcache;
   logic [2:0]       ifu_axi_awprot;
   logic [3:0]       ifu_axi_awqos;

   logic             ifu_axi_wvalid;
   logic             ifu_axi_wready;
   logic [63:0]      ifu_axi_wdata;
   logic [7:0]       ifu_axi_wstrb;
   logic             ifu_axi_wlast;

   logic             ifu_axi_bvalid;
   logic             ifu_axi_bready;
   logic [1:0]       ifu_axi_bresp;
   logic [`RV_IFU_BUS_TAG-1:0]      ifu_axi_bid;

   // AXI Read Channels
   logic             ifu_axi_arvalid;
   logic             ifu_axi_arready;
   logic [`RV_IFU_BUS_TAG-1:0]      ifu_axi_arid;
   logic [31:0]      ifu_axi_araddr;
   logic [3:0]       ifu_axi_arregion;
   logic [7:0]       ifu_axi_arlen;
   logic [2:0]       ifu_axi_arsize;
   logic [1:0]       ifu_axi_arburst;
   logic             ifu_axi_arlock;
   logic [3:0]       ifu_axi_arcache;
   logic [2:0]       ifu_axi_arprot;
   logic [3:0]       ifu_axi_arqos;

   logic             ifu_axi_rvalid;
   logic             ifu_axi_rready;
   logic [`RV_IFU_BUS_TAG-1:0]      ifu_axi_rid;
   logic [63:0]      ifu_axi_rdata;
   logic [1:0]       ifu_axi_rresp;
   logic             ifu_axi_rlast;

   //-------------------------- SB AXI signals--------------------------
   // AXI Write Channels
   logic             sb_axi_awvalid;
   logic             sb_axi_awready;
   logic [`RV_SB_BUS_TAG-1:0]       sb_axi_awid;
   logic [31:0]      sb_axi_awaddr;
   logic [3:0]       sb_axi_awregion;
   logic [7:0]       sb_axi_awlen;
   logic [2:0]       sb_axi_awsize;
   logic [1:0]       sb_axi_awburst;
   logic             sb_axi_awlock;
   logic [3:0]       sb_axi_awcache;
   logic [2:0]       sb_axi_awprot;
   logic [3:0]       sb_axi_awqos;

   logic             sb_axi_wvalid;
   logic             sb_axi_wready;
   logic [63:0]      sb_axi_wdata;
   logic [7:0]       sb_axi_wstrb;
   logic             sb_axi_wlast;

   logic             sb_axi_bvalid;
   logic             sb_axi_bready;
   logic [1:0]       sb_axi_bresp;
   logic [`RV_SB_BUS_TAG-1:0]       sb_axi_bid;

   // AXI Read Channels
   logic             sb_axi_arvalid;
   logic             sb_axi_arready;
   logic [`RV_SB_BUS_TAG-1:0]       sb_axi_arid;
   logic [31:0]      sb_axi_araddr;
   logic [3:0]       sb_axi_arregion;
   logic [7:0]       sb_axi_arlen;
   logic [2:0]       sb_axi_arsize;
   logic [1:0]       sb_axi_arburst;
   logic             sb_axi_arlock;
   logic [3:0]       sb_axi_arcache;
   logic [2:0]       sb_axi_arprot;
   logic [3:0]       sb_axi_arqos;

   logic             sb_axi_rvalid;
   logic             sb_axi_rready;
   logic [`RV_SB_BUS_TAG-1:0]       sb_axi_rid;
   logic [63:0]      sb_axi_rdata;
   logic [1:0]       sb_axi_rresp;
   logic             sb_axi_rlast;

   //-------------------------- DMA AXI signals--------------------------
   // AXI Write Channels
   logic          dma_axi_awvalid;
   logic          dma_axi_awready;
   logic [`RV_DMA_BUS_TAG-1:0]   dma_axi_awid;
   logic [31:0]   dma_axi_awaddr;
   logic [2:0]    dma_axi_awsize;
   logic [2:0]    dma_axi_awprot;
   logic [7:0]    dma_axi_awlen;
   logic [1:0]    dma_axi_awburst;


   logic          dma_axi_wvalid;
   logic          dma_axi_wready;
   logic [63:0]   dma_axi_wdata;
   logic [7:0]    dma_axi_wstrb;
   logic          dma_axi_wlast;

   logic          dma_axi_bvalid;
   logic          dma_axi_bready;
   logic [1:0]    dma_axi_bresp;
   logic [`RV_DMA_BUS_TAG-1:0]   dma_axi_bid;

   // AXI Read Channels
   logic          dma_axi_arvalid;
   logic          dma_axi_arready;
   logic [`RV_DMA_BUS_TAG-1:0]   dma_axi_arid;
   logic [31:0]   dma_axi_araddr;
   logic [2:0]    dma_axi_arsize;
   logic [2:0]    dma_axi_arprot;
   logic [7:0]    dma_axi_arlen;
   logic [1:0]    dma_axi_arburst;

   logic          dma_axi_rvalid;
   logic          dma_axi_rready;
   logic [`RV_DMA_BUS_TAG-1:0]   dma_axi_rid;
   logic [63:0]   dma_axi_rdata;
   logic [1:0]    dma_axi_rresp;
   logic          dma_axi_rlast;

   // clk ratio signals
   logic        lsu_bus_clk_en; // Clock ratio b/w cpu core clk & AHB master interface
   logic        ifu_bus_clk_en; // Clock ratio b/w cpu core clk & AHB master interface
   logic        dbg_bus_clk_en; // Clock ratio b/w cpu core clk & AHB master interface
   logic        dma_bus_clk_en; // Clock ratio b/w cpu core clk & AHB slave interface


//   logic    ext_int;
   logic        timer_int;
   logic [`RV_PIC_TOTAL_INT:1] extintsrc_req;

   logic [1:0] dec_tlu_perfcnt0; // toggles when perf counter 0 has an event inc
   logic [1:0] dec_tlu_perfcnt1;
   logic [1:0] dec_tlu_perfcnt2;
   logic [1:0] dec_tlu_perfcnt3;

   // ports added by the soc team
   logic        jtag_tck; // JTAG clk
   logic        jtag_tms; // JTAG TMS
   logic        jtag_tdi; // JTAG tdi
   logic        jtag_trst_n; // JTAG Reset
   logic       jtag_tdo; // JTAG TDO
   // external MPC halt/run interface
   logic mpc_debug_halt_req; // Async halt request
   logic mpc_debug_run_req; // Async run request
   logic mpc_reset_run_req; // Run/halt after reset
   logic mpc_debug_halt_ack; // Halt ack
   logic mpc_debug_run_ack; // Run ack
   logic debug_brkpt_status; // debug breakpoint

   logic        i_cpu_halt_req; // Async halt req to CPU
   logic       o_cpu_halt_ack; // core response to halt
   logic       o_cpu_halt_status; // 1'b1 indicates core is halted
   logic       o_debug_mode_status; // Core to the PMU that core is in debug mode. When core is in debug mode; the PMU should refrain from sendng a halt or run request
   logic        i_cpu_run_req; // Async restart req to CPU
   logic       o_cpu_run_ack; // Core response to run req
   logic        scan_mode; // To enable scan mode
   logic        mbist_mode; // to enable mbist


   modport tb(
    input clk,
    output rst_l,
    output dbg_rst_l, 
    output rst_vec,
    output nmi_int,
    output nmi_vec,
    output jtag_id,

    input trace_rv_i_insn_ip,
    input trace_rv_i_address_ip,
    input trace_rv_i_valid_ip,
    input trace_rv_i_exception_ip,
    input trace_rv_i_ecause_ip,
    input trace_rv_i_interrupt_ip,
    input trace_rv_i_tval_ip,
    input lsu_axi_awvalid,
    output lsu_axi_awready,
    input lsu_axi_awid,
    input lsu_axi_awaddr,
    input lsu_axi_awregion,
    input lsu_axi_awlen,
    input lsu_axi_awsize,
    input lsu_axi_awburst,
    input lsu_axi_awlock,
    input lsu_axi_awcache,
    input lsu_axi_awprot,
    input lsu_axi_awqos,

    input lsu_axi_wvalid,
    output lsu_axi_wready,
    input lsu_axi_wdata,
    input lsu_axi_wstrb,
    input lsu_axi_wlast,

    output lsu_axi_bvalid,
    input lsu_axi_bready,
    output lsu_axi_bresp,
    output lsu_axi_bid,
    input lsu_axi_arvalid,
    output lsu_axi_arready,
    input lsu_axi_arid,
    input lsu_axi_araddr,
    input lsu_axi_arregion,
    input lsu_axi_arlen,
    input lsu_axi_arsize,
    input lsu_axi_arburst,
    input lsu_axi_arlock,
    input lsu_axi_arcache,
    input lsu_axi_arprot,
    input lsu_axi_arqos,

    output lsu_axi_rvalid,
    input lsu_axi_rready,
    output lsu_axi_rid,
    output lsu_axi_rdata,
    output lsu_axi_rresp,
    output lsu_axi_rlast,
    input ifu_axi_awvalid,
    output ifu_axi_awready,
    input ifu_axi_awid,
    input ifu_axi_awaddr,
    input ifu_axi_awregion,
    input ifu_axi_awlen,
    input ifu_axi_awsize,
    input ifu_axi_awburst,
    input ifu_axi_awlock,
    input ifu_axi_awcache,
    input ifu_axi_awprot,
    input ifu_axi_awqos,

    input ifu_axi_wvalid,
    output ifu_axi_wready,
    input ifu_axi_wdata,
    input ifu_axi_wstrb,
    input ifu_axi_wlast,

    output ifu_axi_bvalid,
    input ifu_axi_bready,
    output ifu_axi_bresp,
    output ifu_axi_bid,
    input ifu_axi_arvalid,
    output ifu_axi_arready,
    input ifu_axi_arid,
    input ifu_axi_araddr,
    input ifu_axi_arregion,
    input ifu_axi_arlen,
    input ifu_axi_arsize,
    input ifu_axi_arburst,
    input ifu_axi_arlock,
    input ifu_axi_arcache,
    input ifu_axi_arprot,
    input ifu_axi_arqos,

    output ifu_axi_rvalid,
    input ifu_axi_rready,
    output ifu_axi_rid,
    output ifu_axi_rdata,
    output ifu_axi_rresp,
    output ifu_axi_rlast,
    input sb_axi_awvalid,
    output sb_axi_awready,
    input sb_axi_awid,
    input sb_axi_awaddr,
    input sb_axi_awregion,
    input sb_axi_awlen,
    input sb_axi_awsize,
    input sb_axi_awburst,
    input sb_axi_awlock,
    input sb_axi_awcache,
    input sb_axi_awprot,
    input sb_axi_awqos,

    input sb_axi_wvalid,
    output sb_axi_wready,
    input sb_axi_wdata,
    input sb_axi_wstrb,
    input sb_axi_wlast,

    output sb_axi_bvalid,
    input sb_axi_bready,
    output sb_axi_bresp,
    output sb_axi_bid,
    input  sb_axi_arvalid,
    output sb_axi_arready,
    input  sb_axi_arid,
    input  sb_axi_araddr,
    input  sb_axi_arregion,
    input  sb_axi_arlen,
    input  sb_axi_arsize,
    input  sb_axi_arburst,
    input  sb_axi_arlock,
    input  sb_axi_arcache,
    input  sb_axi_arprot,
    input  sb_axi_arqos,

    output sb_axi_rvalid,
    input  sb_axi_rready,
    output sb_axi_rid,
    output sb_axi_rdata,
    output sb_axi_rresp,
    output sb_axi_rlast,
    output dma_axi_awvalid,
    input  dma_axi_awready,
    output dma_axi_awid,
    output dma_axi_awaddr,
    output dma_axi_awsize,
    output dma_axi_awprot,
    output dma_axi_awlen,
    output dma_axi_awburst,

    output dma_axi_wvalid,
    input  dma_axi_wready,
    output dma_axi_wdata,
    output dma_axi_wstrb,
    output dma_axi_wlast,

    input  dma_axi_bvalid,
    output dma_axi_bready,
    input  dma_axi_bresp,
    input  dma_axi_bid,
    output dma_axi_arvalid,
    input  dma_axi_arready,
    output dma_axi_arid,
    output dma_axi_araddr,
    output dma_axi_arsize,
    output dma_axi_arprot,
    output dma_axi_arlen,
    output dma_axi_arburst,

    input  dma_axi_rvalid,
    output dma_axi_rready,
    input  dma_axi_rid,
    input  dma_axi_rdata,
    input  dma_axi_rresp,
    input  dma_axi_rlast,
    input lsu_bus_clk_en,
    input ifu_bus_clk_en,
    input dbg_bus_clk_en,
    input dma_bus_clk_en,

    output timer_int,
    output extintsrc_req,

    input dec_tlu_perfcnt0,
    input dec_tlu_perfcnt1,
    input dec_tlu_perfcnt2,
    input dec_tlu_perfcnt3,

    output jtag_tck,
    output jtag_tms,
    output jtag_tdi,
    output jtag_trst_n,
    input jtag_tdo,

    output mpc_debug_halt_req,
    output mpc_debug_run_req,
    output mpc_reset_run_req,
    input mpc_debug_halt_ack,
    input mpc_debug_run_ack,
    input debug_brkpt_status,

    output i_cpu_halt_req,
    input o_cpu_halt_ack,
    input o_cpu_halt_status,
    input o_debug_mode_status,
    output i_cpu_run_req,
    input o_cpu_run_ack,
    output scan_mode,
    output mbist_mode
   );


    
endinterface //veer_if
 
 