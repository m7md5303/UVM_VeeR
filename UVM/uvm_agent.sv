/*agent class file*/
package veer_agent_pkg;
//importing packages and macros files
    import uvm_pkg::*; 
    `include "uvm_macros.svh"
    import veer_sequencer_pkg::*;
    import veer_driver_pkg::*;
    import veer_monitor_pkg::*;
    import veer_config_pkg::*;
    import veer_sequence_item_pkg::*; 
    class veer_agent extends uvm_agent;
    //registering the component in the uvm factory
        `uvm_component_utils(veer_agent)
        //declaring handles for the included classes in the agent component
        veer_sequencer sqr_agent;
        veer_driver drv_agent;
        veer_monitor mon_agent;
        veer_config cfg_agent;
        //declaring analysis port for the agent compoenent
        uvm_analysis_port #(veer_sequence_item) agt_ap;
        //calling the constructor
        function new(string name = "veer_agent",uvm_component parent = null);
            super.new(name,parent);
        endfunction

        function void build_phase(uvm_phase phase);
            super.build_phase(phase);
            
            cfg_agent=veer_config::type_id::create("cfg_agent",this);
            if(!uvm_config_db #(veer_config)::get(this , "" , "TEST_CFG" , cfg_agent))
            `uvm_fatal("build_phase" , "Unable to get configuration object in agent component")
            //
            sqr_agent = veer_sequencer::type_id::create("sqr_agent",this);
            drv_agent = veer_driver::type_id::create("drv_agent",this);
            mon_agent = veer_monitor::type_id::create("mon_agent",this);
            agt_ap = new("agt_ap",this);
        endfunction

        function void connect_phase(uvm_phase phase);
        super.connect_phase(phase);
        //connecting the monitor with the agent analysis port for scoreboard and coverage
            mon_agent.mon_ap.connect(agt_ap);
            //connecting the monitor&driver with the design interface
            drv_agent.vr_if_driver=cfg_agent.vr_if_config;
            //
            mon_agent.vr_if_monitor=cfg_agent.vr_if_config;
        //connecting the driver with the sequencer for sending and receiving stimulus sequence items
            drv_agent.seq_item_port.connect(sqr_agent.seq_item_export);
        endfunction
    endclass
    
endpackage