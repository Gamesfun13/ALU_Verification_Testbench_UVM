
class Test extends uvm_test;
    `uvm_component_utils(Test);

    Environment my_env;
    arith_sequence my_arith_sequence;
    logical_sequence my_logical_sequence;
     shift_sequence my_shift_sequence;
     
     

    function new(string name = "Test", uvm_component parent);
        super.new(name, parent);
    endfunction: new

    function void build_phase(uvm_phase phase);
        super.build_phase(phase);
        my_env =Environment::type_id::create("Environment",this);
        
    endfunction: build_phase
    

    task run_phase(uvm_phase phase);
        phase.raise_objection(this);
        `uvm_info(get_name(), "<run_phase> started, objection raised.", UVM_NONE)
        `uvm_info(get_name(), "Start Of Test", UVM_NONE)
        my_arith_sequence=arith_sequence::type_id::create("arith_sequence");
        my_logical_sequence=logical_sequence::type_id::create("logical_sequence");
        my_shift_sequence=shift_sequence::type_id::create("shift_sequence");
        
        repeat(10)
        begin
            my_arith_sequence.start(my_env.my_agent.my_seqeuncer);
        end
        repeat(10)
        begin
            my_logical_sequence.start(my_env.my_agent.my_seqeuncer);
        end
        repeat(10)
        begin
            my_shift_sequence.start(my_env.my_agent.my_seqeuncer);
        end
        phase.drop_objection(this);
        `uvm_info(get_name(), "<run_phase> finished, objection dropped.", UVM_NONE)
        `uvm_info(get_name(), "End Of Test", UVM_NONE)
        
    endtask: run_phase
    
    

    
endclass: Test
