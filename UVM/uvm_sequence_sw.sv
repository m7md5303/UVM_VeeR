


/************************************************************************************************//*
---------------------------------DISCLAIMER--------------------------------------------------------
                    This file is yet under development                                
/*****************************************************************************************************/
/*sequences files*/
package veer_sequence_sw_pkg;
//importing packages and macros files
    import uvm_pkg::*;
    `include "uvm_macros.svh"
    import veer_sequence_item_pkg::*;
    //software sequence
    class sw_sequence extends uvm_sequence #(veer_sequence_item);
        `uvm_object_utils (sw_sequence)
        veer_sequence_item seq_item;

        function new(string name = "sw_sequence");
            super.new(name);
        endfunction

        task body();
        /*          fd = $fopen (RamFileName, "r");
                    while (!$feof(fd)) begin
                        $fgets(line, fd);
                        imem = 
                        dmem = 
                    end
        */
            seq_item = veer_sequence_item::type_id::create("seq_item");
            start_item(seq_item);
            seq_item.constraint_mode(0);
            seq_item.act_ready_ifu.constraint_mode(1);
            seq_item.act_ready_lsu.constraint_mode(1);
            seq_item.crr_id_ifu.constraint_mode(1);
            seq_item.crr_id_lsu.constraint_mode(1);
            seq_item.valid_rd_ifu.constraint_mode(1);
            seq_item.valid_rd_lsu.constraint_mode(1);
            assert(seq_item.randomize());
            if(seq_item.lsu_axi_arvalid_old&&seq_item.lsu_axi_arready_old) begin
                //handshake done
            end
            else if (seq_item.lsu_axi_rvalid_old&&seq_item.lsu_axi_rready_old) begin
                 /*
                        //send hex instructions got from the SW tests compilation
                    end
                 */
            end
            finish_item(seq_item);
        endtask
    endclass
endpackage