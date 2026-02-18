/*monitor class file*/
package veer_monitor_pkg;
//importing packages and macros files
    import uvm_pkg::*;
    `include "uvm_macros.svh"
    import veer_sequence_item_pkg::*;
    class veer_monitor extends uvm_monitor;
    //registering the component in the uvm factory
        `uvm_component_utils(veer_monitor)
        virtual veer_if vr_if_monitor;
        veer_sequence_item seq_item_monitor;
        //instantiating analysis port for the monitor 
        uvm_analysis_port #(veer_sequence_item) mon_ap;
        //calling the constructor
        function new(string name = "veer_monitor", uvm_component parent=null);
            super.new(name,parent);
        endfunction

        function void build_phase(uvm_phase phase);
            super.build_phase(phase);
            mon_ap = new("mon_ap",this);
        endfunction : build_phase
        

        task run_phase(uvm_phase phase);
            super.run_phase(phase);
            forever begin
                seq_item_monitor = veer_sequence_item::type_id::create("seq_item_monitor");
                @(negedge vr_if_monitor.clk);
                //Retrieving the Design inputs
                seq_item_monitor.rst_l            = vr_if_monitor.rst_l;
                seq_item_monitor.dbg_rst_l        = vr_if_monitor.dbg_rst_l;
                seq_item_monitor.rst_vec          = vr_if_monitor.rst_vec;
                seq_item_monitor.nmi_int          = vr_if_monitor.nmi_int;
                seq_item_monitor.nmi_vec          = vr_if_monitor.nmi_vec;
                seq_item_monitor.jtag_id          = vr_if_monitor.jtag_id;
                seq_item_monitor.lsu_axi_awready  = vr_if_monitor.lsu_axi_awready;
                seq_item_monitor.lsu_axi_wready   = vr_if_monitor.lsu_axi_wready;
                seq_item_monitor.lsu_axi_bvalid   = vr_if_monitor.lsu_axi_bvalid;
                seq_item_monitor.lsu_axi_bresp    = vr_if_monitor.lsu_axi_bresp;
                seq_item_monitor.lsu_axi_bid      = vr_if_monitor.lsu_axi_bid;
                seq_item_monitor.lsu_axi_arready  = vr_if_monitor.lsu_axi_arready;
                seq_item_monitor.lsu_axi_rvalid   = vr_if_monitor.lsu_axi_rvalid;
                seq_item_monitor.lsu_axi_rid      = vr_if_monitor.lsu_axi_rid;
                seq_item_monitor.lsu_axi_rdata    = vr_if_monitor.lsu_axi_rdata;
                seq_item_monitor.lsu_axi_rresp    = vr_if_monitor.lsu_axi_rresp;
                seq_item_monitor.lsu_axi_rlast    = vr_if_monitor.lsu_axi_rlast;
                seq_item_monitor.ifu_axi_awready  = vr_if_monitor.ifu_axi_awready;
                seq_item_monitor.ifu_axi_wready   = vr_if_monitor.ifu_axi_wready;
                seq_item_monitor.ifu_axi_bvalid   = vr_if_monitor.ifu_axi_bvalid;
                seq_item_monitor.ifu_axi_bresp    = vr_if_monitor.ifu_axi_bresp;
                seq_item_monitor.ifu_axi_bid      = vr_if_monitor.ifu_axi_bid;
                seq_item_monitor.ifu_axi_arready  = vr_if_monitor.ifu_axi_arready;
                seq_item_monitor.ifu_axi_rvalid   = vr_if_monitor.ifu_axi_rvalid;
                seq_item_monitor.ifu_axi_rid      = vr_if_monitor.ifu_axi_rid;
                seq_item_monitor.ifu_axi_rdata    = vr_if_monitor.ifu_axi_rdata;
                seq_item_monitor.ifu_axi_rresp    = vr_if_monitor.ifu_axi_rresp;
                seq_item_monitor.ifu_axi_rlast    = vr_if_monitor.ifu_axi_rlast;

                seq_item_monitor.sb_axi_awready   = vr_if_monitor.sb_axi_awready;
                seq_item_monitor.sb_axi_wready    = vr_if_monitor.sb_axi_wready;
                seq_item_monitor.sb_axi_bvalid    = vr_if_monitor.sb_axi_bvalid;
                seq_item_monitor.sb_axi_bresp     = vr_if_monitor.sb_axi_bresp;
                seq_item_monitor.sb_axi_bid       = vr_if_monitor.sb_axi_bid;
                seq_item_monitor.sb_axi_arready   = vr_if_monitor.sb_axi_arready;
                seq_item_monitor.sb_axi_rvalid    = vr_if_monitor.sb_axi_rvalid;
                seq_item_monitor.sb_axi_rid       = vr_if_monitor.sb_axi_rid;
                seq_item_monitor.sb_axi_rdata     = vr_if_monitor.sb_axi_rdata;
                seq_item_monitor.sb_axi_rresp     = vr_if_monitor.sb_axi_rresp;
                seq_item_monitor.sb_axi_rlast     = vr_if_monitor.sb_axi_rlast;

                seq_item_monitor.dma_axi_awvalid  = vr_if_monitor.dma_axi_awvalid;
                seq_item_monitor.dma_axi_awid     = vr_if_monitor.dma_axi_awid;
                seq_item_monitor.dma_axi_awaddr   = vr_if_monitor.dma_axi_awaddr;
                seq_item_monitor.dma_axi_awsize   = vr_if_monitor.dma_axi_awsize;
                seq_item_monitor.dma_axi_awprot   = vr_if_monitor.dma_axi_awprot;
                seq_item_monitor.dma_axi_awlen    = vr_if_monitor.dma_axi_awlen;
                seq_item_monitor.dma_axi_awburst  = vr_if_monitor.dma_axi_awburst;

                seq_item_monitor.dma_axi_wvalid   = vr_if_monitor.dma_axi_wvalid;
                seq_item_monitor.dma_axi_wdata    = vr_if_monitor.dma_axi_wdata;
                seq_item_monitor.dma_axi_wstrb    = vr_if_monitor.dma_axi_wstrb;
                seq_item_monitor.dma_axi_wlast    = vr_if_monitor.dma_axi_wlast;
                seq_item_monitor.dma_axi_bready   = vr_if_monitor.dma_axi_bready;

                seq_item_monitor.dma_axi_arvalid  = vr_if_monitor.dma_axi_arvalid;
                seq_item_monitor.dma_axi_arid     = vr_if_monitor.dma_axi_arid;
                seq_item_monitor.dma_axi_araddr   = vr_if_monitor.dma_axi_araddr;
                seq_item_monitor.dma_axi_arsize   = vr_if_monitor.dma_axi_arsize;
                seq_item_monitor.dma_axi_arprot   = vr_if_monitor.dma_axi_arprot;
                seq_item_monitor.dma_axi_arlen    = vr_if_monitor.dma_axi_arlen;
                seq_item_monitor.dma_axi_arburst  = vr_if_monitor.dma_axi_arburst;
                seq_item_monitor.dma_axi_rready   = vr_if_monitor.dma_axi_rready;

                seq_item_monitor.timer_int        = vr_if_monitor.timer_int;
                seq_item_monitor.extintsrc_req    = vr_if_monitor.extintsrc_req;
                //seq_item_monitor.jtag_tck         = vr_if_monitor.jtag_tck;
                seq_item_monitor.jtag_tms         = vr_if_monitor.jtag_tms;
                seq_item_monitor.jtag_tdi         = vr_if_monitor.jtag_tdi;
                seq_item_monitor.jtag_trst_n      = vr_if_monitor.jtag_trst_n;

                seq_item_monitor.mpc_debug_halt_req = vr_if_monitor.mpc_debug_halt_req;
                seq_item_monitor.mpc_debug_run_req  = vr_if_monitor.mpc_debug_run_req;
                seq_item_monitor.mpc_reset_run_req  = vr_if_monitor.mpc_reset_run_req;
                seq_item_monitor.i_cpu_halt_req     = vr_if_monitor.i_cpu_halt_req;
                seq_item_monitor.i_cpu_run_req      = vr_if_monitor.i_cpu_run_req;
                seq_item_monitor.scan_mode          = vr_if_monitor.scan_mode;
                seq_item_monitor.mbist_mode         = vr_if_monitor.mbist_mode;
                //
                // 
                //Retrieving the Design outputs
                seq_item_monitor.trace_rv_i_insn_ip = vr_if_monitor.trace_rv_i_insn_ip;
                seq_item_monitor.trace_rv_i_address_ip = vr_if_monitor.trace_rv_i_address_ip;
                seq_item_monitor.trace_rv_i_valid_ip = vr_if_monitor.trace_rv_i_valid_ip;
                seq_item_monitor.trace_rv_i_exception_ip = vr_if_monitor.trace_rv_i_exception_ip;
                seq_item_monitor.trace_rv_i_ecause_ip = vr_if_monitor.trace_rv_i_ecause_ip;
                seq_item_monitor.trace_rv_i_interrupt_ip = vr_if_monitor.trace_rv_i_interrupt_ip;
                seq_item_monitor.trace_rv_i_tval_ip = vr_if_monitor.trace_rv_i_tval_ip;

                seq_item_monitor.lsu_axi_awvalid = vr_if_monitor.lsu_axi_awvalid;
                seq_item_monitor.lsu_axi_awid = vr_if_monitor.lsu_axi_awid;
                seq_item_monitor.lsu_axi_awaddr = vr_if_monitor.lsu_axi_awaddr;
                seq_item_monitor.lsu_axi_awregion = vr_if_monitor.lsu_axi_awregion;
                seq_item_monitor.lsu_axi_awlen = vr_if_monitor.lsu_axi_awlen;
                seq_item_monitor.lsu_axi_awsize = vr_if_monitor.lsu_axi_awsize;
                seq_item_monitor.lsu_axi_awburst = vr_if_monitor.lsu_axi_awburst;
                seq_item_monitor.lsu_axi_awlock = vr_if_monitor.lsu_axi_awlock;
                seq_item_monitor.lsu_axi_awcache = vr_if_monitor.lsu_axi_awcache;
                seq_item_monitor.lsu_axi_awprot = vr_if_monitor.lsu_axi_awprot;
                seq_item_monitor.lsu_axi_awqos = vr_if_monitor.lsu_axi_awqos;
                seq_item_monitor.lsu_axi_wvalid = vr_if_monitor.lsu_axi_wvalid;
                seq_item_monitor.lsu_axi_wdata = vr_if_monitor.lsu_axi_wdata;
                seq_item_monitor.lsu_axi_wstrb = vr_if_monitor.lsu_axi_wstrb;
                seq_item_monitor.lsu_axi_wlast = vr_if_monitor.lsu_axi_wlast;
                seq_item_monitor.lsu_axi_bready = vr_if_monitor.lsu_axi_bready;
                seq_item_monitor.lsu_axi_arvalid = vr_if_monitor.lsu_axi_arvalid;
                seq_item_monitor.lsu_axi_arid = vr_if_monitor.lsu_axi_arid;
                seq_item_monitor.lsu_axi_araddr = vr_if_monitor.lsu_axi_araddr;
                seq_item_monitor.lsu_axi_arregion = vr_if_monitor.lsu_axi_arregion;
                seq_item_monitor.lsu_axi_arlen = vr_if_monitor.lsu_axi_arlen;
                seq_item_monitor.lsu_axi_arsize = vr_if_monitor.lsu_axi_arsize;
                seq_item_monitor.lsu_axi_arburst = vr_if_monitor.lsu_axi_arburst;
                seq_item_monitor.lsu_axi_arlock = vr_if_monitor.lsu_axi_arlock;
                seq_item_monitor.lsu_axi_arcache = vr_if_monitor.lsu_axi_arcache;
                seq_item_monitor.lsu_axi_arprot = vr_if_monitor.lsu_axi_arprot;
                seq_item_monitor.lsu_axi_arqos = vr_if_monitor.lsu_axi_arqos;
                seq_item_monitor.lsu_axi_rready = vr_if_monitor.lsu_axi_rready;

                seq_item_monitor.ifu_axi_awvalid = vr_if_monitor.ifu_axi_awvalid;
                seq_item_monitor.ifu_axi_awid = vr_if_monitor.ifu_axi_awid;
                seq_item_monitor.ifu_axi_awaddr = vr_if_monitor.ifu_axi_awaddr;
                seq_item_monitor.ifu_axi_awregion = vr_if_monitor.ifu_axi_awregion;
                seq_item_monitor.ifu_axi_awlen = vr_if_monitor.ifu_axi_awlen;
                seq_item_monitor.ifu_axi_awsize = vr_if_monitor.ifu_axi_awsize;
                seq_item_monitor.ifu_axi_awburst = vr_if_monitor.ifu_axi_awburst;
                seq_item_monitor.ifu_axi_awlock = vr_if_monitor.ifu_axi_awlock;
                seq_item_monitor.ifu_axi_awcache = vr_if_monitor.ifu_axi_awcache;
                seq_item_monitor.ifu_axi_awprot = vr_if_monitor.ifu_axi_awprot;
                seq_item_monitor.ifu_axi_awqos = vr_if_monitor.ifu_axi_awqos;
                seq_item_monitor.ifu_axi_wvalid = vr_if_monitor.ifu_axi_wvalid;
                seq_item_monitor.ifu_axi_wdata = vr_if_monitor.ifu_axi_wdata;
                seq_item_monitor.ifu_axi_wstrb = vr_if_monitor.ifu_axi_wstrb;
                seq_item_monitor.ifu_axi_wlast = vr_if_monitor.ifu_axi_wlast;
                seq_item_monitor.ifu_axi_bready = vr_if_monitor.ifu_axi_bready;
                seq_item_monitor.ifu_axi_arvalid = vr_if_monitor.ifu_axi_arvalid;
                seq_item_monitor.ifu_axi_arid = vr_if_monitor.ifu_axi_arid;
                seq_item_monitor.ifu_axi_araddr = vr_if_monitor.ifu_axi_araddr;
                seq_item_monitor.ifu_axi_arregion = vr_if_monitor.ifu_axi_arregion;
                seq_item_monitor.ifu_axi_arlen = vr_if_monitor.ifu_axi_arlen;
                seq_item_monitor.ifu_axi_arsize = vr_if_monitor.ifu_axi_arsize;
                seq_item_monitor.ifu_axi_arburst = vr_if_monitor.ifu_axi_arburst;
                seq_item_monitor.ifu_axi_arlock = vr_if_monitor.ifu_axi_arlock;
                seq_item_monitor.ifu_axi_arcache = vr_if_monitor.ifu_axi_arcache;
                seq_item_monitor.ifu_axi_arprot = vr_if_monitor.ifu_axi_arprot;
                seq_item_monitor.ifu_axi_arqos = vr_if_monitor.ifu_axi_arqos;
                seq_item_monitor.ifu_axi_rready = vr_if_monitor.ifu_axi_rready;

                seq_item_monitor.sb_axi_awvalid = vr_if_monitor.sb_axi_awvalid;
                seq_item_monitor.sb_axi_awid = vr_if_monitor.sb_axi_awid;
                seq_item_monitor.sb_axi_awaddr = vr_if_monitor.sb_axi_awaddr;
                seq_item_monitor.sb_axi_awregion = vr_if_monitor.sb_axi_awregion;
                seq_item_monitor.sb_axi_awlen = vr_if_monitor.sb_axi_awlen;
                seq_item_monitor.sb_axi_awsize = vr_if_monitor.sb_axi_awsize;
                seq_item_monitor.sb_axi_awburst = vr_if_monitor.sb_axi_awburst;
                seq_item_monitor.sb_axi_awlock = vr_if_monitor.sb_axi_awlock;
                seq_item_monitor.sb_axi_awcache = vr_if_monitor.sb_axi_awcache;
                seq_item_monitor.sb_axi_awprot = vr_if_monitor.sb_axi_awprot;
                seq_item_monitor.sb_axi_awqos = vr_if_monitor.sb_axi_awqos;
                seq_item_monitor.sb_axi_wvalid = vr_if_monitor.sb_axi_wvalid;
                seq_item_monitor.sb_axi_wdata = vr_if_monitor.sb_axi_wdata;
                seq_item_monitor.sb_axi_wstrb = vr_if_monitor.sb_axi_wstrb;
                seq_item_monitor.sb_axi_wlast = vr_if_monitor.sb_axi_wlast;
                seq_item_monitor.sb_axi_bready = vr_if_monitor.sb_axi_bready;
                seq_item_monitor.sb_axi_arvalid = vr_if_monitor.sb_axi_arvalid;
                seq_item_monitor.sb_axi_arid = vr_if_monitor.sb_axi_arid;
                seq_item_monitor.sb_axi_araddr = vr_if_monitor.sb_axi_araddr;
                seq_item_monitor.sb_axi_arregion = vr_if_monitor.sb_axi_arregion;
                seq_item_monitor.sb_axi_arlen = vr_if_monitor.sb_axi_arlen;
                seq_item_monitor.sb_axi_arsize = vr_if_monitor.sb_axi_arsize;
                seq_item_monitor.sb_axi_arburst = vr_if_monitor.sb_axi_arburst;
                seq_item_monitor.sb_axi_arlock = vr_if_monitor.sb_axi_arlock;
                seq_item_monitor.sb_axi_arcache = vr_if_monitor.sb_axi_arcache;
                seq_item_monitor.sb_axi_arprot = vr_if_monitor.sb_axi_arprot;
                seq_item_monitor.sb_axi_arqos = vr_if_monitor.sb_axi_arqos;
                seq_item_monitor.sb_axi_rready = vr_if_monitor.sb_axi_rready;

                seq_item_monitor.dma_axi_awready = vr_if_monitor.dma_axi_awready;
                seq_item_monitor.dma_axi_wready = vr_if_monitor.dma_axi_wready;
                seq_item_monitor.dma_axi_bvalid = vr_if_monitor.dma_axi_bvalid;
                seq_item_monitor.dma_axi_bresp = vr_if_monitor.dma_axi_bresp;
                seq_item_monitor.dma_axi_bid = vr_if_monitor.dma_axi_bid;
                seq_item_monitor.dma_axi_arready = vr_if_monitor.dma_axi_arready;
                seq_item_monitor.dma_axi_rvalid = vr_if_monitor.dma_axi_rvalid;
                seq_item_monitor.dma_axi_rid = vr_if_monitor.dma_axi_rid;
                seq_item_monitor.dma_axi_rdata = vr_if_monitor.dma_axi_rdata;
                seq_item_monitor.dma_axi_rresp = vr_if_monitor.dma_axi_rresp;
                seq_item_monitor.dma_axi_rlast = vr_if_monitor.dma_axi_rlast;

                seq_item_monitor.lsu_bus_clk_en = vr_if_monitor.lsu_bus_clk_en;
                seq_item_monitor.ifu_bus_clk_en = vr_if_monitor.ifu_bus_clk_en;
                seq_item_monitor.dbg_bus_clk_en = vr_if_monitor.dbg_bus_clk_en;
                seq_item_monitor.dma_bus_clk_en = vr_if_monitor.dma_bus_clk_en;

                seq_item_monitor.dec_tlu_perfcnt0 = vr_if_monitor.dec_tlu_perfcnt0;
                seq_item_monitor.dec_tlu_perfcnt1 = vr_if_monitor.dec_tlu_perfcnt1;
                seq_item_monitor.dec_tlu_perfcnt2 = vr_if_monitor.dec_tlu_perfcnt2;
                seq_item_monitor.dec_tlu_perfcnt3 = vr_if_monitor.dec_tlu_perfcnt3;
                
                seq_item_monitor.jtag_tdo = vr_if_monitor.jtag_tdo;
                seq_item_monitor.mpc_debug_halt_ack = vr_if_monitor.mpc_debug_halt_ack;
                seq_item_monitor.mpc_debug_run_ack = vr_if_monitor.mpc_debug_run_ack;
                seq_item_monitor.debug_brkpt_status = vr_if_monitor.debug_brkpt_status;
                seq_item_monitor.o_cpu_halt_ack = vr_if_monitor.o_cpu_halt_ack;
                seq_item_monitor.o_cpu_halt_status = vr_if_monitor.o_cpu_halt_status;
                seq_item_monitor.o_debug_mode_status = vr_if_monitor.o_debug_mode_status;
                seq_item_monitor.o_cpu_run_ack = vr_if_monitor.o_cpu_run_ack;
                //broadcasting the results to the scoreboard and coverage collector
                mon_ap.write(seq_item_monitor);
                `uvm_info("run_Phase",seq_item_monitor.convert2string(),UVM_HIGH)
            end
        endtask

    endclass    
endpackage