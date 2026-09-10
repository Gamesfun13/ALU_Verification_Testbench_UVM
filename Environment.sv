
class Environment extends uvm_env;
    `uvm_component_utils(Environment);
    
    agent my_agent;
    scoreboard my_scoreboard;


    function new(string name = "Environment", uvm_component parent);
        super.new(name, parent);
    endfunction: new

    function void build_phase(uvm_phase phase);
        super.build_phase(phase);
        my_agent=agent::type_id::create("My Agent",this);
        my_scoreboard=scoreboard::type_id::create("My Scoreboard",this);
    endfunction: build_phase
    
    function void connect_phase(uvm_phase phase);
        super.connect_phase(phase);
        my_agent.my_monitor.item_port.connect(my_scoreboard.scoreboard_export);
    endfunction: connect_phase
    

endclass: Environment
