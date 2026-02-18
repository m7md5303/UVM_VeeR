/*cfg class file*/
package veer_config_pkg;
//importing packages and macros files
    import uvm_pkg::*;
    `include "uvm_macros.svh"
    //registering the object in the uv, factory
    class veer_config extends uvm_object;
        `uvm_object_utils(veer_config)
        virtual veer_if vr_if_config;
        //calling the constructor
        function new (string name = "veer_config");
            super.new(name);
        endfunction
    endclass
endpackage