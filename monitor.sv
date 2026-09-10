class monitor extends uvm_monitor;
    `uvm_component_utils(monitor);

    virtual ALUInterface vif;
    uvm_analysis_port #(Transaction) item_port;

    function new(string name = "monitor", uvm_component parent);
        super.new(name, parent);
        item_port=new("item_port",this);
    endfunction: new

    function void build_phase(uvm_phase phase);
        super.build_phase(phase);
        uvm_config_db#(virtual ALUInterface)::get(this,"","vif",vif);
        
    endfunction: build_phase
    

    task run_phase(uvm_phase phase);
        Transaction monitor_to_scb=Transaction::type_id::create("monitor_to_scb",this);
        @(negedge vif.reset)
        @(negedge vif.clock)
        forever
        begin
        @(negedge vif.clock)
        monitor_to_scb.In_A=vif.A;
        monitor_to_scb.In_B=vif.B;
        monitor_to_scb.ALU_Sel=vif.ALU_Sel;
        monitor_to_scb.ALU_Out=vif.ALU_Out;
        monitor_to_scb.display_transaction(this);
        item_port.write(monitor_to_scb);
        @(negedge vif.clock);
        
        end
    endtask: run_phase
    

    
endclass: monitor
