/*sequences files*/
package veer_sequence_rst_pkg;
//importing packages and macros files
    import uvm_pkg::*;
    `include "uvm_macros.svh"
    `include "state_pkg.sv"
    import veer_sequence_item_pkg::*;
    //reset sequence
    class reset_sequence extends uvm_sequence #(veer_sequence_item);
        `uvm_object_utils (reset_sequence)
        veer_sequence_item seq_item;

        function new(string name = "reset_sequence");
            super.new(name);
        endfunction

        task body();
            seq_item = veer_sequence_item::type_id::create("seq_item");
            start_item(seq_item);
            `RST_OP
            seq_item.c_reset.constraint_mode(1);
            assert(seq_item.randomize());
            finish_item(seq_item);
        endtask
    endclass

    //reset_rdc sequence
    class reset_rdc_sequence extends uvm_sequence #(veer_sequence_item);
        `uvm_object_utils (reset_rdc_sequence)
        veer_sequence_item seq_item;

        function new(string name = "reset_rdc_sequence");
            super.new(name);
        endfunction

        task body();
            seq_item = veer_sequence_item::type_id::create("seq_item");
            start_item(seq_item);
            `RST_OP
            seq_item.c_reset_rdc.constraint_mode(1);
            assert(seq_item.randomize());
            finish_item(seq_item);
        endtask
    endclass

    //restart_t sequence
    class restart_t_sequence extends uvm_sequence #(veer_sequence_item);
        `uvm_object_utils (restart_t_sequence)
        veer_sequence_item seq_item;

        function new(string name = "restart_t_sequence");
            super.new(name);
        endfunction

        task body();
            seq_item = veer_sequence_item::type_id::create("seq_item");
            start_item(seq_item);
            `RST_OP
            seq_item.restart_t.constraint_mode(1);
            seq_item.c_reset.constraint_mode(1);
            assert(seq_item.randomize());
            finish_item(seq_item);
        endtask
    endclass

    //restart_x sequence
    class restart_x_sequence extends uvm_sequence #(veer_sequence_item);
        `uvm_object_utils (restart_x_sequence)
        veer_sequence_item seq_item;

        function new(string name = "restart_x_sequence");
            super.new(name);
        endfunction

        task body();
            seq_item = veer_sequence_item::type_id::create("seq_item");
            start_item(seq_item);
            `RST_OP
            seq_item.restart_x.constraint_mode(1);
            seq_item.c_reset.constraint_mode(1);
            assert(seq_item.randomize());
            finish_item(seq_item);
        endtask
    endclass

    //init reset sequence
    class init_reset_sequence extends uvm_sequence #(veer_sequence_item);
        `uvm_object_utils (init_reset_sequence)
        veer_sequence_item seq_item;

        function new(string name = "init_ reset_sequence");
            super.new(name);
        endfunction

        task body();
            seq_item = veer_sequence_item::type_id::create("seq_item");
            start_item(seq_item);
            seq_item.constraint_mode(0);
            assert(seq_item.randomize());
            seq_item.rst_l=0;
            seq_item.dbg_rst_l=0;
            seq_item.jtag_trst_n=0;
            finish_item(seq_item);
        endtask
    endclass
endpackage