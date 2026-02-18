/*driver class file*/
package veer_driver_pkg;
//importing packages and macros files
    import uvm_pkg::*;
    `include "uvm_macros.svh"
    import veer_sequence_item_pkg::*;

    class veer_driver extends uvm_driver #(veer_sequence_item);
    //registering the component in the uvm factory
        `uvm_component_utils(veer_driver)

        virtual veer_if vr_if_driver;
        veer_sequence_item seq_item_driver;
        //declaring a variable for counting tests; adding more observability
        int seqs_count = 0;

        function new(string name="veer_driver",uvm_component parent = null);
            super.new(name,parent);
        endfunction

        task run_phase(uvm_phase phase);
            super.run_phase(phase);
            forever begin
                seq_item_driver = veer_sequence_item::type_id::create("seq_item_driver");
                seq_item_port.get_next_item(seq_item_driver);
                seqs_count++;
                `uvm_info("run_phase",$sformatf("Starting Transaction number : %0d at simulation time : %0t",seqs_count,$time),UVM_HIGH);
                //Driving the Design inputs
                drive_in(seq_item_driver);
                //Retrieving the Design outputs
                drive_out(seq_item_driver);
                //Waiting for the next negative clock edge before starting a new transaction 
                @(negedge vr_if_driver.clk);
                seq_item_port.item_done();
                `uvm_info("run_phase",seq_item_driver.convert2string(),UVM_HIGH)
            end
        endtask

        function drive_in(veer_sequence_item seq_in);
                this.vr_if_driver.rst_l            = seq_in.rst_l;
                this.vr_if_driver.dbg_rst_l        = seq_in.dbg_rst_l;
                this.vr_if_driver.rst_vec          = seq_in.rst_vec;
                this.vr_if_driver.nmi_int          = seq_in.nmi_int;
                this.vr_if_driver.nmi_vec          = seq_in.nmi_vec;
                this.vr_if_driver.jtag_id          = seq_in.jtag_id;
                this.vr_if_driver.lsu_axi_awready  = seq_in.lsu_axi_awready;
                this.vr_if_driver.lsu_axi_wready   = seq_in.lsu_axi_wready;
                this.vr_if_driver.lsu_axi_bvalid   = seq_in.lsu_axi_bvalid;
                this.vr_if_driver.lsu_axi_bresp    = seq_in.lsu_axi_bresp;
                this.vr_if_driver.lsu_axi_bid      = seq_in.lsu_axi_bid;
                this.vr_if_driver.lsu_axi_arready  = seq_in.lsu_axi_arready;
                this.vr_if_driver.lsu_axi_rvalid   = seq_in.lsu_axi_rvalid;
                this.vr_if_driver.lsu_axi_rid      = seq_in.lsu_axi_rid;
                this.vr_if_driver.lsu_axi_rdata    = seq_in.lsu_axi_rdata;
                this.vr_if_driver.lsu_axi_rresp    = seq_in.lsu_axi_rresp;
                this.vr_if_driver.lsu_axi_rlast    = seq_in.lsu_axi_rlast;
                this.vr_if_driver.ifu_axi_awready  = seq_in.ifu_axi_awready;
                this.vr_if_driver.ifu_axi_wready   = seq_in.ifu_axi_wready;
                this.vr_if_driver.ifu_axi_bvalid   = seq_in.ifu_axi_bvalid;
                this.vr_if_driver.ifu_axi_bresp    = seq_in.ifu_axi_bresp;
                this.vr_if_driver.ifu_axi_bid      = seq_in.ifu_axi_bid;
                this.vr_if_driver.ifu_axi_arready  = seq_in.ifu_axi_arready;
                this.vr_if_driver.ifu_axi_rvalid   = seq_in.ifu_axi_rvalid;
                this.vr_if_driver.ifu_axi_rid      = seq_in.ifu_axi_rid;
                this.vr_if_driver.ifu_axi_rdata    = seq_in.ifu_axi_rdata;
                this.vr_if_driver.ifu_axi_rresp    = seq_in.ifu_axi_rresp;
                this.vr_if_driver.ifu_axi_rlast    = seq_in.ifu_axi_rlast;

                this.vr_if_driver.sb_axi_awready   = seq_in.sb_axi_awready;
                this.vr_if_driver.sb_axi_wready    = seq_in.sb_axi_wready;
                this.vr_if_driver.sb_axi_bvalid    = seq_in.sb_axi_bvalid;
                this.vr_if_driver.sb_axi_bresp     = seq_in.sb_axi_bresp;
                this.vr_if_driver.sb_axi_bid       = seq_in.sb_axi_bid;
                this.vr_if_driver.sb_axi_arready   = seq_in.sb_axi_arready;
                this.vr_if_driver.sb_axi_rvalid    = seq_in.sb_axi_rvalid;
                this.vr_if_driver.sb_axi_rid       = seq_in.sb_axi_rid;
                this.vr_if_driver.sb_axi_rdata     = seq_in.sb_axi_rdata;
                this.vr_if_driver.sb_axi_rresp     = seq_in.sb_axi_rresp;
                this.vr_if_driver.sb_axi_rlast     = seq_in.sb_axi_rlast;

                this.vr_if_driver.dma_axi_awvalid  = seq_in.dma_axi_awvalid;
                this.vr_if_driver.dma_axi_awid     = seq_in.dma_axi_awid;
                this.vr_if_driver.dma_axi_awaddr   = seq_in.dma_axi_awaddr;
                this.vr_if_driver.dma_axi_awsize   = seq_in.dma_axi_awsize;
                this.vr_if_driver.dma_axi_awprot   = seq_in.dma_axi_awprot;
                this.vr_if_driver.dma_axi_awlen    = seq_in.dma_axi_awlen;
                this.vr_if_driver.dma_axi_awburst  = seq_in.dma_axi_awburst;

                this.vr_if_driver.dma_axi_wvalid   = seq_in.dma_axi_wvalid;
                this.vr_if_driver.dma_axi_wdata    = seq_in.dma_axi_wdata;
                this.vr_if_driver.dma_axi_wstrb    = seq_in.dma_axi_wstrb;
                this.vr_if_driver.dma_axi_wlast    = seq_in.dma_axi_wlast;
                this.vr_if_driver.dma_axi_bready   = seq_in.dma_axi_bready;

                this.vr_if_driver.dma_axi_arvalid  = seq_in.dma_axi_arvalid;
                this.vr_if_driver.dma_axi_arid     = seq_in.dma_axi_arid;
                this.vr_if_driver.dma_axi_araddr   = seq_in.dma_axi_araddr;
                this.vr_if_driver.dma_axi_arsize   = seq_in.dma_axi_arsize;
                this.vr_if_driver.dma_axi_arprot   = seq_in.dma_axi_arprot;
                this.vr_if_driver.dma_axi_arlen    = seq_in.dma_axi_arlen;
                this.vr_if_driver.dma_axi_arburst  = seq_in.dma_axi_arburst;
                this.vr_if_driver.dma_axi_rready   = seq_in.dma_axi_rready;
                this.vr_if_driver.dma_axi_rid      = seq_in.dma_axi_rid;
                this.vr_if_driver.dma_axi_rdata    = seq_in.dma_axi_rdata;
                this.vr_if_driver.dma_axi_rresp    = seq_in.dma_axi_rresp;
                this.vr_if_driver.dma_axi_rlast    = seq_in.dma_axi_rlast;

   
                this.vr_if_driver.lsu_bus_clk_en  = seq_in.lsu_bus_clk_en; 
                this.vr_if_driver.ifu_bus_clk_en  = seq_in.ifu_bus_clk_en; 
                this.vr_if_driver.dbg_bus_clk_en  = seq_in.dbg_bus_clk_en; 
                this.vr_if_driver.dma_bus_clk_en  = seq_in.dma_bus_clk_en; 

                this.vr_if_driver.timer_int        = seq_in.timer_int;
                this.vr_if_driver.extintsrc_req    = seq_in.extintsrc_req;
                //this.vr_if_driver.jtag_tck         = seq_in.jtag_tck;
                this.vr_if_driver.jtag_tms         = seq_in.jtag_tms;
                this.vr_if_driver.jtag_tdi         = seq_in.jtag_tdi;
                this.vr_if_driver.jtag_trst_n      = seq_in.jtag_trst_n;
                this.vr_if_driver.mpc_debug_halt_req = seq_in.mpc_debug_halt_req;
                this.vr_if_driver.mpc_debug_run_req  = seq_in.mpc_debug_run_req;
                this.vr_if_driver.mpc_reset_run_req  = seq_in.mpc_reset_run_req;
                this.vr_if_driver.i_cpu_halt_req     = seq_in.i_cpu_halt_req;
                this.vr_if_driver.i_cpu_run_req      = seq_in.i_cpu_run_req;
                this.vr_if_driver.scan_mode          = seq_in.scan_mode;
                this.vr_if_driver.mbist_mode         = seq_in.mbist_mode;
        endfunction

        function drive_out(veer_sequence_item seq_out);
                seq_out.trace_rv_i_insn_ip = this.vr_if_driver.trace_rv_i_insn_ip;
                seq_out.trace_rv_i_address_ip = this.vr_if_driver.trace_rv_i_address_ip;
                seq_out.trace_rv_i_valid_ip = this.vr_if_driver.trace_rv_i_valid_ip;
                seq_out.trace_rv_i_exception_ip = this.vr_if_driver.trace_rv_i_exception_ip;
                seq_out.trace_rv_i_ecause_ip = this.vr_if_driver.trace_rv_i_ecause_ip;
                seq_out.trace_rv_i_interrupt_ip = this.vr_if_driver.trace_rv_i_interrupt_ip;
                seq_out.trace_rv_i_tval_ip = this.vr_if_driver.trace_rv_i_tval_ip;
                seq_out.lsu_axi_awvalid = this.vr_if_driver.lsu_axi_awvalid;
                seq_out.lsu_axi_awid = this.vr_if_driver.lsu_axi_awid;
                seq_out.lsu_axi_awaddr = this.vr_if_driver.lsu_axi_awaddr;
                seq_out.lsu_axi_awregion = this.vr_if_driver.lsu_axi_awregion;
                seq_out.lsu_axi_awlen = this.vr_if_driver.lsu_axi_awlen;
                seq_out.lsu_axi_awsize = this.vr_if_driver.lsu_axi_awsize;
                seq_out.lsu_axi_awburst = this.vr_if_driver.lsu_axi_awburst;
                seq_out.lsu_axi_awlock = this.vr_if_driver.lsu_axi_awlock;
                seq_out.lsu_axi_awcache = this.vr_if_driver.lsu_axi_awcache;
                seq_out.lsu_axi_awprot = this.vr_if_driver.lsu_axi_awprot;
                seq_out.lsu_axi_awqos = this.vr_if_driver.lsu_axi_awqos;
                seq_out.lsu_axi_wvalid = this.vr_if_driver.lsu_axi_wvalid;
                seq_out.lsu_axi_wdata = this.vr_if_driver.lsu_axi_wdata;
                seq_out.lsu_axi_wstrb = this.vr_if_driver.lsu_axi_wstrb;
                seq_out.lsu_axi_wlast = this.vr_if_driver.lsu_axi_wlast;
                seq_out.lsu_axi_bready = this.vr_if_driver.lsu_axi_bready;
                seq_out.lsu_axi_arvalid = this.vr_if_driver.lsu_axi_arvalid;
                seq_out.lsu_axi_arid = this.vr_if_driver.lsu_axi_arid;
                seq_out.lsu_axi_araddr = this.vr_if_driver.lsu_axi_araddr;
                seq_out.lsu_axi_arregion = this.vr_if_driver.lsu_axi_arregion;
                seq_out.lsu_axi_arlen = this.vr_if_driver.lsu_axi_arlen;
                seq_out.lsu_axi_arsize = this.vr_if_driver.lsu_axi_arsize;
                seq_out.lsu_axi_arburst = this.vr_if_driver.lsu_axi_arburst;
                seq_out.lsu_axi_arlock = this.vr_if_driver.lsu_axi_arlock;
                seq_out.lsu_axi_arcache = this.vr_if_driver.lsu_axi_arcache;
                seq_out.lsu_axi_arprot = this.vr_if_driver.lsu_axi_arprot;
                seq_out.lsu_axi_arqos = this.vr_if_driver.lsu_axi_arqos;
                seq_out.lsu_axi_rready = this.vr_if_driver.lsu_axi_rready;
                seq_out.ifu_axi_awvalid = this.vr_if_driver.ifu_axi_awvalid;
                seq_out.ifu_axi_awid = this.vr_if_driver.ifu_axi_awid;
                seq_out.ifu_axi_awaddr = this.vr_if_driver.ifu_axi_awaddr;
                seq_out.ifu_axi_awregion = this.vr_if_driver.ifu_axi_awregion;
                seq_out.ifu_axi_awlen = this.vr_if_driver.ifu_axi_awlen;
                seq_out.ifu_axi_awsize = this.vr_if_driver.ifu_axi_awsize;
                seq_out.ifu_axi_awburst = this.vr_if_driver.ifu_axi_awburst;
                seq_out.ifu_axi_awlock = this.vr_if_driver.ifu_axi_awlock;
                seq_out.ifu_axi_awcache = this.vr_if_driver.ifu_axi_awcache;
                seq_out.ifu_axi_awprot = this.vr_if_driver.ifu_axi_awprot;
                seq_out.ifu_axi_awqos = this.vr_if_driver.ifu_axi_awqos;
                seq_out.ifu_axi_wvalid = this.vr_if_driver.ifu_axi_wvalid;
                seq_out.ifu_axi_wdata = this.vr_if_driver.ifu_axi_wdata;
                seq_out.ifu_axi_wstrb = this.vr_if_driver.ifu_axi_wstrb;
                seq_out.ifu_axi_wlast = this.vr_if_driver.ifu_axi_wlast;
                seq_out.ifu_axi_bready = this.vr_if_driver.ifu_axi_bready;
                seq_out.ifu_axi_arvalid = this.vr_if_driver.ifu_axi_arvalid;
                seq_out.ifu_axi_arid = this.vr_if_driver.ifu_axi_arid;
                seq_out.ifu_axi_araddr = this.vr_if_driver.ifu_axi_araddr;
                seq_out.ifu_axi_arregion = this.vr_if_driver.ifu_axi_arregion;
                seq_out.ifu_axi_arlen = this.vr_if_driver.ifu_axi_arlen;
                seq_out.ifu_axi_arsize = this.vr_if_driver.ifu_axi_arsize;
                seq_out.ifu_axi_arburst = this.vr_if_driver.ifu_axi_arburst;
                seq_out.ifu_axi_arlock = this.vr_if_driver.ifu_axi_arlock;
                seq_out.ifu_axi_arcache = this.vr_if_driver.ifu_axi_arcache;
                seq_out.ifu_axi_arprot = this.vr_if_driver.ifu_axi_arprot;
                seq_out.ifu_axi_arqos = this.vr_if_driver.ifu_axi_arqos;
                seq_out.ifu_axi_rready = this.vr_if_driver.ifu_axi_rready;
                seq_out.sb_axi_awvalid = this.vr_if_driver.sb_axi_awvalid;
                seq_out.sb_axi_awid = this.vr_if_driver.sb_axi_awid;
                seq_out.sb_axi_awaddr = this.vr_if_driver.sb_axi_awaddr;
                seq_out.sb_axi_awregion = this.vr_if_driver.sb_axi_awregion;
                seq_out.sb_axi_awlen = this.vr_if_driver.sb_axi_awlen;
                seq_out.sb_axi_awsize = this.vr_if_driver.sb_axi_awsize;
                seq_out.sb_axi_awburst = this.vr_if_driver.sb_axi_awburst;
                seq_out.sb_axi_awlock = this.vr_if_driver.sb_axi_awlock;
                seq_out.sb_axi_awcache = this.vr_if_driver.sb_axi_awcache;
                seq_out.sb_axi_awprot = this.vr_if_driver.sb_axi_awprot;
                seq_out.sb_axi_awqos = this.vr_if_driver.sb_axi_awqos;
                seq_out.sb_axi_wvalid = this.vr_if_driver.sb_axi_wvalid;
                seq_out.sb_axi_wdata = this.vr_if_driver.sb_axi_wdata;
                seq_out.sb_axi_wstrb = this.vr_if_driver.sb_axi_wstrb;
                seq_out.sb_axi_wlast = this.vr_if_driver.sb_axi_wlast;
                seq_out.sb_axi_bready = this.vr_if_driver.sb_axi_bready;
                seq_out.sb_axi_arvalid = this.vr_if_driver.sb_axi_arvalid;
                seq_out.sb_axi_arid = this.vr_if_driver.sb_axi_arid;
                seq_out.sb_axi_araddr = this.vr_if_driver.sb_axi_araddr;
                seq_out.sb_axi_arregion = this.vr_if_driver.sb_axi_arregion;
                seq_out.sb_axi_arlen = this.vr_if_driver.sb_axi_arlen;
                seq_out.sb_axi_arsize = this.vr_if_driver.sb_axi_arsize;
                seq_out.sb_axi_arburst = this.vr_if_driver.sb_axi_arburst;
                seq_out.sb_axi_arlock = this.vr_if_driver.sb_axi_arlock;
                seq_out.sb_axi_arcache = this.vr_if_driver.sb_axi_arcache;
                seq_out.sb_axi_arprot = this.vr_if_driver.sb_axi_arprot;
                seq_out.sb_axi_arqos = this.vr_if_driver.sb_axi_arqos;
                seq_out.sb_axi_rready = this.vr_if_driver.sb_axi_rready;
                seq_out.dma_axi_awready = this.vr_if_driver.dma_axi_awready;
                seq_out.dma_axi_wready = this.vr_if_driver.dma_axi_wready;
                seq_out.dma_axi_bvalid = this.vr_if_driver.dma_axi_bvalid;
                seq_out.dma_axi_bresp = this.vr_if_driver.dma_axi_bresp;
                seq_out.dma_axi_bid = this.vr_if_driver.dma_axi_bid;
                seq_out.dma_axi_arready = this.vr_if_driver.dma_axi_arready;
                seq_out.dma_axi_rvalid = this.vr_if_driver.dma_axi_rvalid;
                seq_out.dma_axi_rid = this.vr_if_driver.dma_axi_rid;
                seq_out.dma_axi_rdata = this.vr_if_driver.dma_axi_rdata;
                seq_out.dma_axi_rresp = this.vr_if_driver.dma_axi_rresp;
                seq_out.dma_axi_rlast = this.vr_if_driver.dma_axi_rlast;
                seq_out.dec_tlu_perfcnt0 = this.vr_if_driver.dec_tlu_perfcnt0;
                seq_out.dec_tlu_perfcnt1 = this.vr_if_driver.dec_tlu_perfcnt1;
                seq_out.dec_tlu_perfcnt2 = this.vr_if_driver.dec_tlu_perfcnt2;
                seq_out.dec_tlu_perfcnt3 = this.vr_if_driver.dec_tlu_perfcnt3;
                seq_out.jtag_tdo = this.vr_if_driver.jtag_tdo;
                seq_out.mpc_debug_halt_ack = this.vr_if_driver.mpc_debug_halt_ack;
                seq_out.mpc_debug_run_ack = this.vr_if_driver.mpc_debug_run_ack;
                seq_out.debug_brkpt_status = this.vr_if_driver.debug_brkpt_status;
                seq_out.o_cpu_halt_ack = this.vr_if_driver.o_cpu_halt_ack;
                seq_out.o_cpu_halt_status = this.vr_if_driver.o_cpu_halt_status;
                seq_out.o_debug_mode_status = this.vr_if_driver.o_debug_mode_status;
                seq_out.o_cpu_run_ack = this.vr_if_driver.o_cpu_run_ack;
        endfunction
    endclass
    
endpackage