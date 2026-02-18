/*sequences files*/
package veer_sequence_intr_pkg;
//importing packages and macros files
    import uvm_pkg::*;
    `include "uvm_macros.svh"
    `include "state_pkg.sv"
    import veer_sequence_item_pkg::*;
    //active interrupt sequence
    class act_intr_sequence extends uvm_sequence #(veer_sequence_item);
        `uvm_object_utils (act_intr_sequence)
        veer_sequence_item seq_item;

        function new(string name = "act_intr_sequence");
            super.new(name);
        endfunction

        task body();
            seq_item = veer_sequence_item::type_id::create("seq_item");
            start_item(seq_item);
            `NOR_OP
            seq_item.intr_act.constraint_mode(1);
            assert(seq_item.randomize());
            `NOR_OP_SIG_I
            finish_item(seq_item);
        endtask
    endclass

    //inactive interrupt sequence
    class deact_intr_sequence extends uvm_sequence #(veer_sequence_item);
        `uvm_object_utils (deact_intr_sequence)
        veer_sequence_item seq_item;

        function new(string name = "deact_intr_sequence");
            super.new(name);
        endfunction

        task body();
            seq_item = veer_sequence_item::type_id::create("seq_item");
            start_item(seq_item);
            `NOR_OP
            seq_item.intr_deact.constraint_mode(1);
            assert(seq_item.randomize());
            `NOR_OP_SIG_I
            finish_item(seq_item);
        endtask
    endclass

    //jitter interrupt sequence
    class jit_intr_sequence extends uvm_sequence #(veer_sequence_item);
        `uvm_object_utils (jit_intr_sequence)
        veer_sequence_item seq_item;

        function new(string name = "jit_intr_sequence");
            super.new(name);
        endfunction

        task body();
            seq_item = veer_sequence_item::type_id::create("seq_item");
            start_item(seq_item);
            `NOR_OP
            seq_item.intr_jit.constraint_mode(1);
            assert(seq_item.randomize());
            `NOR_OP_SIG_I
            finish_item(seq_item);
        endtask
    endclass

   //active interrupt sequence nmi
    class nact_intr_sequence extends uvm_sequence #(veer_sequence_item);
        `uvm_object_utils (nact_intr_sequence)
        veer_sequence_item seq_item;

        function new(string name = "nact_intr_sequence");
            super.new(name);
        endfunction

        task body();
            seq_item = veer_sequence_item::type_id::create("seq_item");
            start_item(seq_item);
            `NOR_OP
            seq_item.nintr_act.constraint_mode(1);
            assert(seq_item.randomize());
            `NOR_OP_SIG_I
            finish_item(seq_item);
        endtask
    endclass

    //inactive interrupt sequence nmi
    class ndeact_intr_sequence extends uvm_sequence #(veer_sequence_item);
        `uvm_object_utils (ndeact_intr_sequence)
        veer_sequence_item seq_item;

        function new(string name = "ndeact_intr_sequence");
            super.new(name);
        endfunction

        task body();
            seq_item = veer_sequence_item::type_id::create("seq_item");
            start_item(seq_item);
            `NOR_OP
            seq_item.nintr_deact.constraint_mode(1);
            assert(seq_item.randomize());
            `NOR_OP_SIG_I
            finish_item(seq_item);
        endtask
    endclass

    //jitter interrupt sequence nmi
    class njit_intr_sequence extends uvm_sequence #(veer_sequence_item);
        `uvm_object_utils (njit_intr_sequence)
        veer_sequence_item seq_item;

        function new(string name = "njit_intr_sequence");
            super.new(name);
        endfunction

        task body();
            seq_item = veer_sequence_item::type_id::create("seq_item");
            start_item(seq_item);
            `NOR_OP
            seq_item.nintr_jit.constraint_mode(1);
            assert(seq_item.randomize());
            `NOR_OP_SIG_I
            finish_item(seq_item);
        endtask
    endclass
endpackage