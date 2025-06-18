module ALU_ROL_5bit 
(
    input [4:0] A,
    input [2:0] B,  
    output reg [4:0] R
);


    always @(*) begin
        case(B)
            3'b000: R = A;                     
            3'b001: R = {A[3:0], A[4]};       
            3'b010: R = {A[2:0], A[4:3]};      
            3'b011: R = {A[1:0], A[4:2]};       
            3'b100: R = {A[0], A[4:1]};
            3'b101: R = A;
            3'b110: R = {A[3:1], A[4]}; // repeat rotations if the value is greater than 5
            3'b111: R = {A[2:0], A[4:3]}; // repeat rotations if the value is greater than 5
            default: R = A;                   
        endcase
    end
    
endmodule
