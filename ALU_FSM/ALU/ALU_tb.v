`timescale 1ns/1ps
module ALU_tb;
    reg [4:0] A, B;       
    reg OP;          
    wire [4:0] R;          
    wire CF;
    wire SF;
    wire ZF;

    ALU uut (
        .A(A),
        .B(B),
        .OP(OP),
        .R(R),
        .CF(CF),
        .SF(SF),
        .ZF(ZF)
    );

    initial begin
        $dumpfile("alu_test.vcd");
        $dumpvars(0, ALU_tb);

        A = 5'b11100; B = 5'b11000; OP = 1'b0;
        #10;

        A = 5'b10100; B = 5'b00010; OP = 1'b1;
        #10;
        
        A = 5'b11100; B = 5'b00100; OP = 1'b1;
        #10;
        
        A = 5'b01110; B = 5'b10100; OP = 1'b0;
        #10;

        $finish;
    end

    initial begin
        $monitor("Time=%0t A=%b B=%b OP=%b -> R=%b CF=%b ZF=%b SF=%b", $time, A, B, OP, R, CF, ZF, SF);
    end

endmodule
