
class logical_sequence extends uvm_sequence #(Transaction);
    `uvm_object_utils(logical_sequence);


    function new(string name = "logical_sequence");
        super.new(name);
    endfunction: new

    task body();
        repeat(5)
        `uvm_do_with(req,{
        ALU_Sel inside {[2:4],7};       
    });
    endtask
    
endclass: logical_sequence
