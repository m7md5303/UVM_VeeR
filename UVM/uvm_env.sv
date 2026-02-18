/*env class file*/
package veer_env_pkg;
//importing packages and macros files
   import uvm_pkg::*;
   `include "uvm_macros.svh"
   import veer_agent_pkg::*;
   import veer_scoreboard_pkg::*;
   import veer_cvg_pkg::*;

   class veer_env extends uvm_env;
      `uvm_component_utils(veer_env)
      veer_agent agt_env;
      veer_scoreboard sb_env;
      veer_cvg cov_env;

      function new(string name = "veer_env", uvm_component parent = null);
        super.new(name, parent);
      endfunction

      function void build_phase(uvm_phase phase);
        //creation of the sub-componenets registered in the factory
        super.build_phase(phase);
        agt_env = veer_agent::type_id::create("agt_env",this);
        sb_env = veer_scoreboard::type_id::create("sb_env",this);
        cov_env = veer_cvg::type_id::create("cov_env",this);
      endfunction : build_phase

      function void connect_phase(uvm_phase phase);
      //connecting agent with receptors (scoreboard and coverage collectors)
        agt_env.agt_ap.connect(sb_env.sb_export);
        agt_env.agt_ap.connect(cov_env.cov_export);
       endfunction
   endclass
endpackage