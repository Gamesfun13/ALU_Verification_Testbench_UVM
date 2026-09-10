interface ALUInterface(input clock,input reset);
    


    logic  [7:0] A,B;                 
    logic  [2:0] ALU_Sel;
    logic  [8:0] ALU_Out;


    modport DUT (input clock,reset, A,B,ALU_Sel,
    output  ALU_Out );



    modport Testbench (

    input clock,reset,ALU_Out,
    output  A,B,ALU_Sel 
    );

endinterface