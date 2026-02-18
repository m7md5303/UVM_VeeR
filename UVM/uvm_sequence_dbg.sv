/*sequences files*/
package veer_sequence_dbg_pkg;
//importing packages and macros files
    import uvm_pkg::*;
    `include "uvm_macros.svh"
    `include "state_pkg.sv"
    import veer_sequence_item_pkg::*;
    //unready sequence
    class unready_sequence_dbg extends uvm_sequence #(veer_sequence_item);
        `uvm_object_utils (unready_sequence_dbg)
        veer_sequence_item seq_item;

        function new(string name = "unready_sequence_dbg");
            super.new(name);
        endfunction

        task body();
            seq_item = veer_sequence_item::type_id::create("seq_item");
            start_item(seq_item);
            `NOR_OP
            seq_item.deact_ready_dbg.constraint_mode(1);
            assert(seq_item.randomize());
            `NOR_OP_SIG
            finish_item(seq_item);
        endtask
    endclass

    //ready sequence
    class ready_sequence_dbg extends uvm_sequence #(veer_sequence_item);
        `uvm_object_utils (ready_sequence_dbg)
        veer_sequence_item seq_item;

        function new(string name = "ready_sequence_dbg");
            super.new(name);
        endfunction

        task body();
            seq_item = veer_sequence_item::type_id::create("seq_item");
            start_item(seq_item);
            `NOR_OP
            seq_item.act_ready_dbg.constraint_mode(1);
            assert(seq_item.randomize());
            `NOR_OP_SIG
            finish_item(seq_item);
        endtask
    endclass

    //err resp sequence
    class err_resp_sequence_dbg extends uvm_sequence #(veer_sequence_item);
        `uvm_object_utils (err_resp_sequence_dbg)
        veer_sequence_item seq_item;

        function new(string name = "err_resp_sequence_dbg");
            super.new(name);
        endfunction

        task body();
            seq_item = veer_sequence_item::type_id::create("seq_item");
            start_item(seq_item);
            `NOR_OP
            seq_item.err_rec_wr_dbg.constraint_mode(1);
            assert(seq_item.randomize());
            `NOR_OP_SIG
            finish_item(seq_item);
        endtask
    endclass

    //correct resp sequence
    class crr_resp_sequence_dbg extends uvm_sequence #(veer_sequence_item);
        `uvm_object_utils (crr_resp_sequence_dbg)
        veer_sequence_item seq_item;

        function new(string name = "crr_resp_sequence_dbg");
            super.new(name);
        endfunction

        task body();
            seq_item = veer_sequence_item::type_id::create("seq_item");
            start_item(seq_item);
            `NOR_OP
            seq_item.crr_rec_wr_dbg.constraint_mode(1);
            assert(seq_item.randomize());
            `NOR_OP_SIG
            finish_item(seq_item);
        endtask
    endclass

    //false id sequence
    class err_id_sequence_dbg extends uvm_sequence #(veer_sequence_item);
        `uvm_object_utils (err_id_sequence_dbg)
        veer_sequence_item seq_item;

        function new(string name = "err_id_sequence_dbg");
            super.new(name);
        endfunction

        task body();
            seq_item = veer_sequence_item::type_id::create("seq_item");
            start_item(seq_item);
            `NOR_OP
            seq_item.err_id_dbg.constraint_mode(1);
            assert(seq_item.randomize());
            `NOR_OP_SIG
            finish_item(seq_item);
        endtask
    endclass

    //correct id sequence
    class crr_id_sequence_dbg extends uvm_sequence #(veer_sequence_item);
        `uvm_object_utils (crr_id_sequence_dbg)
        veer_sequence_item seq_item;

        function new(string name = "crr_id_sequence_dbg");
            super.new(name);
        endfunction

        task body();
            seq_item = veer_sequence_item::type_id::create("seq_item");
            start_item(seq_item);
            `NOR_OP
            seq_item.crr_id_dbg.constraint_mode(1);
            assert(seq_item.randomize());
            `NOR_OP_SIG
            finish_item(seq_item);
        endtask
    endclass

    //correct resp read sequence
    class crr_rd_sequence_dbg extends uvm_sequence #(veer_sequence_item);
        `uvm_object_utils (crr_rd_sequence_dbg)
        veer_sequence_item seq_item;

        function new(string name = "crr_rd_sequence_dbg");
            super.new(name);
        endfunction

        task body();
            seq_item = veer_sequence_item::type_id::create("seq_item");
            start_item(seq_item);
            `NOR_OP
            seq_item.crr_rec_rd_dbg.constraint_mode(1);
            assert(seq_item.randomize());
            `NOR_OP_SIG
            finish_item(seq_item);
        endtask
    endclass

    //error resp read sequence
    class err_rd_sequence_dbg extends uvm_sequence #(veer_sequence_item);
        `uvm_object_utils (err_rd_sequence_dbg)
        veer_sequence_item seq_item;

        function new(string name = "err_rd_sequence_dbg");
            super.new(name);
        endfunction

        task body();
            seq_item = veer_sequence_item::type_id::create("seq_item");
            start_item(seq_item);
            `NOR_OP
            seq_item.err_rec_rd_dbg.constraint_mode(1);
            assert(seq_item.randomize());
            `NOR_OP_SIG
            finish_item(seq_item);
        endtask
    endclass

    //valid read sequence
    class val_rd_sequence_dbg extends uvm_sequence #(veer_sequence_item);
        `uvm_object_utils (val_rd_sequence_dbg)
        veer_sequence_item seq_item;

        function new(string name = "val_rd_sequence_dbg");
            super.new(name);
        endfunction

        task body();
            seq_item = veer_sequence_item::type_id::create("seq_item");
            start_item(seq_item);
            `NOR_OP
            seq_item.valid_rd_dbg.constraint_mode(1);
            assert(seq_item.randomize());
            `NOR_OP_SIG
            finish_item(seq_item);
        endtask
    endclass

    //invalid read sequence
    class inval_rd_sequence_dbg extends uvm_sequence #(veer_sequence_item);
        `uvm_object_utils (inval_rd_sequence_dbg)
        veer_sequence_item seq_item;

        function new(string name = "inval_rd_sequence_dbg");
            super.new(name);
        endfunction

        task body();
            seq_item = veer_sequence_item::type_id::create("seq_item");
            start_item(seq_item);
            `NOR_OP
            seq_item.invalid_rd_dbg.constraint_mode(1);
            assert(seq_item.randomize());
            `NOR_OP_SIG
            finish_item(seq_item);
        endtask
    endclass

    //last test sequence (rep->repititive)
    class last_rep_sequence_dbg extends uvm_sequence #(veer_sequence_item);
        `uvm_object_utils (last_rep_sequence_dbg)
        veer_sequence_item seq_item;

        function new(string name = "last_rep_sequence_dbg");
            super.new(name);
        endfunction

        task body();
            seq_item = veer_sequence_item::type_id::create("seq_item");
            start_item(seq_item);
            `NOR_OP
            seq_item.last_rd_dbg.constraint_mode(1);
            assert(seq_item.randomize());
            `NOR_OP_SIG
            finish_item(seq_item);
        endtask
    endclass


endpackage