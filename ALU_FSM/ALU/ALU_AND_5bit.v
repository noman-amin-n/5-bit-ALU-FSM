module ALU_AND_5bit 
(
    input wire [4:0] A,B,  
    output wire [4:0] R    
);
    assign R = (A & B);

endmodule
