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
                drive_in(seq_item_driver);//function for diriving the design. It can be divided into driving function for each interface for modularity (Future Work)
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

    endclass
    
endpackage