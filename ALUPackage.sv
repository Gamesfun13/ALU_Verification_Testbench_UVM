`include "uvm_macros.svh"
package ALUPackage;
  
    import uvm_pkg::*;

    `include "Transaction.sv"
    `include "ALUSequence.sv"
    `include "arith_sequence.sv"
    `include "logical_sequence.sv"
    `include "shift_sequence.sv"
    `include "Sequencer.sv"
    `include "Driver.sv"
    `include "monitor.sv"
    `include "cov_monitor.sv"
    `include "agent.sv"
    `include "scoreboard.sv"
    `include "Environment.sv"
    `include "Test.sv"


endpackage: ALUPackage
