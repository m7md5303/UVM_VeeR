/*test class file*/
package veer_test_pkg;
//importing packages and macros files
    import uvm_pkg::*;
    `include "uvm_macros.svh"
    import veer_env_pkg::*;
    import veer_config_pkg::*;
    import veer_sequence_cs_pkg::*;
    import veer_sequence_dbg_pkg::*;
    import veer_sequence_dma_pkg::*;
    import veer_sequence_gen_pkg::*;
    import veer_sequence_halt_pkg::*;
    import veer_sequence_ifu_pkg::*;
    import veer_sequence_intr_pkg::*;
    import veer_sequence_jtag_pkg::*;
    import veer_sequence_lsu_pkg::*;
    import veer_sequence_rst_pkg::*;
    import veer_sequence_sw_pkg::*;
    import veer_agent_pkg::*;
    class veer_test extends uvm_test;
    //registering the class in the uvm factory
        `uvm_component_utils(veer_test)

        veer_env env_test;
        veer_config cfg_test;
        virtual veer_if vr_if_test;
        //defining instances for the test sequences
        stall_sequence st_seq;
        nostall_sequence nost_seq;
        unready_sequence_dbg unre_seq_dbg;
        ready_sequence_dbg re_seq_dbg;
        err_resp_sequence_dbg er_res_seq_dbg;
        crr_resp_sequence_dbg cr_res_seq_dbg;
        err_id_sequence_dbg er_id_seq_dbg;
        crr_id_sequence_dbg cr_id_seq_dbg;
        crr_rd_sequence_dbg cr_rd_seq_dbg;
        err_rd_sequence_dbg er_rd_seq_dbg;
        val_rd_sequence_dbg val_rd_seq_dbg;
        inval_rd_sequence_dbg inval_rd_seq_dbg;
        last_rep_sequence_dbg lst_rep_seq_dbg;
        unready_sequence_ifu unre_seq_ifu;
        ready_sequence_ifu re_seq_ifu;
        err_resp_sequence_ifu er_res_seq_ifu;
        crr_resp_sequence_ifu cr_res_seq_ifu;
        err_id_sequence_ifu er_id_seq_ifu;
        crr_id_sequence_ifu cr_id_seq_ifu;
        crr_rd_sequence_ifu cr_rd_seq_ifu;
        err_rd_sequence_ifu er_rd_seq_ifu;
        val_rd_sequence_ifu val_rd_seq_ifu;
        inval_rd_sequence_ifu inval_rd_seq_ifu;
        last_rep_sequence_ifu lst_rep_seq_ifu;
        unready_sequence_lsu unre_seq_lsu;
        ready_sequence_lsu re_seq_lsu;
        err_resp_sequence_lsu er_res_seq_lsu;
        crr_resp_sequence_lsu cr_res_seq_lsu;
        err_id_sequence_lsu er_id_seq_lsu;
        crr_id_sequence_lsu cr_id_seq_lsu;
        crr_rd_sequence_lsu cr_rd_seq_lsu;
        err_rd_sequence_lsu er_rd_seq_lsu;
        val_rd_sequence_lsu val_rd_seq_lsu;
        inval_rd_sequence_lsu inval_rd_seq_lsu;
        last_rep_sequence_lsu lst_rep_seq_lsu;
        val_wr_sequence_dma val_wr_seq_dma;
        inval_wr_sequence_dma inval_wr_seq_dma;
        mis_last_sequence_dma mis_lst_seq_dma;
        good_last_sequence_dma good_lst_seq_dma;
        unreadym_sequence_dma unrdym_seq_dma;
        readym_sequence_dma rdym_seq_dma;
        val_addr_sequence_dma vl_add_seq_dma;
        inval_addr_sequence_dma ivl_add_seq_dma;
        ready_data_sequence_dma rdy_dta_seq_dma;
        unready_data_sequence_dma urdy_dta_seq_dma;
        val_trans_sequence_dma val_tr_seq_dma;
        val_trans_sequence_ifu val_tr_seq_ifu;
        val_trans_sequence_dbg val_tr_seq_dbg;
        val_trans_sequence_lsu val_tr_seq_lsu;
        gen_sequence g_seq;
        halt_norm_sequence hl_nor_seq;
        halt_jit_sequence hl_jit_seq;
        halt_mpcnorm_sequence hl_mnor_seq;
        halt_mpcjit_sequence hl_mjit_seq;
        halt_mismpc_sequence hl_mbhv_seq;
        act_intr_sequence ac_int_seq;
        deact_intr_sequence dac_int_seq;
        jit_intr_sequence jt_int_seq;
        nact_intr_sequence nac_int_seq;
        ndeact_intr_sequence ndac_int_seq;
        njit_intr_sequence njt_int_seq;
        htms_sequence htm_seq;
        ltms_sequence ltm_seq;
        reset_sequence rst_seq;
        reset_rdc_sequence rst_rdc_seq;
        restart_t_sequence rst_t_seq;
        restart_x_sequence rst_x_seq;
        init_reset_sequence i_rst_seq;
        ////////////////////////////////////////////

        function new(string name = "veer_test", uvm_component parent = null);
            super.new(name, parent);
        endfunction

        function void build_phase(uvm_phase phase);
            super.build_phase(phase);
            //creation of the sub-classes registered in the uvm factory
            env_test = veer_env::type_id::create("env_test", this);
            cfg_test = veer_config::type_id::create("cfg_test" , this);
            st_seq        = stall_sequence::type_id::create("st_seq", this);
            nost_seq      = nostall_sequence::type_id::create("nost_seq", this);
            unre_seq_dbg  = unready_sequence_dbg::type_id::create("unre_seq_dbg", this);
            re_seq_dbg    = ready_sequence_dbg::type_id::create("re_seq_dbg", this);
            er_res_seq_dbg = err_resp_sequence_dbg::type_id::create("er_res_seq_dbg", this);
            cr_res_seq_dbg = crr_resp_sequence_dbg::type_id::create("cr_res_seq_dbg", this);
            er_id_seq_dbg  = err_id_sequence_dbg::type_id::create("er_id_seq_dbg", this);
            cr_id_seq_dbg  = crr_id_sequence_dbg::type_id::create("cr_id_seq_dbg", this);
            cr_rd_seq_dbg  = crr_rd_sequence_dbg::type_id::create("cr_rd_seq_dbg", this);
            er_rd_seq_dbg  = err_rd_sequence_dbg::type_id::create("er_rd_seq_dbg", this);
            val_rd_seq_dbg   = val_rd_sequence_dbg::type_id::create("val_rd_seq_dbg", this);
            inval_rd_seq_dbg = inval_rd_sequence_dbg::type_id::create("inval_rd_seq_dbg", this);
            lst_rep_seq_dbg  = last_rep_sequence_dbg::type_id::create("lst_rep_seq_dbg", this);
            unre_seq_ifu  = unready_sequence_ifu::type_id::create("unre_seq_ifu", this);
            re_seq_ifu    = ready_sequence_ifu::type_id::create("re_seq_ifu", this);
            er_res_seq_ifu = err_resp_sequence_ifu::type_id::create("er_res_seq_ifu", this);
            cr_res_seq_ifu = crr_resp_sequence_ifu::type_id::create("cr_res_seq_ifu", this);
            er_id_seq_ifu  = err_id_sequence_ifu::type_id::create("er_id_seq_ifu", this);
            cr_id_seq_ifu  = crr_id_sequence_ifu::type_id::create("cr_id_seq_ifu", this);
            cr_rd_seq_ifu  = crr_rd_sequence_ifu::type_id::create("cr_rd_seq_ifu", this);
            er_rd_seq_ifu  = err_rd_sequence_ifu::type_id::create("er_rd_seq_ifu", this);
            val_rd_seq_ifu     = val_rd_sequence_ifu::type_id::create("val_rd_seq_ifu", this);
            inval_rd_seq_ifu   = inval_rd_sequence_ifu::type_id::create("inval_rd_seq_ifu", this);
            lst_rep_seq_ifu    = last_rep_sequence_ifu::type_id::create("lst_rep_seq_ifu", this);
            unre_seq_lsu       = unready_sequence_lsu::type_id::create("unre_seq_lsu", this);
            re_seq_lsu         = ready_sequence_lsu::type_id::create("re_seq_lsu", this);
            er_res_seq_lsu     = err_resp_sequence_lsu::type_id::create("er_res_seq_lsu", this);
            cr_res_seq_lsu     = crr_resp_sequence_lsu::type_id::create("cr_res_seq_lsu", this);
            er_id_seq_lsu      = err_id_sequence_lsu::type_id::create("er_id_seq_lsu", this);
            cr_id_seq_lsu      = crr_id_sequence_lsu::type_id::create("cr_id_seq_lsu", this);
            cr_rd_seq_lsu      = crr_rd_sequence_lsu::type_id::create("cr_rd_seq_lsu", this);
            er_rd_seq_lsu      = err_rd_sequence_lsu::type_id::create("er_rd_seq_lsu", this);
            val_rd_seq_lsu     = val_rd_sequence_lsu::type_id::create("val_rd_seq_lsu", this);
            inval_rd_seq_lsu   = inval_rd_sequence_lsu::type_id::create("inval_rd_seq_lsu", this);
            lst_rep_seq_lsu    = last_rep_sequence_lsu::type_id::create("lst_rep_seq_lsu", this);
            val_wr_seq_dma     = val_wr_sequence_dma::type_id::create("val_wr_seq_dma", this);
            inval_wr_seq_dma   = inval_wr_sequence_dma::type_id::create("inval_wr_seq_dma", this);
            mis_lst_seq_dma    = mis_last_sequence_dma::type_id::create("mis_lst_seq_dma", this);
            good_lst_seq_dma   = good_last_sequence_dma::type_id::create("good_lst_seq_dma", this);
            unrdym_seq_dma     = unreadym_sequence_dma::type_id::create("unrdym_seq_dma", this);
            rdym_seq_dma       = readym_sequence_dma::type_id::create("rdym_seq_dma", this);
            vl_add_seq_dma     = val_addr_sequence_dma::type_id::create("vl_add_seq_dma", this);
            ivl_add_seq_dma    = inval_addr_sequence_dma::type_id::create("ivl_add_seq_dma", this);
            rdy_dta_seq_dma    = ready_data_sequence_dma::type_id::create("rdy_dta_seq_dma", this);
            urdy_dta_seq_dma   = unready_data_sequence_dma::type_id::create("urdy_dta_seq_dma", this);
            val_tr_seq_dma     = val_trans_sequence_dma::type_id::create("val_tr_seq_dma", this);
            val_tr_seq_ifu     = val_trans_sequence_ifu::type_id::create("val_tr_seq_ifu", this);
            val_tr_seq_dbg     = val_trans_sequence_dbg::type_id::create("val_tr_seq_dbg", this);
            val_tr_seq_lsu     = val_trans_sequence_lsu::type_id::create("val_tr_seq_lsu", this);
            g_seq              = gen_sequence::type_id::create("g_seq", this);
            hl_nor_seq   = halt_norm_sequence::type_id::create("hl_nor_seq", this);
            hl_jit_seq   = halt_jit_sequence::type_id::create("hl_jit_seq", this);
            hl_mnor_seq  = halt_mpcnorm_sequence::type_id::create("hl_mnor_seq", this);
            hl_mjit_seq  = halt_mpcjit_sequence::type_id::create("hl_mjit_seq", this);
            hl_mbhv_seq  = halt_mismpc_sequence::type_id::create("hl_mbhv_seq", this);
            ac_int_seq   = act_intr_sequence::type_id::create("ac_int_seq", this);
            dac_int_seq  = deact_intr_sequence::type_id::create("dac_int_seq", this);
            jt_int_seq   = jit_intr_sequence::type_id::create("jt_int_seq", this);
            nac_int_seq  = nact_intr_sequence::type_id::create("nac_int_seq", this);
            ndac_int_seq = ndeact_intr_sequence::type_id::create("ndac_int_seq", this);
            njt_int_seq  = njit_intr_sequence::type_id::create("njt_int_seq", this);
            htm_seq      = htms_sequence::type_id::create("htm_seq", this);
            ltm_seq      = ltms_sequence::type_id::create("ltm_seq", this);
            rst_seq      = reset_sequence::type_id::create("rst_seq", this);
            rst_rdc_seq  = reset_rdc_sequence::type_id::create("rst_rdc_seq", this);
            rst_t_seq    = restart_t_sequence::type_id::create("rst_t_seq", this);
            rst_x_seq    = restart_x_sequence::type_id::create("rst_x_seq", this);
            i_rst_seq    = init_reset_sequence::type_id::create("i_rst_seq", this);
            //retrieving the virtual interface from the database
            if(!uvm_config_db #(virtual veer_if)::get(this,"","VR_IF",cfg_test.vr_if_config))
                `uvm_fatal("build_phase","Test - Unable to get the virtual interface of the VeeR from the uvm_config_db")
                
            //storing the vif pointer in the cfg object
            uvm_config_db #(veer_config)::set(this,"*","TEST_CFG",cfg_test);
        endfunction

        task run_phase(uvm_phase phase);
            super.run_phase(phase);
            phase.raise_objection(this);
            `uvm_info("run_phase","Starting generating the test sequences...", UVM_LOW)
            repeat(10) begin
            `uvm_info("run_phase","Starting generating the REset test sequences...", UVM_LOW)
            repeat(10)
            i_rst_seq.start(env_test.agt_env.sqr_agent);
            repeat(20)
            rst_seq.start(env_test.agt_env.sqr_agent);
            repeat(30)
            rst_rdc_seq.start(env_test.agt_env.sqr_agent);
            repeat(25)
            rst_t_seq.start(env_test.agt_env.sqr_agent);
            repeat(25)
            rst_x_seq.start(env_test.agt_env.sqr_agent);
            `uvm_info("run_phase","Starting generating the CLock_enables testing sequences...", UVM_LOW)
            repeat(30)
            st_seq.start(env_test.agt_env.sqr_agent);
            repeat(100)
            nost_seq.start(env_test.agt_env.sqr_agent);
            `uvm_info("run_phase","Starting generating the DBG AXI Interface testing sequences...", UVM_LOW)
            repeat(50) begin
            unre_seq_dbg.start(env_test.agt_env.sqr_agent);
            re_seq_dbg.start(env_test.agt_env.sqr_agent);
            er_res_seq_dbg.start(env_test.agt_env.sqr_agent);
            cr_res_seq_dbg.start(env_test.agt_env.sqr_agent);
            er_id_seq_dbg.start(env_test.agt_env.sqr_agent);
            cr_id_seq_dbg.start(env_test.agt_env.sqr_agent);
            cr_rd_seq_dbg.start(env_test.agt_env.sqr_agent);
            er_rd_seq_dbg.start(env_test.agt_env.sqr_agent);
            val_rd_seq_dbg.start(env_test.agt_env.sqr_agent);
            inval_rd_seq_dbg.start(env_test.agt_env.sqr_agent);
            lst_rep_seq_dbg.start(env_test.agt_env.sqr_agent);
            end
            `uvm_info("run_phase","Starting generating the IFU AXI Interface testing sequences...", UVM_LOW)
            repeat(50) begin
            unre_seq_ifu.start(env_test.agt_env.sqr_agent);
            re_seq_ifu.start(env_test.agt_env.sqr_agent);
            er_res_seq_ifu.start(env_test.agt_env.sqr_agent);
            cr_res_seq_ifu.start(env_test.agt_env.sqr_agent);
            er_id_seq_ifu.start(env_test.agt_env.sqr_agent);
            cr_id_seq_ifu.start(env_test.agt_env.sqr_agent);
            cr_rd_seq_ifu.start(env_test.agt_env.sqr_agent);
            er_rd_seq_ifu.start(env_test.agt_env.sqr_agent);
            val_rd_seq_ifu.start(env_test.agt_env.sqr_agent);
            inval_rd_seq_ifu.start(env_test.agt_env.sqr_agent);
            lst_rep_seq_ifu.start(env_test.agt_env.sqr_agent);
            end
            `uvm_info("run_phase","Starting generating the LSU AXI Interface testing sequences...", UVM_LOW)
            repeat(50) begin
            unre_seq_lsu.start(env_test.agt_env.sqr_agent);
            re_seq_lsu.start(env_test.agt_env.sqr_agent);
            er_res_seq_lsu.start(env_test.agt_env.sqr_agent);
            cr_res_seq_lsu.start(env_test.agt_env.sqr_agent);
            er_id_seq_lsu.start(env_test.agt_env.sqr_agent);
            cr_id_seq_lsu.start(env_test.agt_env.sqr_agent);
            cr_rd_seq_lsu.start(env_test.agt_env.sqr_agent);
            er_rd_seq_lsu.start(env_test.agt_env.sqr_agent);
            val_rd_seq_lsu.start(env_test.agt_env.sqr_agent);
            inval_rd_seq_lsu.start(env_test.agt_env.sqr_agent);
            lst_rep_seq_lsu.start(env_test.agt_env.sqr_agent);
            end
            `uvm_info("run_phase","Starting generating the DMA AXI Interface testing sequences...", UVM_LOW)
            repeat(50) begin
            val_wr_seq_dma.start(env_test.agt_env.sqr_agent);
            inval_wr_seq_dma.start(env_test.agt_env.sqr_agent);
            mis_lst_seq_dma.start(env_test.agt_env.sqr_agent);
            good_lst_seq_dma.start(env_test.agt_env.sqr_agent);
            unrdym_seq_dma.start(env_test.agt_env.sqr_agent);
            rdym_seq_dma.start(env_test.agt_env.sqr_agent);
            vl_add_seq_dma.start(env_test.agt_env.sqr_agent);
            ivl_add_seq_dma.start(env_test.agt_env.sqr_agent);
            rdy_dta_seq_dma.start(env_test.agt_env.sqr_agent);
            urdy_dta_seq_dma.start(env_test.agt_env.sqr_agent);
            end
            `uvm_info("run_phase","Starting generating AXI sequences with high valid probability...", UVM_LOW)
            repeat(75) begin
            val_tr_seq_dma.start(env_test.agt_env.sqr_agent);
            val_tr_seq_ifu.start(env_test.agt_env.sqr_agent);
            val_tr_seq_dbg.start(env_test.agt_env.sqr_agent);
            val_tr_seq_lsu.start(env_test.agt_env.sqr_agent);
            end
            `uvm_info("run_phase","Starting Arbitrarily tests...", UVM_LOW)
            g_seq.start(env_test.agt_env.sqr_agent);
            `uvm_info("run_phase","Starting HAlt and REstart test...", UVM_LOW)
            repeat(30)
            hl_nor_seq.start(env_test.agt_env.sqr_agent);
            repeat(30)
            hl_jit_seq.start(env_test.agt_env.sqr_agent);
            repeat(30)
            hl_mnor_seq.start(env_test.agt_env.sqr_agent);
            repeat(70)
            hl_mjit_seq.start(env_test.agt_env.sqr_agent);
            repeat(30)
            hl_mbhv_seq.start(env_test.agt_env.sqr_agent);
            `uvm_info("run_phase","Starting Interrupt test...", UVM_LOW)
            repeat(35)
            ac_int_seq.start(env_test.agt_env.sqr_agent);
            repeat(35)
            dac_int_seq.start(env_test.agt_env.sqr_agent);
            repeat(35)
            jt_int_seq.start(env_test.agt_env.sqr_agent);
            repeat(35)
            nac_int_seq.start(env_test.agt_env.sqr_agent);
            repeat(35)
            ndac_int_seq.start(env_test.agt_env.sqr_agent);
            repeat(70)
            njt_int_seq.start(env_test.agt_env.sqr_agent);
            `uvm_info("run_phase","Starting JTAG test...", UVM_LOW)
            repeat(250)
            htm_seq.start(env_test.agt_env.sqr_agent);
            repeat(25)
            ltm_seq.start(env_test.agt_env.sqr_agent);
            end
            `uvm_info("run_phase","Finished generating the test sequences...", UVM_LOW)
            phase.drop_objection(this);
        endtask
    endclass
endpackage
