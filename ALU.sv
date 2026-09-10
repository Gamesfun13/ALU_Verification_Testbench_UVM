module ALU(
    ALUInterface.DUT aif
);
reg [8:0] ALU_Result;

always @(posedge aif.clock) begin
    if(aif.reset)
    aif.ALU_Out<=0;
    else
    aif.ALU_Out<=ALU_Result;
end

always @(*)
begin
 case(aif.ALU_Sel)
 3'b000: // Addition //
    ALU_Result = aif.A + aif.B ; 
 3'b001: // Subtraction //
    ALU_Result = aif.A - aif.B ;
    3'b010: //  Logical and  //
    ALU_Result = aif.A & aif.B;
    3'b011: //  Logical or //
     ALU_Result = aif.A | aif.B;
    3'b100: //  Logical xor  //
     ALU_Result = aif.A ^ aif.B;
 3'b101: // Logical shift left //
    ALU_Result = aif.A<< aif.B[2:0] ;
  3'b110: // Logical shift right //
    ALU_Result = aif.A>>aif.B[2:0] ;
    3'b111: //  pass  //
    ALU_Result = aif.A;
    
   default: ALU_Result = aif.A + aif.B ; 
 endcase
end


endmodule