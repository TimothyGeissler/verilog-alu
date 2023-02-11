`include "alu_modules/cla/cla_32bit.v"
`include "alu_modules/lftshft/sll.v"
`include "alu_modules/rightshft_a/sra.v"
`include "alu_modules/boolean/and.v"
`include "alu_modules/boolean/or.v"
`include "alu_modules/mux/mux.v"
`include "alu_modules/not/not.v"

module alu(data_operandA, data_operandB, ctrl_ALUopcode, ctrl_shiftamt, data_result, isNotEqual, isLessThan, overflow);
        
    input [31:0] data_operandA, data_operandB;
    input [4:0] ctrl_ALUopcode, ctrl_shiftamt;

    output [31:0] data_result;
    output isNotEqual, isLessThan, overflow;

    wire [31:0] alu_out, sll_out, sra_out, or_out, and_out, sub_mux_out, inv_dataB;

    wire cout, cin_mux;

    //Get !B
    not_gate big_not(data_operandB, inv_dataB);
    //Sub mux between B and !B
    basemux sub_mux(data_operandB, inv_dataB, ctrl_ALUopcode[0], sub_mux_out);


    // Init ALU components
    cla_32bit cla(data_operandA, sub_mux_out, ctrl_ALUopcode[0], alu_out, cout, isNotEqual, isLessThan, overflow);
    sll left_shifter(data_operandA, ctrl_shiftamt, sll_out);
    sra right_arith_shifter(data_operandA, ctrl_shiftamt, sra_out);
    or_gate big_or(or_out, data_operandA, data_operandB);
    and_gate big_and(and_out, data_operandA, data_operandB);

    //Mux together mux(a, b, c, d, e, f, g, h, select, out);
    mux combo_mux(alu_out, alu_out, and_out, or_out, sll_out, sra_out, 32'b0, 32'b0, ctrl_ALUopcode[2:0], data_result);

endmodule