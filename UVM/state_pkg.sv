/*This package is intended to defineshared macris for handling the randomization mechanism based on the active test*/
    `define NOR_OP \
        seq_item.constraint_mode(0); \
        seq_item.c_reset.constraint_mode(1); \
        seq_item.normal_clk.constraint_mode(1); 
        // seq_item.c_reset_rdc.constraint_mode(0); \
        // seq_item.restart_x.constraint_mode(0); \
        // seq_item.halt_jit.constraint_mode(0); \
        // seq_item.halt_mpc_jit.constraint_mode(0); \
        // seq_item.mis_behav_halt_mpc.constraint_mode(0); \
        // seq_item.deact_ready_ifu.constraint_mode(0); \
        // seq_item.err_rec_wr_ifu.constraint_mode(0); \
        // seq_item.err_rec_rd_ifu.constraint_mode(0); \
        // seq_item.err_id_ifu.constraint_mode(0); \
        // seq_item.invalid_rd_ifu.constraint_mode(0); \
        // seq_item.deact_ready_lsu.constraint_mode(0); \
        // seq_item.err_rec_wr_lsu.constraint_mode(0); \
        // seq_item.err_rec_rd_lsu.constraint_mode(0); \
        // seq_item.err_id_lsu.constraint_mode(0); \
        // seq_item.invalid_rd_lsu.constraint_mode(0); \
        // seq_item.deact_ready_dbg.constraint_mode(0); \
        // seq_item.err_rec_wr_dbg.constraint_mode(0); \
        // seq_item.err_rec_rd_dbg.constraint_mode(0); \
        // seq_item.err_id_dbg.constraint_mode(0); \
        // seq_item.invalid_rd_dbg.constraint_mode(0); \
        // seq_item.wr_invalid_dma.constraint_mode(0); \
        // seq_item.fault_last.constraint_mode(0); \
        // seq_item.unready_master.constraint_mode(0); \
        // seq_item.invalid_rd_addr.constraint_mode(0); \
        // seq_item.unready_rd_data.constraint_mode(0); \
        // seq_item.intr_deact.constraint_mode(0); \
        // seq_item.intr_jit.constraint_mode(0); \
        // seq_item.nintr_deact.constraint_mode(0); \
        // seq_item.nintr_jit.constraint_mode(0); \
        // seq_item.low_tms_j.constraint_mode(0); 


    `define NOR_OP_SIG \
    seq_item.rst_l =1; seq_item.dbg_rst_l=1; seq_item.jtag_trst_n=1; seq_item.timer_int=0; seq_item.nmi_int=0; \
    seq_item.i_cpu_halt_req=0; seq_item.mpc_debug_halt_req=0;

    `define NOR_OP_SIG_H \
    seq_item.rst_l =1; seq_item.dbg_rst_l=1; seq_item.jtag_trst_n=1; seq_item.timer_int=0; seq_item.nmi_int=0;


    `define NOR_OP_SIG_I \
    seq_item.rst_l =1; seq_item.dbg_rst_l=1; seq_item.jtag_trst_n=1; seq_item.i_cpu_halt_req=0; seq_item.mpc_debug_halt_req=0;


    `define RST_OP \
        seq_item.constraint_mode(0); \
        seq_item.normal_clk.constraint_mode(1); 
        // seq_item.halt_jit.constraint_mode(0); \
        // seq_item.halt_mpc_jit.constraint_mode(0); \
        // seq_item.mis_behav_halt_mpc.constraint_mode(0); \
        // seq_item.deact_ready_ifu.constraint_mode(0); \
        // seq_item.err_rec_wr_ifu.constraint_mode(0); \
        // seq_item.err_rec_rd_ifu.constraint_mode(0); \
        // seq_item.err_id_ifu.constraint_mode(0); \
        // seq_item.invalid_rd_ifu.constraint_mode(0); \
        // seq_item.deact_ready_lsu.constraint_mode(0); \
        // seq_item.err_rec_wr_lsu.constraint_mode(0); \
        // seq_item.err_rec_rd_lsu.constraint_mode(0); \
        // seq_item.err_id_lsu.constraint_mode(0); \
        // seq_item.invalid_rd_lsu.constraint_mode(0); \
        // seq_item.deact_ready_dbg.constraint_mode(0); \
        // seq_item.err_rec_wr_dbg.constraint_mode(0); \
        // seq_item.err_rec_rd_dbg.constraint_mode(0); \
        // seq_item.err_id_dbg.constraint_mode(0); \
        // seq_item.invalid_rd_dbg.constraint_mode(0); \
        // seq_item.wr_invalid_dma.constraint_mode(0); \
        // seq_item.fault_last.constraint_mode(0); \
        // seq_item.unready_master.constraint_mode(0); \
        // seq_item.invalid_rd_addr.constraint_mode(0); \
        // seq_item.unready_rd_data.constraint_mode(0); \
        // seq_item.intr_deact.constraint_mode(0); \
        // seq_item.intr_jit.constraint_mode(0); \
        // seq_item.nintr_deact.constraint_mode(0); \
        // seq_item.nintr_jit.constraint_mode(0); \
        // seq_item.low_tms_j.constraint_mode(0); 
