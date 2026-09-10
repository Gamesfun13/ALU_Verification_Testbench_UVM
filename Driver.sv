
class Driver extends uvm_driver #(Transaction);
    `uvm_component_utils(Driver);

    virtual ALUInterface vif;
    

    function new(string name = "Driver", uvm_component parent);
        super.new(name, parent);
    endfunction: new


    function void build_phase(uvm_phase phase);
        super.build_phase(phase);
        
        if(!uvm_config_db#(virtual ALUInterface)::get(this, "", "vif", vif))
            `uvm_fatal(get_name(), "Interface not Set");
            
    endfunction: build_phase
    

    task run_phase(uvm_phase phase);
        @(negedge vif.reset)    
        forever begin
            seq_item_port.get_next_item(req);
            
            @(negedge vif.clock)
                vif.A=req.In_A;
                vif.B=req.In_B;
                vif.ALU_Sel=req.ALU_Sel;
                req.display_transaction(this);
            @(negedge vif.clock)
                seq_item_port.item_done();
                
            end                
    endtask: run_phase
    
    
endclass: Driver
