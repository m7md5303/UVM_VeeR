 /*seq item class file*/
package veer_cvg_pkg;
//importing packages and macros files
    import uvm_pkg::*;
    `include "uvm_macros.svh"
    import veer_sequence_item_pkg::*;
    class veer_cvg extends uvm_component;
        `uvm_component_utils(veer_cvg)
        uvm_analysis_export #(veer_sequence_item) cov_export;
        uvm_tlm_analysis_fifo #(veer_sequence_item) cov_fifo;
        veer_sequence_item seq_item_cov;
        //Coverage groups
        covergroup nonaxi_points;//coverage inconsidering axi interfaces
            sys_rst: coverpoint seq_item_cov.rst_l{//main reset
            bins zeros={0};
            bins ones={1};
            }
            sb_rst: coverpoint seq_item_cov.dbg_rst_l{//debug reset
            bins zeros={0};
            bins ones={1};
            }
            jtag_rst: coverpoint seq_item_cov.jtag_trst_n{//jtag reset
            bins zeros={0};
            bins ones={1};
            }
            rsttt: cross sys_rst, sb_rst, jtag_rst{//crossing resets
                bins no_rst = (binsof(sys_rst.ones)&&binsof(sb_rst.ones)&&binsof(jtag_rst.ones));
                bins rst_test = !(binsof(sys_rst.ones)&&binsof(sb_rst.ones)&&binsof(jtag_rst.ones));
            }
            //halt and restart requests coverage points
            restart_cpu: coverpoint seq_item_cov.i_cpu_run_req;
            halt_cpu: coverpoint seq_item_cov.i_cpu_halt_req;
            halted_cpu: coverpoint seq_item_cov.o_cpu_halt_ack;
            norm_halt_status: coverpoint seq_item_cov.o_cpu_halt_status;
            fault_halt: cross restart_cpu, halt_cpu{
                bins opp_cmd = binsof(restart_cpu) intersect {1} && binsof(halt_cpu) intersect {1};
            }
            //microcontroller halt and restart requests coverage points
            mpc_restart_cpu: coverpoint seq_item_cov.mpc_debug_run_req;
            mpc_halt_cpu: coverpoint seq_item_cov.mpc_debug_halt_req;
            mpc_halted_cpu: coverpoint seq_item_cov.mpc_debug_halt_ack;
            mpc_restarted_cpu: coverpoint seq_item_cov.mpc_debug_run_ack;
            fault_mpc_halt: cross mpc_restart_cpu, mpc_halt_cpu{
                bins opp_cmd = binsof(mpc_restart_cpu) intersect {1} && binsof(mpc_halt_cpu) intersect {1};
            }
            //clock enables coverage points
            lsu_en: coverpoint seq_item_cov.lsu_bus_clk_en;
            ifu_en: coverpoint seq_item_cov.ifu_bus_clk_en; 
            sb_en: coverpoint seq_item_cov.dbg_bus_clk_en; 
            dma_en: coverpoint seq_item_cov.dma_bus_clk_en; 
            clk_ens_comb: cross lsu_en, ifu_en, sb_en, dma_en;
            //interrupts coverage points
            timer_int_cp: coverpoint seq_item_cov.timer_int;
            extintsrc_req_cp: coverpoint seq_item_cov.extintsrc_req;
            nmi_int_cp: coverpoint seq_item_cov.nmi_int;
            cross sys_rst, timer_int_cp, extintsrc_req_cp, nmi_int_cp{
                ignore_bins no_overlap = binsof(sys_rst.ones);
            }
            //jtag main signals coverage points
            tms_cp: coverpoint seq_item_cov.jtag_tms;
            tdi_cp: coverpoint seq_item_cov.jtag_tdi;
            tdo_cp: coverpoint seq_item_cov.jtag_tdo;
            jtag_cross_rst: cross jtag_rst, tms_cp, tdi_cp{
                ignore_bins rand_wz_rst = (binsof(jtag_rst.ones));
            }
        endgroup

        covergroup lsu_axi;//coverage group for the load/store unit axi interface
            awvalid_cp: coverpoint seq_item_cov.lsu_axi_awvalid;
            awready_cp: coverpoint seq_item_cov.lsu_axi_awready;
            awlen_cp: coverpoint seq_item_cov.lsu_axi_awlen;
            awsize_cp: coverpoint seq_item_cov.lsu_axi_awsize;
            write_addr_trans: cross awvalid_cp, awready_cp{
                bins compl_trans = binsof(awvalid_cp) intersect {1} && binsof(awready_cp) intersect {1};
            }
            wvalid_cp: coverpoint seq_item_cov.lsu_axi_wvalid;
            wready_cp: coverpoint seq_item_cov.lsu_axi_wready;
            wlast_cp: coverpoint seq_item_cov.lsu_axi_wlast;
            bresp_cp: coverpoint seq_item_cov.lsu_axi_bresp;
            bvalid_cp: coverpoint seq_item_cov.lsu_axi_bvalid;
            write_data_trans: cross wvalid_cp, wready_cp{
                bins compl_trans = binsof(wvalid_cp) intersect {1} && binsof(wready_cp) intersect {1};
            }
            last_wr_data: cross wvalid_cp, wlast_cp{
                bins last_beat = binsof(wvalid_cp) intersect {1} && binsof(wlast_cp) intersect {1};                
            }
            val_wr_resp: cross bresp_cp, bvalid_cp{
                bins ok_resp = binsof(bvalid_cp) intersect {1} && (binsof(bresp_cp) intersect {1} || binsof(bresp_cp) intersect {0});  
            }
            arvalid_cp: coverpoint seq_item_cov.lsu_axi_arvalid;
            arready_cp: coverpoint seq_item_cov.lsu_axi_arready;
            arlen_cp: coverpoint seq_item_cov.lsu_axi_arlen;
            arsize_cp: coverpoint seq_item_cov.lsu_axi_arsize;
            read_addr_trans: cross arvalid_cp, arready_cp{
                bins compl_trans = binsof(arvalid_cp) intersect {1} && binsof(arready_cp) intersect {1};
            }
            rvalid_cp: coverpoint seq_item_cov.lsu_axi_rvalid;
            rready_cp: coverpoint seq_item_cov.lsu_axi_rready;
            rlast_cp: coverpoint seq_item_cov.lsu_axi_rlast;
            rresp_cp: coverpoint seq_item_cov.lsu_axi_rresp;
            read_data_trans: cross rvalid_cp, rready_cp{
                bins compl_trans = binsof(rvalid_cp) intersect {1} && binsof(rready_cp) intersect {1};
            }
            last_rd_data: cross rvalid_cp, rlast_cp{
                bins last_beat = binsof(rvalid_cp) intersect {1} && binsof(rlast_cp) intersect {1};                
            }
            val_rd_resp: cross rresp_cp, rvalid_cp{
                bins ok_resp = binsof(rvalid_cp) intersect {1} && (binsof(rresp_cp) intersect {1} || binsof(rresp_cp) intersect {0});  
            }
        endgroup

        covergroup ifu_axi;//coverage group for the instruction fetch unit axi interface
            awvalid_cp: coverpoint seq_item_cov.ifu_axi_awvalid;
            awready_cp: coverpoint seq_item_cov.ifu_axi_awready;
            awlen_cp: coverpoint seq_item_cov.ifu_axi_awlen;
            awsize_cp: coverpoint seq_item_cov.ifu_axi_awsize;
            write_addr_trans: cross awvalid_cp, awready_cp{
                bins compl_trans = binsof(awvalid_cp) intersect {1} && binsof(awready_cp) intersect {1};
            }
            wvalid_cp: coverpoint seq_item_cov.ifu_axi_wvalid;
            wready_cp: coverpoint seq_item_cov.ifu_axi_wready;
            wlast_cp: coverpoint seq_item_cov.ifu_axi_wlast;
            bresp_cp: coverpoint seq_item_cov.ifu_axi_bresp;
            bvalid_cp: coverpoint seq_item_cov.ifu_axi_bvalid;
            write_data_trans: cross wvalid_cp, wready_cp{
                bins compl_trans = binsof(wvalid_cp) intersect {1} && binsof(wready_cp) intersect {1};
            }
            last_wr_data: cross wvalid_cp, wlast_cp{
                bins last_beat = binsof(wvalid_cp) intersect {1} && binsof(wlast_cp) intersect {1};                
            }
            val_wr_resp: cross bresp_cp, bvalid_cp{
                bins ok_resp = binsof(bvalid_cp) intersect {1} && (binsof(bresp_cp) intersect {1} || binsof(bresp_cp) intersect {0});  
            }
            arvalid_cp: coverpoint seq_item_cov.ifu_axi_arvalid;
            arready_cp: coverpoint seq_item_cov.ifu_axi_arready;
            arlen_cp: coverpoint seq_item_cov.ifu_axi_arlen;
            arsize_cp: coverpoint seq_item_cov.ifu_axi_arsize;
            read_addr_trans: cross arvalid_cp, arready_cp{
                bins compl_trans = binsof(arvalid_cp) intersect {1} && binsof(arready_cp) intersect {1};
            }
            rvalid_cp: coverpoint seq_item_cov.ifu_axi_rvalid;
            rready_cp: coverpoint seq_item_cov.ifu_axi_rready;
            rlast_cp: coverpoint seq_item_cov.ifu_axi_rlast;
            rresp_cp: coverpoint seq_item_cov.ifu_axi_rresp;
            read_data_trans: cross rvalid_cp, rready_cp{
                bins compl_trans = binsof(rvalid_cp) intersect {1} && binsof(rready_cp) intersect {1};
            }
            last_rd_data: cross rvalid_cp, rlast_cp{
                bins last_beat = binsof(rvalid_cp) intersect {1} && binsof(rlast_cp) intersect {1};                
            }
            val_rd_resp: cross rresp_cp, rvalid_cp{
                bins ok_resp = binsof(rvalid_cp) intersect {1} && (binsof(rresp_cp) intersect {1} || binsof(rresp_cp) intersect {0});  
            }
        endgroup



        covergroup sb_axi;//coverage group for the debug unit axi interface
            awvalid_cp: coverpoint seq_item_cov.sb_axi_awvalid;
            awready_cp: coverpoint seq_item_cov.sb_axi_awready;
            awlen_cp: coverpoint seq_item_cov.sb_axi_awlen;
            awsize_cp: coverpoint seq_item_cov.sb_axi_awsize;
            write_addr_trans: cross awvalid_cp, awready_cp{
                bins compl_trans = binsof(awvalid_cp) intersect {1} && binsof(awready_cp) intersect {1};
            }
            wvalid_cp: coverpoint seq_item_cov.sb_axi_wvalid;
            wready_cp: coverpoint seq_item_cov.sb_axi_wready;
            wlast_cp: coverpoint seq_item_cov.sb_axi_wlast;
            bresp_cp: coverpoint seq_item_cov.sb_axi_bresp;
            bvalid_cp: coverpoint seq_item_cov.sb_axi_bvalid;
            write_data_trans: cross wvalid_cp, wready_cp{
                bins compl_trans = binsof(wvalid_cp) intersect {1} && binsof(wready_cp) intersect {1};
            }
            last_wr_data: cross wvalid_cp, wlast_cp{
                bins last_beat = binsof(wvalid_cp) intersect {1} && binsof(wlast_cp) intersect {1};                
            }
            val_wr_resp: cross bresp_cp, bvalid_cp{
                bins ok_resp = binsof(bvalid_cp) intersect {1} && (binsof(bresp_cp) intersect {1} || binsof(bresp_cp) intersect {0});  
            }
            arvalid_cp: coverpoint seq_item_cov.sb_axi_arvalid;
            arready_cp: coverpoint seq_item_cov.sb_axi_arready;
            arlen_cp: coverpoint seq_item_cov.sb_axi_arlen;
            arsize_cp: coverpoint seq_item_cov.sb_axi_arsize;
            read_addr_trans: cross arvalid_cp, arready_cp{
                bins compl_trans = binsof(arvalid_cp) intersect {1} && binsof(arready_cp) intersect {1};
            }
            rvalid_cp: coverpoint seq_item_cov.sb_axi_rvalid;
            rready_cp: coverpoint seq_item_cov.sb_axi_rready;
            rlast_cp: coverpoint seq_item_cov.sb_axi_rlast;
            rresp_cp: coverpoint seq_item_cov.sb_axi_rresp;
            read_data_trans: cross rvalid_cp, rready_cp{
                bins compl_trans = binsof(rvalid_cp) intersect {1} && binsof(rready_cp) intersect {1};
            }
            last_rd_data: cross rvalid_cp, rlast_cp{
                bins last_beat = binsof(rvalid_cp) intersect {1} && binsof(rlast_cp) intersect {1};                
            }
            val_rd_resp: cross rresp_cp, rvalid_cp{
                bins ok_resp = binsof(rvalid_cp) intersect {1} && (binsof(rresp_cp) intersect {1} || binsof(rresp_cp) intersect {0});  
            }
        endgroup


        covergroup dma_axi;//coverage group for the DMA unit axi interface
            awvalid_cp: coverpoint seq_item_cov.dma_axi_awvalid;
            awready_cp: coverpoint seq_item_cov.dma_axi_awready;
            awlen_cp: coverpoint seq_item_cov.dma_axi_awlen;
            awsize_cp: coverpoint seq_item_cov.dma_axi_awsize;
            write_addr_trans: cross awvalid_cp, awready_cp{
                bins compl_trans = binsof(awvalid_cp) intersect {1} && binsof(awready_cp) intersect {1};
            }
            wvalid_cp: coverpoint seq_item_cov.dma_axi_wvalid;
            wready_cp: coverpoint seq_item_cov.dma_axi_wready;
            wlast_cp: coverpoint seq_item_cov.dma_axi_wlast;
            bresp_cp: coverpoint seq_item_cov.dma_axi_bresp;
            bvalid_cp: coverpoint seq_item_cov.dma_axi_bvalid;
            write_data_trans: cross wvalid_cp, wready_cp{
                bins compl_trans = binsof(wvalid_cp) intersect {1} && binsof(wready_cp) intersect {1};
            }
            last_wr_data: cross wvalid_cp, wlast_cp{
                bins last_beat = binsof(wvalid_cp) intersect {1} && binsof(wlast_cp) intersect {1};                
            }
            val_wr_resp: cross bresp_cp, bvalid_cp{
                bins ok_resp = binsof(bvalid_cp) intersect {1} && (binsof(bresp_cp) intersect {1} || binsof(bresp_cp) intersect {0});  
            }
            arvalid_cp: coverpoint seq_item_cov.dma_axi_arvalid;
            arready_cp: coverpoint seq_item_cov.dma_axi_arready;
            arlen_cp: coverpoint seq_item_cov.dma_axi_arlen;
            arsize_cp: coverpoint seq_item_cov.dma_axi_arsize;
            read_addr_trans: cross arvalid_cp, arready_cp{
                bins compl_trans = binsof(arvalid_cp) intersect {1} && binsof(arready_cp) intersect {1};
            }
            rvalid_cp: coverpoint seq_item_cov.dma_axi_rvalid;
            rready_cp: coverpoint seq_item_cov.dma_axi_rready;
            rlast_cp: coverpoint seq_item_cov.dma_axi_rlast;
            rresp_cp: coverpoint seq_item_cov.dma_axi_rresp;
            read_data_trans: cross rvalid_cp, rready_cp{
                bins compl_trans = binsof(rvalid_cp) intersect {1} && binsof(rready_cp) intersect {1};
            }
            last_rd_data: cross rvalid_cp, rlast_cp{
                bins last_beat = binsof(rvalid_cp) intersect {1} && binsof(rlast_cp) intersect {1};                
            }
            val_rd_resp: cross rresp_cp, rvalid_cp{
                bins ok_resp = binsof(rvalid_cp) intersect {1} && (binsof(rresp_cp) intersect {1} || binsof(rresp_cp) intersect {0});  
            }
        endgroup



        function new(string name="veer_cvg",uvm_component parent=null);
            super.new(name,parent);
            nonaxi_points = new();
            lsu_axi = new();
            ifu_axi = new();
            sb_axi = new();
            dma_axi = new();
        endfunction

        function void build_phase(uvm_phase phase);
            super.build_phase(phase);
            cov_export=new("cov_export",this);
            cov_fifo=new("cov_fifo",this);
        endfunction

        function void connect_phase(uvm_phase phase);
            super.connect_phase(phase);
            cov_export.connect(cov_fifo.analysis_export);
        endfunction

        task run_phase(uvm_phase phase);
            super.run_phase(phase);
            forever begin
                cov_fifo.get(seq_item_cov);
                nonaxi_points.sample();
                lsu_axi.sample();
                ifu_axi.sample();
                sb_axi.sample();
                dma_axi.sample();
            end
        endtask
    endclass
endpackage