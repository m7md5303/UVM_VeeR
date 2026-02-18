/*sequences files*/
package veer_sequence_halt_pkg;
//importing packages and macros files
    import uvm_pkg::*;
    `include "uvm_macros.svh"
    `include "state_pkg.sv"
    import veer_sequence_item_pkg::*;
    //halt normal sequence
    class halt_norm_sequence extends uvm_sequence #(veer_sequence_item);
        `uvm_object_utils (halt_norm_sequence)
        veer_sequence_item seq_item;

        function new(string name = "halt_norm_sequence");
            super.new(name);
        endfunction

        task body();
            seq_item = veer_sequence_item::type_id::create("seq_item");
            start_item(seq_item);
            `NOR_OP
            seq_item.halt_norm.constraint_mode(1);
            assert(seq_item.randomize());
            `NOR_OP_SIG_H
            finish_item(seq_item);
        endtask
    endclass

    //halt jitter sequence
    class halt_jit_sequence extends uvm_sequence #(veer_sequence_item);
        `uvm_object_utils (halt_jit_sequence)
        veer_sequence_item seq_item;

        function new(string name = "halt_jit_sequence");
            super.new(name);
        endfunction

        task body();
            seq_item = veer_sequence_item::type_id::create("seq_item");
            start_item(seq_item);
            `NOR_OP
            seq_item.halt_jit.constraint_mode(1);
            assert(seq_item.randomize());
            `NOR_OP_SIG_H
            finish_item(seq_item);
        endtask
    endclass

    //halt mpc normal sequence
    class halt_mpcnorm_sequence extends uvm_sequence #(veer_sequence_item);
        `uvm_object_utils (halt_mpcnorm_sequence)
        veer_sequence_item seq_item;

        function new(string name = "halt_mpcnorm_sequence");
            super.new(name);
        endfunction

        task body();
            seq_item = veer_sequence_item::type_id::create("seq_item");
            start_item(seq_item);
            `NOR_OP
            seq_item.halt_mpc_norm.constraint_mode(1);
            assert(seq_item.randomize());
            `NOR_OP_SIG_H
            finish_item(seq_item);
        endtask
    endclass

    //halt mpc jitter sequence
    class halt_mpcjit_sequence extends uvm_sequence #(veer_sequence_item);
        `uvm_object_utils (halt_mpcjit_sequence)
        veer_sequence_item seq_item;

        function new(string name = "halt_mpcjit_sequence");
            super.new(name);
        endfunction

        task body();
            seq_item = veer_sequence_item::type_id::create("seq_item");
            start_item(seq_item);
            `NOR_OP
            seq_item.halt_mpc_jit.constraint_mode(1);
            assert(seq_item.randomize());
            `NOR_OP_SIG_H
            finish_item(seq_item);
        endtask
    endclass

    //misbehav halt mpc sequence
    class halt_mismpc_sequence extends uvm_sequence #(veer_sequence_item);
        `uvm_object_utils (halt_mismpc_sequence)
        veer_sequence_item seq_item;

        function new(string name = "halt_mismpc_sequence");
            super.new(name);
        endfunction

        task body();
            seq_item = veer_sequence_item::type_id::create("seq_item");
            start_item(seq_item);
            `NOR_OP
            seq_item.mis_behav_halt_mpc.constraint_mode(1);
            assert(seq_item.randomize());
            `NOR_OP_SIG_H
            finish_item(seq_item);
        endtask
    endclass
endpackage