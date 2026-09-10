
class cov_monitor extends uvm_subscriber#(Transaction);
    `uvm_component_utils(cov_monitor);

    Transaction trans;
    int coverage;
    covergroup cg_transaction ;
        //  Coverpoint: cp_InA
        cp_InA: coverpoint trans.In_A  {
            bins _0_to_100={ [0:100]};
            bins _101_to_255={ [101:255]};
        
        }
        cp_InB: coverpoint trans.In_B  {
            bins _0_to_100={ [0:100]};
            bins _101_to_255={ [101:255]};
        
        }
        //  Coverpoint: cp_ALU_sel
        cp_ALU_sel: coverpoint trans.ALU_Sel;
        

    endgroup: cg_transaction

    function new(string name = "cov_monitor", uvm_component parent);
        super.new(name, parent);
        cg_transaction=new();
    
    endfunction: new

    function void write(Transaction t);
        trans=t;
        cg_transaction.sample();
    endfunction

    function void extract_phase(uvm_phase phase);
        super.extract_phase(phase);
        coverage=cg_transaction.get_coverage();
        `uvm_info(get_name(),$sformatf("Coverage:%d ",this.coverage), UVM_NONE);
    endfunction: extract_phase
    
    function void report_phase(uvm_phase phase);
        super.report_phase(phase);
        
        
        
    endfunction: report_phase
    
    
    
endclass: cov_monitor
