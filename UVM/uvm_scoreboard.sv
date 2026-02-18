 /*seq item class file*/
package veer_scoreboard_pkg;
//importing packages and macros files
    import uvm_pkg::*;
    `include "uvm_macros.svh"
    import veer_sequence_item_pkg::*;
    // import state_pkg::*;
    class veer_scoreboard extends uvm_scoreboard;
        `uvm_component_utils(veer_scoreboard)
        uvm_analysis_export #(veer_sequence_item) sb_export;
        uvm_tlm_analysis_fifo #(veer_sequence_item) sb_fifo;
        veer_sequence_item seq_item_sb;
        int rst_tests = 0;
        int run_tests = 0;
        int clock_cycles = 0;
        bit past_mpc_run, mpc_run, past_cpu_run, cpu_run;
        function new(string name = "veer_scoreboard" , uvm_component parent = null);
            super.new(name, parent);
        endfunction

        function void build_phase(uvm_phase phase);
            super.build_phase(phase);
            sb_export = new("sb_export" , this);
            sb_fifo = new("sb_fifo" , this);
        endfunction

        function void connect_phase(uvm_phase phase);
            super.connect_phase(phase);
            sb_export.connect(sb_fifo.analysis_export);
        endfunction

        task run_phase(uvm_phase phase);
            super.run_phase(phase);
            forever begin
                sb_fifo.get(seq_item_sb);
                //w84_resp;
                check_sig(seq_item_sb);
            end
        endtask

        task check_sig(input veer_sequence_item seq_item_chk);
        /************************************************************************************************************/
        //Reset STATE checking
            if(!seq_item_chk.rst_l) begin
                 //for designs with un-immediate reset
                //trace port reset
                if(seq_item_chk.trace_rv_i_valid_ip) begin
                    `uvm_error("run_phase", $sformatf("high trace_valid signal at time: %0t although core reset was active\n%0s", $time, seq_item_chk.convert2string()));
                    //$stop;
                end 
                else rst_tests++;
                //LSU axi interface reset
                if(seq_item_chk.lsu_axi_awvalid) begin
                    `uvm_error("run_phase", $sformatf("high LSU write address valid signal at time: %0t although core reset was active\n%0s", $time, seq_item_chk.convert2string()));
                    //$stop;              
                end 
                else rst_tests++;
                if(seq_item_chk.lsu_axi_wvalid) begin
                    `uvm_error("run_phase", $sformatf("high LSU write data valid signal at time: %0t although core reset was active\n%0s", $time, seq_item_chk.convert2string()));
                    //$stop;                     
                end 
                else rst_tests++;
                if(seq_item_chk.lsu_axi_bready) begin
                    `uvm_error("run_phase", $sformatf("high LSU ready for write_response signal at time: %0t although core reset was active\n%0s", $time, seq_item_chk.convert2string()));
                    //$stop; 
                end 
                else rst_tests++;
                if(seq_item_chk.lsu_axi_arvalid) begin
                    `uvm_error("run_phase", $sformatf("high LSU read address valid signal at time: %0t although core reset was active\n%0s", $time, seq_item_chk.convert2string()));
                    //$stop; 
                end 
                else rst_tests++;
                if(seq_item_chk.lsu_axi_rready) begin
                    `uvm_error("run_phase", $sformatf("high LSU ready for read data signal at time: %0t although core reset was active\n%0s", $time, seq_item_chk.convert2string()));
                    //$stop; 
                end 
                else rst_tests++;
                //IFU axi interface reset
                if(seq_item_chk.ifu_axi_awvalid) begin
                    `uvm_error("run_phase", $sformatf("high ifu write address valid signal at time: %0t although core reset was active\n%0s", $time, seq_item_chk.convert2string()));
                    //$stop;              
                end 
                else rst_tests++;
                if(seq_item_chk.ifu_axi_wvalid) begin
                    `uvm_error("run_phase", $sformatf("high ifu write data valid signal at time: %0t although core reset was active\n%0s", $time, seq_item_chk.convert2string()));
                    //$stop;                     
                end 
                else rst_tests++;
                if(seq_item_chk.ifu_axi_bready) begin
                    `uvm_error("run_phase", $sformatf("high ifu ready for write_response signal at time: %0t although core reset was active\n%0s", $time, seq_item_chk.convert2string()));
                    //$stop; 
                end 
                else rst_tests++;
                if(seq_item_chk.ifu_axi_arvalid) begin
                    `uvm_error("run_phase", $sformatf("high ifu read address valid signal at time: %0t although core reset was active\n%0s", $time, seq_item_chk.convert2string()));
                    //$stop; 
                end 
                else rst_tests++;
                if(seq_item_chk.ifu_axi_rready) begin
                    `uvm_error("run_phase", $sformatf("high ifu ready for read data signal at time: %0t although core reset was active\n%0s", $time, seq_item_chk.convert2string()));
                    //$stop; 
                end 
                else rst_tests++;
                //DBG axi interface reset
                if(seq_item_chk.sb_axi_awvalid) begin
                    `uvm_error("run_phase", $sformatf("high sb write address valid signal at time: %0t although core reset was active\n%0s", $time, seq_item_chk.convert2string()));
                    //$stop;              
                end 
                else rst_tests++;
                if(seq_item_chk.sb_axi_wvalid) begin
                    `uvm_error("run_phase", $sformatf("high sb write data valid signal at time: %0t although core reset was active\n%0s", $time, seq_item_chk.convert2string()));
                    //$stop;                     
                end 
                else rst_tests++;
                if(seq_item_chk.sb_axi_bready) begin
                    `uvm_error("run_phase", $sformatf("high sb ready for write_response signal at time: %0t although core reset was active\n%0s", $time, seq_item_chk.convert2string()));
                    //$stop; 
                end 
                else rst_tests++;
                if(seq_item_chk.sb_axi_arvalid) begin
                    `uvm_error("run_phase", $sformatf("high sb read address valid signal at time: %0t although core reset was active\n%0s", $time, seq_item_chk.convert2string()));
                    //$stop; 
                end 
                else rst_tests++;
                if(seq_item_chk.sb_axi_rready) begin
                    `uvm_error("run_phase", $sformatf("high sb ready for read data signal at time: %0t although core reset was active\n%0s", $time, seq_item_chk.convert2string()));
                    //$stop; 
                end 
                else rst_tests++;
                if(seq_item_chk.dma_axi_awready) begin
                    `uvm_error("run_phase", $sformatf("high dma ready for write address signal at time: %0t although core reset was active\n%0s", $time, seq_item_chk.convert2string()));
                    //$stop; 
                end 
                else rst_tests++;
                //DMA axi interface reset (SLave role)
                if(seq_item_chk.dma_axi_wready) begin
                    `uvm_error("run_phase", $sformatf("high dma ready for write data signal at time: %0t although core reset was active\n%0s", $time, seq_item_chk.convert2string()));
                    //$stop; 
                end 
                else rst_tests++;
                if(seq_item_chk.dma_axi_bvalid) begin
                    `uvm_error("run_phase", $sformatf("high dma valid for data received from the master signal at time: %0t although core reset was active\n%0s", $time, seq_item_chk.convert2string()));
                    //$stop; 
                end 
                else rst_tests++;
                if(seq_item_chk.dma_axi_arready) begin
                    `uvm_error("run_phase", $sformatf("high ready for read address signal at time: %0t although core reset was active\n%0s", $time, seq_item_chk.convert2string()));
                    //$stop; 
                end 
                else rst_tests++;
                if(seq_item_chk.dma_axi_rvalid) begin
                    `uvm_error("run_phase", $sformatf("high dma valid for data sent to the master signal at time: %0t although core reset was active\n%0s", $time, seq_item_chk.convert2string()));
                    //$stop; 
                end 
                else rst_tests++;
            end 
            //JTAG Reset checking
            if(!seq_item_chk.jtag_trst_n) begin
                
                if(seq_item_chk.jtag_tdo) begin
                    `uvm_error("run_phase", $sformatf("high jtag output at time: %0t although jtag reset was active\n%0s", $time, seq_item_chk.convert2string()));
                    //$stop;  
                end
                else rst_tests++;
            end
/*************************************************************************************************************************************/
        if(seq_item_chk.rst_l) begin
            //Halt State checking
            //MPC REstarting
            if(mpc_run) begin
                if(!seq_item_chk.mpc_debug_run_ack) begin
                        `uvm_error("run_phase", $sformatf("No sent MPC run acknowledgements at time: %0t although run request was sent\n%0s", $time, seq_item_chk.convert2string()));
                        //$stop; 
                end
                else run_tests++;
                mpc_run=0;
            end
            past_mpc_run=seq_item_chk.mpc_debug_run_req;
            if(seq_item_chk.mpc_debug_run_req&&!past_mpc_run) begin
                mpc_run=1;
                past_mpc_run=1;
            end

            //CPU Restarting
            if(cpu_run) begin
                if(!seq_item_chk.o_cpu_run_ack) begin
                        `uvm_error("run_phase", $sformatf("No sent cpu run acknowledgements at time: %0t although run request was sent\n%0s", $time, seq_item_chk.convert2string()));
                        //$stop; 
                end
                else run_tests++;
                cpu_run=0;
            end
            past_cpu_run=seq_item_chk.i_cpu_run_req;
            if(seq_item_chk.i_cpu_run_req&&!past_cpu_run) begin
                cpu_run=1;
                past_cpu_run=1;
            end
        end
        endtask
/*************************************************************************************************************************************************/
        // task w84_resp;//wait for response 
        //     if(clock_cycles==9)  
        //         clock_cycles=0;
        //     else
        //         clock_cycles++;
        // endtask
        function void report_phase(uvm_phase phase);
            super.report_phase(phase);
            `uvm_info("report_phase",$sformatf("Testbench passed successfully\nTotal passed tests for reset signals %0d\nTotal passed tests for the run case %0d", rst_tests, run_tests), UVM_MEDIUM);
        endfunction
    endclass

endpackage