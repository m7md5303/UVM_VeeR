/*testbench top module file*/
//importing essential packages and macros files
import uvm_pkg::*;
`include "uvm_macros.svh"
`include "common_defines.vh"
`include "pd_defines.vh"
import veer_test_pkg::*;

module top_uvm();
//generating clock. 2ns period 
    bit clk;
    initial begin
        forever begin
           #1; clk=~clk;
           vr_if.jtag_tck = clk;
           
        end
    end
//interface instance
    veer_if vr_if(clk);
//connecting the dut with the interface through instantiating by names (not by order to be more interpretable)
    veer_wrapper DUT(.clk(vr_if.clk),
                    .rst_l(vr_if.rst_l),
                    .dbg_rst_l(vr_if.dbg_rst_l),
                    .rst_vec(vr_if.rst_vec),
                    .nmi_int(vr_if.nmi_int),
                    .nmi_vec(vr_if.nmi_vec),
                    .jtag_id(vr_if.jtag_id),

                    .trace_rv_i_insn_ip(vr_if.trace_rv_i_insn_ip),
                    .trace_rv_i_address_ip(vr_if.trace_rv_i_address_ip),
                    .trace_rv_i_valid_ip(vr_if.trace_rv_i_valid_ip),
                    .trace_rv_i_exception_ip(vr_if.trace_rv_i_exception_ip),
                    .trace_rv_i_ecause_ip(vr_if.trace_rv_i_ecause_ip),
                    .trace_rv_i_interrupt_ip(vr_if.trace_rv_i_interrupt_ip),
                    .trace_rv_i_tval_ip(vr_if.trace_rv_i_tval_ip),
                    .lsu_axi_awvalid(vr_if.lsu_axi_awvalid),
                    .lsu_axi_awready(vr_if.lsu_axi_awready),
                    .lsu_axi_awid(vr_if.lsu_axi_awid),
                    .lsu_axi_awaddr(vr_if.lsu_axi_awaddr),
                    .lsu_axi_awregion(vr_if.lsu_axi_awregion),
                    .lsu_axi_awlen(vr_if.lsu_axi_awlen),
                    .lsu_axi_awsize(vr_if.lsu_axi_awsize),
                    .lsu_axi_awburst(vr_if.lsu_axi_awburst),
                    .lsu_axi_awlock(vr_if.lsu_axi_awlock),
                    .lsu_axi_awcache(vr_if.lsu_axi_awcache),
                    .lsu_axi_awprot(vr_if.lsu_axi_awprot),
                    .lsu_axi_awqos(vr_if.lsu_axi_awqos),

                    .lsu_axi_wvalid(vr_if.lsu_axi_wvalid),
                    .lsu_axi_wready(vr_if.lsu_axi_wready),
                    .lsu_axi_wdata(vr_if.lsu_axi_wdata),
                    .lsu_axi_wstrb(vr_if.lsu_axi_wstrb),
                    .lsu_axi_wlast(vr_if.lsu_axi_wlast),

                    .lsu_axi_bvalid(vr_if.lsu_axi_bvalid),
                    .lsu_axi_bready(vr_if.lsu_axi_bready),
                    .lsu_axi_bresp(vr_if.lsu_axi_bresp),
                    .lsu_axi_bid(vr_if.lsu_axi_bid),
                    .lsu_axi_arvalid(vr_if.lsu_axi_arvalid),
                    .lsu_axi_arready(vr_if.lsu_axi_arready),
                    .lsu_axi_arid(vr_if.lsu_axi_arid),
                    .lsu_axi_araddr(vr_if.lsu_axi_araddr),
                    .lsu_axi_arregion(vr_if.lsu_axi_arregion),
                    .lsu_axi_arlen(vr_if.lsu_axi_arlen),
                    .lsu_axi_arsize(vr_if.lsu_axi_arsize),
                    .lsu_axi_arburst(vr_if.lsu_axi_arburst),
                    .lsu_axi_arlock(vr_if.lsu_axi_arlock),
                    .lsu_axi_arcache(vr_if.lsu_axi_arcache),
                    .lsu_axi_arprot(vr_if.lsu_axi_arprot),
                    .lsu_axi_arqos(vr_if.lsu_axi_arqos),

                    .lsu_axi_rvalid(vr_if.lsu_axi_rvalid),
                    .lsu_axi_rready(vr_if.lsu_axi_rready),
                    .lsu_axi_rid(vr_if.lsu_axi_rid),
                    .lsu_axi_rdata(vr_if.lsu_axi_rdata),
                    .lsu_axi_rresp(vr_if.lsu_axi_rresp),
                    .lsu_axi_rlast(vr_if.lsu_axi_rlast),
                    .ifu_axi_awvalid(vr_if.ifu_axi_awvalid),
                    .ifu_axi_awready(vr_if.ifu_axi_awready),
                    .ifu_axi_awid(vr_if.ifu_axi_awid),
                    .ifu_axi_awaddr(vr_if.ifu_axi_awaddr),
                    .ifu_axi_awregion(vr_if.ifu_axi_awregion),
                    .ifu_axi_awlen(vr_if.ifu_axi_awlen),
                    .ifu_axi_awsize(vr_if.ifu_axi_awsize),
                    .ifu_axi_awburst(vr_if.ifu_axi_awburst),
                    .ifu_axi_awlock(vr_if.ifu_axi_awlock),
                    .ifu_axi_awcache(vr_if.ifu_axi_awcache),
                    .ifu_axi_awprot(vr_if.ifu_axi_awprot),
                    .ifu_axi_awqos(vr_if.ifu_axi_awqos),

                    .ifu_axi_wvalid(vr_if.ifu_axi_wvalid),
                    .ifu_axi_wready(vr_if.ifu_axi_wready),
                    .ifu_axi_wdata(vr_if.ifu_axi_wdata),
                    .ifu_axi_wstrb(vr_if.ifu_axi_wstrb),
                    .ifu_axi_wlast(vr_if.ifu_axi_wlast),

                    .ifu_axi_bvalid(vr_if.ifu_axi_bvalid),
                    .ifu_axi_bready(vr_if.ifu_axi_bready),
                    .ifu_axi_bresp(vr_if.ifu_axi_bresp),
                    .ifu_axi_bid(vr_if.ifu_axi_bid),
                    .ifu_axi_arvalid(vr_if.ifu_axi_arvalid),
                    .ifu_axi_arready(vr_if.ifu_axi_arready),
                    .ifu_axi_arid(vr_if.ifu_axi_arid),
                    .ifu_axi_araddr(vr_if.ifu_axi_araddr),
                    .ifu_axi_arregion(vr_if.ifu_axi_arregion),
                    .ifu_axi_arlen(vr_if.ifu_axi_arlen),
                    .ifu_axi_arsize(vr_if.ifu_axi_arsize),
                    .ifu_axi_arburst(vr_if.ifu_axi_arburst),
                    .ifu_axi_arlock(vr_if.ifu_axi_arlock),
                    .ifu_axi_arcache(vr_if.ifu_axi_arcache),
                    .ifu_axi_arprot(vr_if.ifu_axi_arprot),
                    .ifu_axi_arqos(vr_if.ifu_axi_arqos),

                    .ifu_axi_rvalid(vr_if.ifu_axi_rvalid),
                    .ifu_axi_rready(vr_if.ifu_axi_rready),
                    .ifu_axi_rid(vr_if.ifu_axi_rid),
                    .ifu_axi_rdata(vr_if.ifu_axi_rdata),
                    .ifu_axi_rresp(vr_if.ifu_axi_rresp),
                    .ifu_axi_rlast(vr_if.ifu_axi_rlast),
                    .sb_axi_awvalid(vr_if.sb_axi_awvalid),
                    .sb_axi_awready(vr_if.sb_axi_awready),
                    .sb_axi_awid(vr_if.sb_axi_awid),
                    .sb_axi_awaddr(vr_if.sb_axi_awaddr),
                    .sb_axi_awregion(vr_if.sb_axi_awregion),
                    .sb_axi_awlen(vr_if.sb_axi_awlen),
                    .sb_axi_awsize(vr_if.sb_axi_awsize),
                    .sb_axi_awburst(vr_if.sb_axi_awburst),
                    .sb_axi_awlock(vr_if.sb_axi_awlock),
                    .sb_axi_awcache(vr_if.sb_axi_awcache),
                    .sb_axi_awprot(vr_if.sb_axi_awprot),
                    .sb_axi_awqos(vr_if.sb_axi_awqos),

                    .sb_axi_wvalid(vr_if.sb_axi_wvalid),
                    .sb_axi_wready(vr_if.sb_axi_wready),
                    .sb_axi_wdata(vr_if.sb_axi_wdata),
                    .sb_axi_wstrb(vr_if.sb_axi_wstrb),
                    .sb_axi_wlast(vr_if.sb_axi_wlast),

                    .sb_axi_bvalid(vr_if.sb_axi_bvalid),
                    .sb_axi_bready(vr_if.sb_axi_bready),
                    .sb_axi_bresp(vr_if.sb_axi_bresp),
                    .sb_axi_bid(vr_if.sb_axi_bid),
                    .sb_axi_arvalid(vr_if.sb_axi_arvalid),
                    .sb_axi_arready(vr_if.sb_axi_arready),
                    .sb_axi_arid(vr_if.sb_axi_arid),
                    .sb_axi_araddr(vr_if.sb_axi_araddr),
                    .sb_axi_arregion(vr_if.sb_axi_arregion),
                    .sb_axi_arlen(vr_if.sb_axi_arlen),
                    .sb_axi_arsize(vr_if.sb_axi_arsize),
                    .sb_axi_arburst(vr_if.sb_axi_arburst),
                    .sb_axi_arlock(vr_if.sb_axi_arlock),
                    .sb_axi_arcache(vr_if.sb_axi_arcache),
                    .sb_axi_arprot(vr_if.sb_axi_arprot),
                    .sb_axi_arqos(vr_if.sb_axi_arqos),

                    .sb_axi_rvalid(vr_if.sb_axi_rvalid),
                    .sb_axi_rready(vr_if.sb_axi_rready),
                    .sb_axi_rid(vr_if.sb_axi_rid),
                    .sb_axi_rdata(vr_if.sb_axi_rdata),
                    .sb_axi_rresp(vr_if.sb_axi_rresp),
                    .sb_axi_rlast(vr_if.sb_axi_rlast),
                    .dma_axi_awvalid(vr_if.dma_axi_awvalid),
                    .dma_axi_awready(vr_if.dma_axi_awready),
                    .dma_axi_awid(vr_if.dma_axi_awid),
                    .dma_axi_awaddr(vr_if.dma_axi_awaddr),
                    .dma_axi_awsize(vr_if.dma_axi_awsize),
                    .dma_axi_awprot(vr_if.dma_axi_awprot),
                    .dma_axi_awlen(vr_if.dma_axi_awlen),
                    .dma_axi_awburst(vr_if.dma_axi_awburst),

                    .dma_axi_wvalid(vr_if.dma_axi_wvalid),
                    .dma_axi_wready(vr_if.dma_axi_wready),
                    .dma_axi_wdata(vr_if.dma_axi_wdata),
                    .dma_axi_wstrb(vr_if.dma_axi_wstrb),
                    .dma_axi_wlast(vr_if.dma_axi_wlast),

                    .dma_axi_bvalid(vr_if.dma_axi_bvalid),
                    .dma_axi_bready(vr_if.dma_axi_bready),
                    .dma_axi_bresp(vr_if.dma_axi_bresp),
                    .dma_axi_bid(vr_if.dma_axi_bid),
                    .dma_axi_arvalid(vr_if.dma_axi_arvalid),
                    .dma_axi_arready(vr_if.dma_axi_arready),
                    .dma_axi_arid(vr_if.dma_axi_arid),
                    .dma_axi_araddr(vr_if.dma_axi_araddr),
                    .dma_axi_arsize(vr_if.dma_axi_arsize),
                    .dma_axi_arprot(vr_if.dma_axi_arprot),
                    .dma_axi_arlen(vr_if.dma_axi_arlen),
                    .dma_axi_arburst(vr_if.dma_axi_arburst),

                    .dma_axi_rvalid(vr_if.dma_axi_rvalid),
                    .dma_axi_rready(vr_if.dma_axi_rready),
                    .dma_axi_rid(vr_if.dma_axi_rid),
                    .dma_axi_rdata(vr_if.dma_axi_rdata),
                    .dma_axi_rresp(vr_if.dma_axi_rresp),
                    .dma_axi_rlast(vr_if.dma_axi_rlast),
                    .lsu_bus_clk_en(vr_if.lsu_bus_clk_en),
                    .ifu_bus_clk_en(vr_if.ifu_bus_clk_en),
                    .dbg_bus_clk_en(vr_if.dbg_bus_clk_en),
                    .dma_bus_clk_en(vr_if.dma_bus_clk_en),

                    .timer_int(vr_if.timer_int),
                    .extintsrc_req(vr_if.extintsrc_req),

                    .dec_tlu_perfcnt0(vr_if.dec_tlu_perfcnt0),
                    .dec_tlu_perfcnt1(vr_if.dec_tlu_perfcnt1),
                    .dec_tlu_perfcnt2(vr_if.dec_tlu_perfcnt2),
                    .dec_tlu_perfcnt3(vr_if.dec_tlu_perfcnt3),

                    .jtag_tck(vr_if.jtag_tck),
                    .jtag_tms(vr_if.jtag_tms),
                    .jtag_tdi(vr_if.jtag_tdi),
                    .jtag_trst_n(vr_if.jtag_trst_n),
                    .jtag_tdo(vr_if.jtag_tdo),

                    .mpc_debug_halt_req(vr_if.mpc_debug_halt_req),
                    .mpc_debug_run_req(vr_if.mpc_debug_run_req),
                    .mpc_reset_run_req(vr_if.mpc_reset_run_req),
                    .mpc_debug_halt_ack(vr_if.mpc_debug_halt_ack),
                    .mpc_debug_run_ack(vr_if.mpc_debug_run_ack),
                    .debug_brkpt_status(vr_if.debug_brkpt_status),

                    .i_cpu_halt_req(vr_if.i_cpu_halt_req),
                    .o_cpu_halt_ack(vr_if.o_cpu_halt_ack),
                    .o_cpu_halt_status(vr_if.o_cpu_halt_status),
                    .o_debug_mode_status(vr_if.o_debug_mode_status),
                    .i_cpu_run_req(vr_if.i_cpu_run_req),
                    .o_cpu_run_ack(vr_if.o_cpu_run_ack),
                    .scan_mode(vr_if.scan_mode),
                    .mbist_mode(vr_if.mbist_mode)
);
//starting the uvm test and setting a virtual interface instance for the environment
    initial begin
        uvm_config_db #(virtual veer_if)::set(null,"uvm_test_top","VR_IF",vr_if);
        run_test("veer_test");
    end
endmodule