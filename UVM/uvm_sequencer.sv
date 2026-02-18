/*sequencer class file*/
package veer_sequencer_pkg;
//importing packages and macros files
    import uvm_pkg::*;
    `include "uvm_macros.svh"
    import veer_sequence_item_pkg::*;
    class veer_sequencer extends uvm_sequencer #(veer_sequence_item);
        //registering the component in the uvm factory
        `uvm_component_utils(veer_sequencer)
        function new(string name="veer_sequencer",uvm_component parent=null);
            super.new(name,parent);
        endfunction
    endclass
endpackage