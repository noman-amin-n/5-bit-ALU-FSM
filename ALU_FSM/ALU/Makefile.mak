ALU_tb:
    iverilog -o alu_tb_test.vvp ALU_tb.v ALU.v ALU_AND_5bit.v ALU_ROL_5bit.v
    vvp alu_tb_test.vvp
    gtkwave alu_test.vcd