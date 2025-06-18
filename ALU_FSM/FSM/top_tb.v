module top_tb;


reg clk, reset;
wire [4:0] R;
wire flag;

top uut(
    .clk(clk),
    .reset(reset),
    .R(R),
    .flag(flag)
);

initial begin
    clk = 0;
    forever #5 clk = ~clk;
end

initial begin
    $dumpfile("top_tb_test.vcd");
    $dumpvars(0, top_tb);

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