
module TB_Top;


bit clock,reset;

import ALUPackage::*;
import uvm_pkg::*;


    ALUInterface aif(clock,reset);

     ALU DUT(
        .aif(aif)
    );

    initial
        begin
            uvm_config_db#(virtual ALUInterface)::set(uvm_root::get(), "*", "vif", aif);

            reset=0;#10;
            reset=1;#10;
            reset=0;#10;
        end

    initial
        begin
        run_test("Test");
        end


always #5 clock=~clock;
endmodule: TB_Top
