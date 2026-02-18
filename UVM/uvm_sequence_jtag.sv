/*sequences files*/
package veer_sequence_jtag_pkg;
//importing packages and macros files
    import uvm_pkg::*;
    `include "uvm_macros.svh"
    import veer_sequence_item_pkg::*;
    //high tms sequence
    class htms_sequence extends uvm_sequence #(veer_sequence_item);
        `uvm_object_utils (htms_sequence)
        veer_sequence_item seq_item;

        function new(string name = "htms_sequence");
            super.new(name);
        endfunction

        task body();
            seq_item = veer_sequence_item::type_id::create("seq_item");
            start_item(seq_item);
            seq_item.constraint_mode(0);
            seq_item.high_tms_j.constraint_mode(1);
            assert(seq_item.randomize());
            finish_item(seq_item);
        endtask
    endclass

    //low tms sequence
    class ltms_sequence extends uvm_sequence #(veer_sequence_item);
        `uvm_object_utils (ltms_sequence)
        veer_sequence_item seq_item;

        function new(string name = "ltms_sequence");
            super.new(name);
        endfunction

        task body();
            seq_item = veer_sequence_item::type_id::create("seq_item");
            start_item(seq_item);
            seq_item.constraint_mode(0);
            seq_item.low_tms_j.constraint_mode(1);
            assert(seq_item.randomize());
            finish_item(seq_item);
        endtask
    endclass
endpackage