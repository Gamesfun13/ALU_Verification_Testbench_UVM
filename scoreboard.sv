
class scoreboard extends uvm_scoreboard;
    `uvm_component_utils(scoreboard);
    uvm_analysis_imp #(Transaction,scoreboard) scoreboard_export;
    Transaction mon_to_scb_transcation_Q[$];
    int pass; int fails;

    function new(string name = "scoreboard", uvm_component parent);
        super.new(name, parent);
        scoreboard_export=new("scorebaord_export",this);
    endfunction: new


    function void write(Transaction t);
        mon_to_scb_transcation_Q.push_back(t);
    endfunction

    task run_phase(uvm_phase phase);
        Transaction trans=new();
        int flag; 
      
        forever
        begin
            wait(mon_to_scb_transcation_Q.size()>0);
           
            trans=mon_to_scb_transcation_Q.pop_front();
            case (trans.ALU_Sel)
                0:flag= (trans.In_A + trans.In_B) == trans.ALU_Out ? 1 :0;
                1:flag= (trans.In_A - trans.In_B) == trans.ALU_Out ? 1 :0;
                2:flag= (trans.In_A & trans.In_B) == trans.ALU_Out ? 1 :0;
                3:flag= (trans.In_A | trans.In_B) == trans.ALU_Out ? 1 :0;
                4:flag= (trans.In_A ^ trans.In_B) == trans.ALU_Out ? 1 :0;
                5:flag= (trans.In_A << trans.In_B[2:0]) == trans.ALU_Out ? 1 :0;
                6:flag= (trans.In_A >> trans.In_B[2:0]) == trans.ALU_Out ? 1 :0;
                7:flag= (trans.In_A == trans.ALU_Out)?1 :0;
            endcase
            trans.display_transaction(this);
            if(flag) 
            begin 
                pass++; 
                `uvm_info("", "Output MATCHED!", UVM_NONE)
             end else 
             begin
                 fails++;
                `uvm_info("", "Output MISMATCHED!", UVM_NONE)
             end
            
        end
        

    endtask: run_phase
    
    function void extract_phase(uvm_phase phase);
        super.extract_phase(phase);
        `uvm_info(get_name(), $sformatf("Pass:%d, Fails:%d ", pass,fails), UVM_NONE)
        
    endfunction: extract_phase
    
    
endclass: scoreboard
