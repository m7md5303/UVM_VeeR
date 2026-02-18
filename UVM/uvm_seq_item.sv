/*seq item class file*/
package veer_sequence_item_pkg;
//importing packages and macros files
    import uvm_pkg::*;
    `include "uvm_macros.svh"
    import veer_types::*; 
    `include "common_defines.vh"
    `include "signals_pkg.sv"
    class veer_sequence_item extends uvm_sequence_item;
        //registering the object in the uvm factory
        `uvm_object_utils(veer_sequence_item) 
            //Signals Declaration
        `DEF_SIGS                         
        // array for including active reset states
        bit [2:0] rst_arr [] = '{0,1,2,3,4,5,6} ; //7 was excluded because it would then deactivate all resets (unrequired)
        rand bit [2:0] rst_tot;
        shortint ids_queue_wr_ifu [$:5] ;//declaring a queue storing past sent transaction ids with max size of 5
        shortint ids_queue_rd_ifu [$:5];// " "
        shortint ids_queue_wr_lsu [$:5];// " "
        shortint ids_queue_rd_lsu [$:5];// " "
        bit ids_queue_wr_dbg [$:1];// " "
        bit ids_queue_rd_dbg [$:1];// " "
        rand bit [1:0] halt_mpc_ctrl;//for testing mpc halting
        bit timer_int_old, nmi_int_old;//for testing interrupt
        static int beat_count_dma = 0;//counting dma axi beats per complete transaction
        //active_ver av;//common variable to coordinate between the sequence generation and the scoreboard checking
        rand bit [3:0] clk_ens;//for the clk enables
        bit lsu_axi_arready_old, ifu_axi_arready_old, lsu_axi_rready_old, ifu_axi_rready_old;
        bit lsu_axi_arvalid_old, ifu_axi_arvalid_old, lsu_axi_rvalid_old, ifu_axi_rvalid_old;
        //simulation beginning reset test//

        function new(string name = "veer_sequence_item");
            super.new(name);
        endfunction
        //general reset behaviour
        constraint c_reset{
            rst_l dist {1:=98,0:=2};
            dbg_rst_l dist {1:=98,0:=2};
            jtag_trst_n dist {1:=98,0:=2};
        }
        //randomizing resets checking for possible misbehaviour (RDC)
        constraint c_reset_rdc{
            rst_tot inside rst_arr;
            {rst_l, dbg_rst_l, jtag_trst_n} == rst_tot;
        }
        //normal restart behaviour
        constraint restart_t{
            i_cpu_run_req dist  {0:=95,
                                 1:=5};
        }
        //untypical restart behaviour
        constraint restart_x{
            i_cpu_run_req dist {1:=85,
                                0:=15};
        }
/*******************************************************************************************************************/
        //Debugging mode constraints

        constraint halt_norm {//normal halt request
            i_cpu_halt_req dist {0:=90,
                                 1:=10};
        }
        constraint halt_jit {//malfunctioning the halt request
            i_cpu_halt_req dist {1:=85,
                                 0:=15};
        }

        constraint halt_mpc_norm{//normal halt request
            mpc_debug_halt_req dist {0:=90,
                                    1:=10};
            mpc_debug_run_req dist {1:=90,
                                    0:=10};
        }

        constraint halt_mpc_jit{//malfunctioning the halt request
            mpc_debug_halt_req dist {1:=90,
                                    0:=10};
        }
       
       //MIsbehaving of halt/run requests
       constraint mis_behav_halt_mpc{
           halt_mpc_ctrl dist {3:=50, //2'b11 
                              0:=50}; //2'b00
            mpc_debug_halt_req == halt_mpc_ctrl[0];
            mpc_debug_run_req  == halt_mpc_ctrl[1];
       }

/*******************************************************************************************************************/
        //AXI interface testing 
        //Master role first
        //Instruction Fetch Unit (IFU)
        constraint deact_ready_ifu{ //lowering ready signals for most of the time testing the master behaves properly
        ifu_axi_awready dist {0:=75,
                              1:=25};
        ifu_axi_wready dist {0:=75,
                              1:=25};
        ifu_axi_arready dist {0:=75,
                              1:=25};
        }
        constraint act_ready_ifu{ //raising ready signals for most of the time testing the master behaves properly
        ifu_axi_awready dist {1:=75,
                              0:=25};
        ifu_axi_wready dist  {1:=75,
                              0:=25};
        ifu_axi_arready dist {1:=75,
                              0:=25};
        }
        constraint err_rec_wr_ifu{//responding with failed receiving for transactions checking the master behaviour
        ifu_axi_bresp dist{ 0:=10,
                            1:=10,
                            2:=30,
                            3:=30
                             };
        }
        constraint crr_rec_wr_ifu{//responding with success receiving for transactions checking the master behaviour
        ifu_axi_bresp dist{ 0:=40,
                            1:=40,
                            2:=5,
                            3:=5
                             };
        }
        //constraint for responding with wrong trasnaction id ("a form of error injection")

        constraint err_id_ifu{
                !(ifu_axi_bid inside { ids_queue_wr_ifu }) ;

                !(ifu_axi_rid inside { ids_queue_rd_ifu } );
        }

        constraint crr_id_ifu{//increasing probability of valid ids
                ifu_axi_bid inside { ids_queue_wr_ifu } ;

                ifu_axi_rid inside { ids_queue_rd_ifu } ;
        }
        //Testings for the read channel
        constraint err_rec_rd_ifu{//responding with failed receiving for transactions checking the master behaviour
        ifu_axi_rresp dist{ 0:=10,
                            1:=10,
                            2:=30,
                            3:=30
                             }; 
        }
        constraint crr_rec_rd_ifu{//responding with success receiving for transactions checking the master behaviour
        ifu_axi_rresp dist{ 0:=40,
                            1:=40,
                            2:=5,
                            3:=5
                             };
        }
        constraint invalid_rd_ifu{//testing the master behaviour againstchanges in valid signal
        ifu_axi_rvalid dist{ 0:=80,
                             1:=20
                             };
        }
        constraint valid_rd_ifu{//testing the master behaviour againstchanges in valid signal
        ifu_axi_rvalid dist{ 1:=80,
                             0:=20
                             };
        }
        constraint last_rd_ifu{//injecting untypical behaviour for the last signal
        ifu_axi_rlast dist{  1:=80,
                             0:=20
                             };
        }
/****************************************************************************************************************/
        //Load Store Unit (LSU)
        constraint deact_ready_lsu{ //lowering ready signals for most of the time testing the master behaves properly
        lsu_axi_awready dist {0:=75,
                              1:=25};
        lsu_axi_wready dist {0:=75,
                              1:=25};
        lsu_axi_arready dist {0:=75,
                              1:=25};
        }
        constraint act_ready_lsu{ //raising ready signals for most of the time testing the master behaves properly
        lsu_axi_awready dist {1:=75,
                              0:=25};
        lsu_axi_wready dist  {1:=75,
                              0:=25};
        lsu_axi_arready dist {1:=75,
                              0:=25};
        }
        constraint err_rec_wr_lsu{//responding with failed receiving for transactions checking the master behaviour
        lsu_axi_bresp dist{ 0:=10,
                            1:=10,
                            2:=30,
                            3:=30
                             };
        }
        constraint crr_rec_wr_lsu{//responding with success receiving for transactions checking the master behaviour
        lsu_axi_bresp dist{ 0:=40,
                            1:=40,
                            2:=5,
                            3:=5
                             };
        }
        //constraint for responding with wrong trasnaction id ("a form of error injection")

        constraint err_id_lsu{
                !(lsu_axi_bid inside { ids_queue_wr_lsu }) ;

                !(lsu_axi_rid inside { ids_queue_rd_lsu } );
        }

        constraint crr_id_lsu{//increasing probability of valid ids
                lsu_axi_bid inside { ids_queue_wr_lsu } ;

                lsu_axi_rid inside { ids_queue_rd_lsu } ;
        }
        //Testings for the read channel
        constraint err_rec_rd_lsu{//responding with failed receiving for transactions checking the master behaviour
        lsu_axi_rresp dist{ 0:=10,
                            1:=10,
                            2:=30,
                            3:=30
                             };
        }
        constraint crr_rec_rd_lsu{//responding with success receiving for transactions checking the master behaviour
        lsu_axi_rresp dist{ 0:=40,
                            1:=40,
                            2:=5,
                            3:=5
                             };
        }
        constraint invalid_rd_lsu{//testing the master behaviour againstchanges in valid signal
        lsu_axi_rvalid dist{ 0:=80,
                             1:=20
                             };
        }
        constraint valid_rd_lsu{//testing the master behaviour againstchanges in valid signal
        lsu_axi_rvalid dist{ 1:=80,
                             0:=20
                             };
        }
        constraint last_rd_lsu{//injecting untypical behaviour for the last signal
        lsu_axi_rlast dist{  1:=80,
                             0:=20
                             };
        }
/****************************************************************************************************************/
        //Debugger Unit (DBG)
        constraint deact_ready_dbg{ //lowering ready signals for most of the time testing the master behaves properly
        sb_axi_awready dist {0:=75,
                              1:=25};
        sb_axi_wready dist {0:=75,
                              1:=25};
        sb_axi_arready dist {0:=75,
                              1:=25};
        }
        constraint act_ready_dbg{ //raising ready signals for most of the time testing the master behaves properly
        sb_axi_awready dist {1:=75,
                              0:=25};
        sb_axi_wready dist  {1:=75,
                              0:=25};
        sb_axi_arready dist {1:=75,
                              0:=25};
        }
        constraint err_rec_wr_dbg{//responding with failed receiving for transactions checking the master behaviour
        sb_axi_bresp dist{ 0:=10,
                            1:=10,
                            2:=30,
                            3:=30
                             };
        }
        constraint crr_rec_wr_dbg{//responding with success receiving for transactions checking the master behaviour
        sb_axi_bresp dist{ 0:=40,
                            1:=40,
                            2:=5,
                            3:=5
                             };
        }
        //constraint for responding with wrong trasnaction id ("a form of error injection")

        constraint err_id_dbg{
                !(sb_axi_bid inside { ids_queue_wr_dbg }) ;

                !(sb_axi_rid inside { ids_queue_rd_dbg } );
        }

        constraint crr_id_dbg{//increasing probability of valid ids
                sb_axi_bid inside { ids_queue_wr_dbg } ;

                sb_axi_rid inside { ids_queue_rd_dbg } ;
        }
        //Testings for the read channel
        constraint err_rec_rd_dbg{//responding with failed receiving for transactions checking the master behaviour
        sb_axi_rresp dist{ 0:=10,
                            1:=10,
                            2:=30,
                            3:=30
                             };
        }
        constraint crr_rec_rd_dbg{//responding with success receiving for transactions checking the master behaviour
        sb_axi_rresp dist{ 0:=40,
                            1:=40,
                            2:=5,
                            3:=5
                             };
        }
        constraint invalid_rd_dbg{//testing the master behaviour againstchanges in valid signal
        sb_axi_rvalid dist{ 0:=80,
                             1:=20
                             };
        }
        constraint valid_rd_dbg{//testing the master behaviour againstchanges in valid signal
        sb_axi_rvalid dist{ 1:=80,
                             0:=20
                             };
        }
        constraint last_rd_dbg{//injecting untypical behaviour for the last signal
        sb_axi_rlast dist{  1:=80,
                             0:=20
                             };
        }    
/****************************************************************************************************************/
        //Direct Memory Access(DMA)---SLave Role
        constraint wr_valid_dma {//smooth write operations
            dma_axi_awvalid dist{ 1:=75,
                                  0:=25
                                };

            dma_axi_wvalid dist{ 1:=75,
                                  0:=25
                                };
                            
            dma_axi_bready dist{ 1:=75,
                                  0:=25
                                };
        }

        constraint wr_invalid_dma {//struggling write operations
            dma_axi_awvalid dist{ 0:=75,
                                  1:=25
                                };

            dma_axi_wvalid dist{  0:=75,
                                  1:=25
                                };
                            
            dma_axi_bready dist{  0:=75,
                                  1:=25
                                };
        }

        constraint fault_last{//repetitive highlast signal
            dma_axi_wlast dist{ 1:=75,
                                0:=25
                              };
            dma_axi_awlen > 10 ;
            dma_axi_awlen < 20 ;
        }

        constraint good_last_dma{//normal last behaviour
            dma_axi_awlen > 0;// > 1 beats
            if (beat_count_dma == dma_axi_awlen)
                dma_axi_wlast == 1 ;
            else
                dma_axi_wlast == 0 ;
        }

        constraint unready_master{
            dma_axi_bready dist {0:=80,
                                1:=20};
        }

        constraint ready_master{
            dma_axi_bready dist {1:=80,
                                0:=20};
        }

        //Read channel
        constraint valid_rd_addr{
            dma_axi_arvalid dist {1:=80,
                            0:=20};
        }
        constraint invalid_rd_addr{
            dma_axi_arvalid dist {0:=80,
                            1:=20};
        }

        constraint ready_rd_data{
            dma_axi_rready dist {1:=80,
                            0:=20};
        } 
        constraint unready_rd_data{
            dma_axi_rready dist {0:=80,
                            1:=20};
        }
/****************************************************************************************************************/
        //Clock Stall COnstraints (CSC)
        constraint stall_clk{
            clk_ens < 4;
            lsu_bus_clk_en+ifu_bus_clk_en+dbg_bus_clk_en+dma_bus_clk_en == clk_ens;
        }
        constraint normal_clk{
            
            lsu_bus_clk_en == 1;
            ifu_bus_clk_en == 1;
            dbg_bus_clk_en == 1;
            dma_bus_clk_en == 1;
           
        }
/*******************************************************************************************************************/        
         //Interrupt constraints going to the Decoder stage
        constraint intr_act{//abnormal interrupt behaviour
            timer_int  dist {1:=85,
                            0:=15};
        }
        constraint intr_deact{//normal interrupt behaviour
            timer_int  dist {0:=85,
                            1:=15};
        }

        constraint intr_jit{//testing system behaviour agains jittering interrupt
            timer_int == ~timer_int_old;
        }

         //Non-MAskable INterrupt (Nmi)
        constraint nintr_act{//abnormal interrupt behaviour
            nmi_int  dist {1:=85,
                           0:=15};
        }
        constraint nintr_deact{//normal interrupt behaviour
            nmi_int  dist {0:=85,
                           1:=15};
        }

        constraint nintr_jit{//testing system behaviour agains jittering interrupt
            nmi_int == ~nmi_int_old;
        }

/*******************************************************************************************************************/
        //JTAG Testing

        //constraint for checking proper state transitions for the TAP controller
        constraint high_tms_j{
            jtag_tms dist {1:=80,
                           0:=20
            };
        }

        constraint low_tms_j{
            jtag_tms dist {0:=80,
                           1:=20
            };
        }
/********************************************************************************************************************/
        function void pre_randomize();

        endfunction
        //
        function void post_randomize();
            if(ids_queue_wr_ifu.size>=4)
                ids_queue_wr_ifu.pop_front();

            if(ids_queue_rd_ifu.size>=4)
                ids_queue_rd_ifu.pop_front();

            ids_queue_wr_ifu.push_back(ifu_axi_awid);
            ids_queue_rd_ifu.push_back(ifu_axi_arid);

            if(ids_queue_wr_dbg.size>=0)
                ids_queue_wr_dbg.pop_front();

            if(ids_queue_rd_dbg.size>=0)
                ids_queue_rd_dbg.pop_front();

            ids_queue_wr_dbg.push_back(sb_axi_awid);
            ids_queue_rd_dbg.push_back(sb_axi_arid);

            if(ids_queue_wr_lsu.size>=4)
                ids_queue_wr_lsu.pop_front();

            if(ids_queue_rd_lsu.size>=4)
                ids_queue_rd_lsu.pop_front();

            ids_queue_wr_lsu.push_back(lsu_axi_awid);
            ids_queue_rd_lsu.push_back(lsu_axi_arid);
            timer_int_old = timer_int;
            nmi_int_old = nmi_int;
            if(dma_axi_wvalid && dma_axi_wready) 
                beat_count_dma++;
            if(dma_axi_wlast)
                beat_count_dma = 0;
            lsu_axi_arready_old = lsu_axi_arready;
            lsu_axi_rready_old = lsu_axi_rready;
            ifu_axi_arready_old = ifu_axi_arready;
            ifu_axi_rready_old = ifu_axi_rready;

            lsu_axi_arvalid_old = lsu_axi_arvalid;
            lsu_axi_rvalid_old = lsu_axi_rvalid;
            ifu_axi_arvalid_old = ifu_axi_arvalid;
            ifu_axi_rvalid_old = ifu_axi_rvalid;
        endfunction

        //
        function string convert2string();
            return $sformatf("%s\n================ RESET ================\nrst_l=%0b dbg_rst_l=%0b jtag_trst_n=%0b\n================ CPU CTRL ================\ni_cpu_run_req=%0b i_cpu_halt_req=%0b mpc_debug_halt_req=%0b mpc_debug_run_req=%0b halt_mpc_ctrl=%0d\n================ IFU AXI ================\nawready=%0b wready=%0b arready=%0b bvalid=%0b bready=%0b bid=%0d bresp=%0d rvalid=%0b rready=%0b rid=%0d rresp=%0d rlast=%0b\n================ LSU AXI ================\nawready=%0b wready=%0b arready=%0b bvalid=%0b bready=%0b bid=%0d bresp=%0d rvalid=%0b rready=%0b rid=%0d rresp=%0d rlast=%0b\n================ DBG AXI ================\nawready=%0b wready=%0b arready=%0b bvalid=%0b bready=%0b bid=%0d bresp=%0d rvalid=%0b rready=%0b rid=%0d rresp=%0d rlast=%0b\n================ DMA AXI (Slave Role) ================\nawvalid=%0b awlen=%0d wvalid=%0b wready=%0b wlast=%0b bready=%0b arvalid=%0b rready=%0b beat_count_dma=%0d\n================ CLOCK/INT/JTAG ================\nlsu_clk=%0b ifu_clk=%0b dma_clk=%0b dbg_clk=%0b timer_int=%0b jtag_tms=%0b\n================ QUEUES ================\nifu_wr_q=%0d ifu_rd_q=%0d lsu_wr_q=%0d lsu_rd_q=%0d dbg_wr_q=%0d dbg_rd_q=%0d\n", super.convert2string(), rst_l, dbg_rst_l, jtag_trst_n, i_cpu_run_req, i_cpu_halt_req, mpc_debug_halt_req, mpc_debug_run_req, halt_mpc_ctrl, ifu_axi_awready, ifu_axi_wready, ifu_axi_arready, ifu_axi_bvalid, ifu_axi_bready, ifu_axi_bid, ifu_axi_bresp, ifu_axi_rvalid, ifu_axi_rready, ifu_axi_rid, ifu_axi_rresp, ifu_axi_rlast, lsu_axi_awready, lsu_axi_wready, lsu_axi_arready, lsu_axi_bvalid, lsu_axi_bready, lsu_axi_bid, lsu_axi_bresp, lsu_axi_rvalid, lsu_axi_rready, lsu_axi_rid, lsu_axi_rresp, lsu_axi_rlast, sb_axi_awready, sb_axi_wready, sb_axi_arready, sb_axi_bvalid, sb_axi_bready, sb_axi_bid, sb_axi_bresp, sb_axi_rvalid, sb_axi_rready, sb_axi_rid, sb_axi_rresp, sb_axi_rlast, dma_axi_awvalid, dma_axi_awlen, dma_axi_wvalid, dma_axi_wready, dma_axi_wlast, dma_axi_bready, dma_axi_arvalid, dma_axi_rready, beat_count_dma, lsu_bus_clk_en, ifu_bus_clk_en, dma_bus_clk_en, dbg_bus_clk_en, timer_int, jtag_tms, ids_queue_wr_ifu.size(), ids_queue_rd_ifu.size(), ids_queue_wr_lsu.size(), ids_queue_rd_lsu.size(), ids_queue_wr_dbg.size(), ids_queue_rd_dbg.size());
        endfunction
        //
    endclass
endpackage