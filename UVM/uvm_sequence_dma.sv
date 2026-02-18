/*sequences files*/
package veer_sequence_dma_pkg;
//importing packages and macros files
    import uvm_pkg::*;
    `include "uvm_macros.svh"
    `include "state_pkg.sv"
    import veer_sequence_item_pkg::*;
    //valid writes sequence
    class val_wr_sequence_dma extends uvm_sequence #(veer_sequence_item);
        `uvm_object_utils (val_wr_sequence_dma)
        veer_sequence_item seq_item;

        function new(string name = "val_wr_sequence_dma");
            super.new(name);
        endfunction

        task body();
            seq_item = veer_sequence_item::type_id::create("seq_item");
            start_item(seq_item);
            `NOR_OP
            seq_item.wr_valid_dma.constraint_mode(1);
            assert(seq_item.randomize());
            `NOR_OP_SIG
            `NOR_OP_SIG
            finish_item(seq_item);
        endtask
    endclass

    //invalid writes sequence
    class inval_wr_sequence_dma extends uvm_sequence #(veer_sequence_item);
        `uvm_object_utils (inval_wr_sequence_dma)
        veer_sequence_item seq_item;

        function new(string name = "inval_wr_sequence_dma");
            super.new(name);
        endfunction

        task body();
            seq_item = veer_sequence_item::type_id::create("seq_item");
            start_item(seq_item);
            `NOR_OP
            seq_item.wr_invalid_dma.constraint_mode(1);
            assert(seq_item.randomize());
            `NOR_OP_SIG
            finish_item(seq_item);
        endtask
    endclass

    //mis behaving last sequence
    class mis_last_sequence_dma extends uvm_sequence #(veer_sequence_item);
        `uvm_object_utils (mis_last_sequence_dma)
        veer_sequence_item seq_item;

        function new(string name = "mis_last_sequence_dma");
            super.new(name);
        endfunction

        task body();
            seq_item = veer_sequence_item::type_id::create("seq_item");
            start_item(seq_item);
            `NOR_OP
            seq_item.fault_last.constraint_mode(1);
            assert(seq_item.randomize());
            `NOR_OP_SIG
            finish_item(seq_item);
        endtask
    endclass

    //good behaving last sequence
    class good_last_sequence_dma extends uvm_sequence #(veer_sequence_item);
        `uvm_object_utils (good_last_sequence_dma)
        veer_sequence_item seq_item;

        function new(string name = "good_last_sequence_dma");
            super.new(name);
        endfunction

        task body();
            seq_item = veer_sequence_item::type_id::create("seq_item");
            start_item(seq_item);
            `NOR_OP
            seq_item.good_last_dma.constraint_mode(1);
            assert(seq_item.randomize());
            `NOR_OP_SIG
            finish_item(seq_item);
        endtask
    endclass

    //unreadymaster sequence
    class unreadym_sequence_dma extends uvm_sequence #(veer_sequence_item);
        `uvm_object_utils (unreadym_sequence_dma)
        veer_sequence_item seq_item;

        function new(string name = "unreadym_sequence_dma");
            super.new(name);
        endfunction

        task body();
            seq_item = veer_sequence_item::type_id::create("seq_item");
            start_item(seq_item);
            `NOR_OP
            seq_item.unready_master.constraint_mode(1);
            assert(seq_item.randomize());
            `NOR_OP_SIG
            finish_item(seq_item);
        endtask
    endclass

    //readymaster sequence
    class readym_sequence_dma extends uvm_sequence #(veer_sequence_item);
        `uvm_object_utils (readym_sequence_dma)
        veer_sequence_item seq_item;

        function new(string name = "readym_sequence_dma");
            super.new(name);
        endfunction

        task body();
            seq_item = veer_sequence_item::type_id::create("seq_item");
            start_item(seq_item);
            `NOR_OP
            seq_item.ready_master.constraint_mode(1);
            assert(seq_item.randomize());
            `NOR_OP_SIG
            finish_item(seq_item);
        endtask
    endclass

    //valid addr sequence
    class val_addr_sequence_dma extends uvm_sequence #(veer_sequence_item);
        `uvm_object_utils (val_addr_sequence_dma)
        veer_sequence_item seq_item;

        function new(string name = "val_addr_sequence_dma");
            super.new(name);
        endfunction

        task body();
            seq_item = veer_sequence_item::type_id::create("seq_item");
            start_item(seq_item);
            `NOR_OP
            seq_item.valid_rd_addr.constraint_mode(1);
            assert(seq_item.randomize());
            `NOR_OP_SIG
            finish_item(seq_item);
        endtask
    endclass

    //invalid addr sequence
    class inval_addr_sequence_dma extends uvm_sequence #(veer_sequence_item);
        `uvm_object_utils (inval_addr_sequence_dma)
        veer_sequence_item seq_item;

        function new(string name = "inval_addr_sequence_dma");
            super.new(name);
        endfunction

        task body();
            seq_item = veer_sequence_item::type_id::create("seq_item");
            start_item(seq_item);
            `NOR_OP
            seq_item.invalid_rd_addr.constraint_mode(1);
            assert(seq_item.randomize());
            `NOR_OP_SIG
            finish_item(seq_item);
        endtask
    endclass

    //ready for data sequence
    class ready_data_sequence_dma extends uvm_sequence #(veer_sequence_item);
        `uvm_object_utils (ready_data_sequence_dma)
        veer_sequence_item seq_item;

        function new(string name = "ready_data_sequence_dma");
            super.new(name);
        endfunction

        task body();
            seq_item = veer_sequence_item::type_id::create("seq_item");
            start_item(seq_item);
            `NOR_OP
            seq_item.ready_rd_data.constraint_mode(1);
            assert(seq_item.randomize());
            `NOR_OP_SIG
            finish_item(seq_item);
        endtask
    endclass

    //unready for data sequence
    class unready_data_sequence_dma extends uvm_sequence #(veer_sequence_item);
        `uvm_object_utils (unready_data_sequence_dma)
        veer_sequence_item seq_item;

        function new(string name = "unready_data_sequence_dma");
            super.new(name);
        endfunction

        task body();
            seq_item = veer_sequence_item::type_id::create("seq_item");
            start_item(seq_item);
            `NOR_OP
            seq_item.unready_rd_data.constraint_mode(1);
            assert(seq_item.randomize());
            `NOR_OP_SIG
            finish_item(seq_item);
        endtask
    endclass
endpackage