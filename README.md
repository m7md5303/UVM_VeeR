# UVM_VeeR
<p>UVM Environment for verifying the <span><a src ='https://github.com/chipsalliance/Cores-VeeR-EH1/tree/main'>Veer RISC-V-Based Core</a></span><. It levarages the usage of a mix of constrained randomization, concurrent and immediate assertions as well as having the support of well-built coverage groups</p>
  
## Steps to Run 

### Simulation and Coverage results generation
Clone the repository via:
```tcl
git clone https://github.com/m7md5303/UVM_VeeR.git
```
After Extracting the design files open Vivado
In the TCL Console type
```tcl
source create_veerprj.tcl
```
This script is responsible for generating the code coverage reports and vcd file for the waveform data

The functional coverage can be produced through typing the next command line in Vivado TCL Console **After closing the simulation**
```tcl
xcrg -report_format html -dir ./veer_uvm.sim/sim_1/behav/xsim/xsim.covdb/top_uvm_behav/xsim.covinfo -report_dir ./
```

### Waveform viewing
You can easily revisit the waveform results without rerunning the simulation by using the earlier generated vcd file 
The following instructions expect surfer waveform viewer is installed on your machine
To view the waveform type in the bash terminal:
```bash
surfer ./veer_uvm.sim/sim_1/behav/xsim/veer_wv.vcd
```
After that Press ` Space ` and type 
```tcl 
scope_add top_uvm.DUT
```
