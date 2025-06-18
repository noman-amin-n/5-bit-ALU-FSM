module controller_tb;

reg clk, reset;
wire [4:0] A, B;
wire OP;

controller uut(
    .clk(clk),
    .reset(reset),
    .A(A),
    .B(B),
    .OP(OP)
);

initial begin
    clk = 0;
    forever #5 clk = ~clk;
end


initial begin
    $dumpfile("controller_tb_test.vcd");
    $dumpvars(0, controller_tb);

    reset = 1;
    #30;

    reset = 0;
    #30;

    reset = 1;
    #30;

    reset = 0;
    #100;
    $finish;
end


endmodule