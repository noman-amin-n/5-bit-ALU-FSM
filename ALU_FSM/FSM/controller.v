module controller(
    input wire clk, reset,
    output reg [4:0] A, B,
    output reg OP
);


reg [2:0] pstate, nstate;

parameter [2:0] START       = 3'b000,
                ONE         = 3'b001,
                TWO         = 3'b010,
                THREE       = 3'b011,
                FINISH      = 3'b100;


always @(posedge clk or posedge reset)
begin
    if(reset)
        pstate <= START;
    else
        pstate <= nstate; 
end

always @(*)
begin

    A = 5'b00000;
    B = 5'b00000;
    OP = 1'b0;
    nstate = pstate;

    case (pstate)
        START:
        begin
            nstate = ONE;
        end
        ONE:
        begin
            A = 5'b11100;
            B = 5'b00011;
            OP = 1'b0;
            nstate = TWO;
        end
        TWO:
        begin
            
            A = 5'b10100;
            B = 5'b00010;
            OP = 1'b1;
            nstate = THREE;
        end
        THREE:
        begin
            
            A = 5'b11100;
            B = 5'b00100;
            OP = 1'b1;
            nstate = FINISH;
        end
        FINISH:
        begin
            nstate = START;
        end

        default: nstate = START;
    endcase
            
end

endmodule