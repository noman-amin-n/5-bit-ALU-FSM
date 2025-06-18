module ALU
(
    input wire [4:0] A, B,                   
    input wire OP,    
    output reg [4:0] R,     
    output wire CF,
    output wire SF,
    output wire ZF           
);

    // reg Sel;
    wire [4:0] R_AND, R_ROL;
    // wire CF_ADD_SUB;

    // Instantiate modules

    ALU_AND_5bit and1 (.A(A), .B(B), .R(R_AND));
    ALU_ROL_5bit rol1 (.A(A), .B(B[2:0]), .R(R_ROL));


    always @(*) 
    begin
        case (OP)
            1'b0: // AND
                begin 
                    R = R_AND;
                end
            1'b1: // ROL
                begin 
                    R = R_ROL;
                end
            default: 
                begin
                    R = 5'b00000;  
                end
        endcase
    end

    assign CF = 1'b0;
    assign SF = R[4];
    assign ZF = ~(R[4] | R[3] | R[2]| R[1]| R[0]);

endmodule
