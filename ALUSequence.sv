
class ALUSequence extends uvm_sequence #(Transaction);
    `uvm_object_utils(ALUSequence);
    

    function new(string name = "ALUSequence");
        super.new(name);
    endfunction: new

    task body();
        req=Transaction::type_id::create("req");
        start_item(req);
        //req.only_arithmetic_operation.constraint_mode(1);
        req.randomize();
        finish_item(req);
    endtask


    
endclass: ALUSequence