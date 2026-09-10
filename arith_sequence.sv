
class arith_sequence extends uvm_sequence #(Transaction);
    `uvm_object_utils(arith_sequence);


    function new(string name = "arith_sequence");
        super.new(name);
    endfunction: new

    task body();
        repeat(5)
        `uvm_do_with(req,{
        ALU_Sel inside {[0:1]};       
           });
    endtask



    
endclass: arith_sequence
