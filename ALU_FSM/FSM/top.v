module top
(
    input wire clk, reset,
    output wire [4:0] R,
    output wire flag
);

wire [4:0] A,B;
wire OP;
wire [4:0] R_result;
wire R_ZF;

controller controller1 (
    .clk(clk),
    .reset(reset),
    .A(A),
    .B(B),
    .OP(OP)
);

ALU datapath1 (
    .A(A),
    .B(B),
    .OP(OP),
    .R(R_result),
    .ZF(R_ZF)
);

assign R = R_result;
assign flag = ~R_ZF;

endmodule