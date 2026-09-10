
class shift_sequence extends uvm_sequence #(Transaction);
    `uvm_object_utils(shift_sequence);

    function new(string name = "shift_sequence");
        super.new(name);
    endfunction: new

    task body();
        repeat(5)
        `uvm_do_with(req,{
        ALU_Sel inside {[5:6]};
        In_B < (1<<3);
    });
    endtask
    
endclass: shift_sequence
