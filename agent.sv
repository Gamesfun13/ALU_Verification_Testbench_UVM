class agent extends uvm_agent;
    `uvm_component_utils(agent);

    Sequencer my_seqeuncer;
    Driver my_driver;
    monitor my_monitor;
    cov_monitor my_cov_monitor;


    function new(string name = "agent", uvm_component parent);
        super.new(name, parent);
    endfunction: new

    function void build_phase(uvm_phase phase);
        super.build_phase(phase);
        my_seqeuncer=Sequencer::type_id::create("my_sequencer",this);
        my_driver=Driver::type_id::create("my_driver",this);
        my_monitor=monitor::type_id::create("my_monitor",this);
        my_cov_monitor=cov_monitor::type_id::create("my_cov_monitor",this);
    endfunction: build_phase
    
    function void connect_phase(uvm_phase phase);
        super.connect_phase(phase);
        my_driver.seq_item_port.connect(my_seqeuncer.seq_item_export);
        my_monitor.item_port.connect(my_cov_monitor.analysis_export);
        
    endfunction: connect_phase
    

    
endclass: agent
