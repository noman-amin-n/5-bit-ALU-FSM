ALU_tb:
    iverilog -o alu_tb_test.vvp ALU_tb.v ALU.v ALU_AND_5bit.v ALU_ROL_5bit.v
    vvp alu_tb_test.vvp
    gtkwave alu_test.vcd

controller_tb:
    iverilog -o controller_tb_test.vvp controller_tb.v controller.v
    vvp controller_tb_test.vvp
    gtkwave controller_tb_test.vcd

top_tb:
    iverilog -o top_tb_test.vvp top_tb.v top.v controller.v ALU.v ALU_AND_5bit.v ALU_ROL_5bit.v
    vvp top_tb_test.vvp
    gtkwave top_tb_test.vcd