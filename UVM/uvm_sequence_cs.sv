/*sequences files*/
package veer_sequence_cs_pkg;
//importing packages and macros files
    `include "state_pkg.sv"
    import uvm_pkg::*;
    `include "uvm_macros.svh"
    import veer_sequence_item_pkg::*;
    //import state_pkg::*;
    //stall sequence
    class stall_sequence extends uvm_sequence #(veer_sequence_item);
        `uvm_object_utils (stall_sequence)
        veer_sequence_item seq_item;

        function new(string name = "stall_sequence");
            super.new(name);
        endfunction

        task body();
            seq_item = veer_sequence_item::type_id::create("seq_item");
            start_item(seq_item);
            `NOR_OP
            seq_item.stall_clk.constraint_mode(1);
            seq_item.normal_clk.constraint_mode(0);
            assert(seq_item.randomize());
            `NOR_OP_SIG
            finish_item(seq_item);
        endtask
    endclass

    //no stall sequence
    class nostall_sequence extends uvm_sequence #(veer_sequence_item);
        `uvm_object_utils (nostall_sequence)
        veer_sequence_item seq_item;

        function new(string name = "nostall_sequence");
            super.new(name);
        endfunction

        task body();
            seq_item = veer_sequence_item::type_id::create("seq_item");
            start_item(seq_item);
            `NOR_OP
            seq_item.normal_clk.constraint_mode(1);
            assert(seq_item.randomize());
            `NOR_OP_SIG
            finish_item(seq_item);
        endtask
    endclass 

endpackage




