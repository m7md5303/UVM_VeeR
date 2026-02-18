/*sequences files*/
package veer_sequence_gen_pkg;
//importing packages and macros files
    import uvm_pkg::*;
    `include "uvm_macros.svh"
    `include "state_pkg.sv"
    import veer_sequence_item_pkg::*;




    //valid transactions sequence dma
    class val_trans_sequence_dma extends uvm_sequence #(veer_sequence_item);
        `uvm_object_utils (val_trans_sequence_dma)
        veer_sequence_item seq_item;

        function new(string name = "val_trans_sequence_dma");
            super.new(name);
        endfunction

        task body();
            seq_item = veer_sequence_item::type_id::create("seq_item");
            repeat(50) begin
                start_item(seq_item);
                `NOR_OP
                seq_item.wr_valid_dma.constraint_mode(1);
                seq_item.good_last_dma.constraint_mode(1); 
                seq_item.ready_master.constraint_mode(1);
                seq_item.valid_rd_addr.constraint_mode(1);
                seq_item.ready_rd_data.constraint_mode(1);
                seq_item.normal_clk.constraint_mode(1);
                assert(seq_item.randomize());
                `NOR_OP_SIG
                finish_item(seq_item);
            end
        endtask
    endclass




    //valid transactions sequence lsu
    class val_trans_sequence_lsu extends uvm_sequence #(veer_sequence_item);
        `uvm_object_utils (val_trans_sequence_lsu)
        veer_sequence_item seq_item;

        function new(string name = "val_trans_sequence_lsu");
            super.new(name);
        endfunction

        task body();
            seq_item = veer_sequence_item::type_id::create("seq_item");
            repeat(50) begin
                start_item(seq_item);
                `NOR_OP
                seq_item.crr_rec_wr_lsu.constraint_mode(1);
                seq_item.crr_rec_rd_lsu.constraint_mode(1);
                seq_item.valid_rd_lsu.constraint_mode(1);
                seq_item.normal_clk.constraint_mode(1);
                assert(seq_item.randomize());
                `NOR_OP_SIG
                finish_item(seq_item);
            end
        endtask
    endclass




    //valid transactions sequence dbg
    class val_trans_sequence_dbg extends uvm_sequence #(veer_sequence_item);
        `uvm_object_utils (val_trans_sequence_dbg)
        veer_sequence_item seq_item;

        function new(string name = "val_trans_sequence_dbg");
            super.new(name);
        endfunction

        task body();
            seq_item = veer_sequence_item::type_id::create("seq_item");
            repeat(50) begin
                start_item(seq_item);
                `NOR_OP
                seq_item.crr_rec_wr_dbg.constraint_mode(1);
                seq_item.crr_rec_rd_dbg.constraint_mode(1);
                seq_item.valid_rd_dbg.constraint_mode(1);
                seq_item.normal_clk.constraint_mode(1);
                assert(seq_item.randomize());
                `NOR_OP_SIG
                finish_item(seq_item);
            end
        endtask
    endclass


    //valid transactions sequence ifu
    class val_trans_sequence_ifu extends uvm_sequence #(veer_sequence_item);
        `uvm_object_utils (val_trans_sequence_ifu)
        veer_sequence_item seq_item;

        function new(string name = "val_trans_sequence_ifu");
            super.new(name);
        endfunction

        task body();
            seq_item = veer_sequence_item::type_id::create("seq_item");
            repeat(50) begin
                start_item(seq_item);
                `NOR_OP
                seq_item.crr_rec_wr_ifu.constraint_mode(1);
                seq_item.crr_rec_rd_ifu.constraint_mode(1);
                seq_item.valid_rd_ifu.constraint_mode(1);
                seq_item.normal_clk.constraint_mode(1);
                assert(seq_item.randomize());
                `NOR_OP_SIG
                finish_item(seq_item);
            end
        endtask
    endclass
    //general sequence
    class gen_sequence extends uvm_sequence #(veer_sequence_item);
        `uvm_object_utils (gen_sequence)
        veer_sequence_item seq_item;

        function new(string name = "gen_sequence");
            super.new(name);
        endfunction

        task body();
            seq_item = veer_sequence_item::type_id::create("seq_item");
            repeat(200) begin
                start_item(seq_item);
                seq_item.constraint_mode(0);
                seq_item.normal_clk.constraint_mode(1);
                assert(seq_item.randomize());
                finish_item(seq_item);
            end
        endtask
    endclass
endpackage