        `define DEF_SIGS \
        rand logic        rst_l; \
        rand logic        dbg_rst_l; \
        rand logic [31:1] rst_vec; \
        rand logic        nmi_int; \
        rand logic [31:1] nmi_vec; \
        rand logic [31:1] jtag_id; \
        logic [63:0] trace_rv_i_insn_ip; \
        logic [63:0] trace_rv_i_address_ip; \
        logic [2:0]  trace_rv_i_valid_ip; \
        logic [2:0]  trace_rv_i_exception_ip; \
        logic [4:0]  trace_rv_i_ecause_ip; \
        logic [2:0]  trace_rv_i_interrupt_ip; \
        logic [31:0] trace_rv_i_tval_ip; \
        logic             lsu_axi_awvalid; \
        rand logic             lsu_axi_awready; \
        logic [`RV_LSU_BUS_TAG-1:0]      lsu_axi_awid; \
        logic [31:0]      lsu_axi_awaddr; \
        logic [3:0]       lsu_axi_awregion; \
        logic [7:0]       lsu_axi_awlen; \
        logic [2:0]       lsu_axi_awsize; \
        logic [1:0]       lsu_axi_awburst; \
        logic             lsu_axi_awlock; \
        logic [3:0]       lsu_axi_awcache; \
        logic [2:0]       lsu_axi_awprot; \
        logic [3:0]       lsu_axi_awqos; \
        logic             lsu_axi_wvalid; \
        rand logic             lsu_axi_wready; \
        logic [63:0]      lsu_axi_wdata; \
        logic [7:0]       lsu_axi_wstrb; \
        logic             lsu_axi_wlast; \
        rand logic             lsu_axi_bvalid; \
        logic             lsu_axi_bready; \
        rand logic [1:0]       lsu_axi_bresp; \
        rand bit[`RV_LSU_BUS_TAG-1:0]      lsu_axi_bid; \
        logic             lsu_axi_arvalid; \
        rand logic             lsu_axi_arready; \
        logic [`RV_LSU_BUS_TAG-1:0]      lsu_axi_arid; \
        logic [31:0]      lsu_axi_araddr; \
        logic [3:0]       lsu_axi_arregion; \
        logic [7:0]       lsu_axi_arlen; \
        logic [2:0]       lsu_axi_arsize; \
        logic [1:0]       lsu_axi_arburst; \
        logic             lsu_axi_arlock; \
        logic [3:0]       lsu_axi_arcache; \
        logic [2:0]       lsu_axi_arprot; \
        logic [3:0]       lsu_axi_arqos; \
        rand logic             lsu_axi_rvalid; \
        logic             lsu_axi_rready; \
        rand bit [`RV_LSU_BUS_TAG-1:0]      lsu_axi_rid; \
        rand logic [63:0]      lsu_axi_rdata; \
        rand logic [1:0]       lsu_axi_rresp; \
        rand logic             lsu_axi_rlast; \
        logic             ifu_axi_awvalid; \
        rand logic             ifu_axi_awready; \
        logic [`RV_IFU_BUS_TAG-1:0]      ifu_axi_awid; \
        logic [31:0]      ifu_axi_awaddr; \
        logic [3:0]       ifu_axi_awregion; \
        logic [7:0]       ifu_axi_awlen; \
        logic [2:0]       ifu_axi_awsize; \
        logic [1:0]       ifu_axi_awburst; \
        logic             ifu_axi_awlock; \
        logic [3:0]       ifu_axi_awcache; \
        logic [2:0]       ifu_axi_awprot; \
        logic [3:0]       ifu_axi_awqos; \
        logic             ifu_axi_wvalid; \
        rand logic             ifu_axi_wready; \
        logic [63:0]      ifu_axi_wdata; \
        logic [7:0]       ifu_axi_wstrb; \
        logic             ifu_axi_wlast; \
        rand logic             ifu_axi_bvalid; \
        logic             ifu_axi_bready; \
        rand logic [1:0]       ifu_axi_bresp; \
        rand bit [`RV_IFU_BUS_TAG-1:0]      ifu_axi_bid; \
        logic             ifu_axi_arvalid; \
        rand logic             ifu_axi_arready; \
        logic [`RV_IFU_BUS_TAG-1:0]      ifu_axi_arid; \
        logic [31:0]      ifu_axi_araddr; \
        logic [3:0]       ifu_axi_arregion; \
        logic [7:0]       ifu_axi_arlen; \
        logic [2:0]       ifu_axi_arsize; \
        logic [1:0]       ifu_axi_arburst; \
        logic             ifu_axi_arlock; \
        logic [3:0]       ifu_axi_arcache; \
        logic [2:0]       ifu_axi_arprot; \
        logic [3:0]       ifu_axi_arqos; \
        rand logic             ifu_axi_rvalid; \
        logic             ifu_axi_rready; \
        rand bit [`RV_IFU_BUS_TAG-1:0]      ifu_axi_rid; \
        rand logic [63:0]      ifu_axi_rdata; \
        rand logic [1:0]       ifu_axi_rresp; \
        rand logic             ifu_axi_rlast; \
        logic             sb_axi_awvalid; \
        rand logic             sb_axi_awready; \
        logic [`RV_SB_BUS_TAG-1:0]       sb_axi_awid; \
        logic [31:0]      sb_axi_awaddr; \
        logic [3:0]       sb_axi_awregion; \
        logic [7:0]       sb_axi_awlen; \
        logic [2:0]       sb_axi_awsize; \
        logic [1:0]       sb_axi_awburst; \
        logic             sb_axi_awlock; \
        logic [3:0]       sb_axi_awcache; \
        logic [2:0]       sb_axi_awprot; \
        logic [3:0]       sb_axi_awqos; \
        logic             sb_axi_wvalid; \
        rand logic             sb_axi_wready; \
        logic [63:0]      sb_axi_wdata; \
        logic [7:0]       sb_axi_wstrb; \
        logic             sb_axi_wlast; \
        rand logic             sb_axi_bvalid; \
        logic             sb_axi_bready; \
        rand logic [1:0]       sb_axi_bresp; \
        rand bit [`RV_SB_BUS_TAG-1:0]       sb_axi_bid; \
        logic             sb_axi_arvalid; \
        rand logic             sb_axi_arready; \
        logic [`RV_SB_BUS_TAG-1:0]       sb_axi_arid; \
        logic [31:0]      sb_axi_araddr; \
        logic [3:0]       sb_axi_arregion; \
        logic [7:0]       sb_axi_arlen; \
        logic [2:0]       sb_axi_arsize; \
        logic [1:0]       sb_axi_arburst; \
        logic             sb_axi_arlock; \
        logic [3:0]       sb_axi_arcache; \
        logic [2:0]       sb_axi_arprot; \
        logic [3:0]       sb_axi_arqos; \
        rand logic             sb_axi_rvalid; \
        logic             sb_axi_rready; \
        rand bit [`RV_SB_BUS_TAG-1:0]       sb_axi_rid; \
        rand logic [63:0]      sb_axi_rdata; \
        rand logic [1:0]       sb_axi_rresp; \
        rand logic             sb_axi_rlast; \
        rand logic          dma_axi_awvalid; \
        logic          dma_axi_awready; \
        rand logic [`RV_DMA_BUS_TAG-1:0]   dma_axi_awid; \
        rand logic [31:0]   dma_axi_awaddr; \
        rand logic [2:0]    dma_axi_awsize; \
        rand logic [2:0]    dma_axi_awprot; \
        rand logic [7:0]    dma_axi_awlen; \
        rand logic [1:0]    dma_axi_awburst; \
        rand logic          dma_axi_wvalid; \
        logic          dma_axi_wready; \
        rand logic [63:0]   dma_axi_wdata; \
        rand logic [7:0]    dma_axi_wstrb; \
        rand logic          dma_axi_wlast; \
        logic          dma_axi_bvalid; \
        rand logic          dma_axi_bready; \
        logic [1:0]    dma_axi_bresp; \
        logic [`RV_DMA_BUS_TAG-1:0]   dma_axi_bid; \
        rand logic          dma_axi_arvalid; \
        logic          dma_axi_arready; \
        rand logic [`RV_DMA_BUS_TAG-1:0]   dma_axi_arid; \
        rand logic [31:0]   dma_axi_araddr; \
        rand logic [2:0]    dma_axi_arsize; \
        rand logic [2:0]    dma_axi_arprot; \
        rand logic [7:0]    dma_axi_arlen; \
        rand logic [1:0]    dma_axi_arburst; \
        logic          dma_axi_rvalid; \
        rand logic          dma_axi_rready; \
        logic [`RV_DMA_BUS_TAG-1:0]   dma_axi_rid; \
        logic [63:0]   dma_axi_rdata; \
        logic [1:0]    dma_axi_rresp; \
        logic          dma_axi_rlast; \
        rand bit       lsu_bus_clk_en; \
        rand bit       ifu_bus_clk_en; \
        rand bit       dbg_bus_clk_en; \
        rand bit       dma_bus_clk_en; \
        rand logic        timer_int; \
        rand logic [`RV_PIC_TOTAL_INT:1] extintsrc_req; \
        logic [1:0] dec_tlu_perfcnt0; \
        logic [1:0] dec_tlu_perfcnt1; \
        logic [1:0] dec_tlu_perfcnt2; \
        logic [1:0] dec_tlu_perfcnt3; \
        rand logic        jtag_tms; \
        rand logic        jtag_tdi; \
        rand logic        jtag_trst_n; \
        logic       jtag_tdo; \
        rand logic mpc_debug_halt_req; \
        rand logic mpc_debug_run_req; \
        rand logic mpc_reset_run_req; \
        logic mpc_debug_halt_ack; \
        logic mpc_debug_run_ack; \
        logic debug_brkpt_status; \
        rand logic        i_cpu_halt_req; \
        logic       o_cpu_halt_ack; \
        logic       o_cpu_halt_status; \
        logic       o_debug_mode_status; \
        rand logic        i_cpu_run_req; \
        logic       o_cpu_run_ack; \
        logic        scan_mode =0; \
        logic        mbist_mode=0;
                         