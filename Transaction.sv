
class Transaction extends uvm_sequence_item;
    


        rand logic [7:0] In_A,In_B;
        rand logic [2:0]ALU_Sel;
        logic [8:0] ALU_Out;
        
      
    function new(string name = "Transaction");
        super.new(name);
        this.constraint_mode(0);
    endfunction: new
    
    function void display_transaction(uvm_component component);
        `uvm_info(component.get_name(), $sformatf("A:%d ,B:%d ,Sel:%d ,Result:%d  ",this.In_A,this.In_B,this.ALU_Sel,this.ALU_Out ), UVM_NONE)    
    endfunction

    `uvm_object_utils_begin(Transaction)
        `uvm_field_int(In_A,UVM_ALL_ON)
        `uvm_field_int(In_B,UVM_ALL_ON)
        `uvm_field_int(ALU_Sel,UVM_ALL_ON)
        `uvm_field_int(ALU_Out,UVM_ALL_ON)
    `uvm_object_utils_end

    
endclass: Transaction


