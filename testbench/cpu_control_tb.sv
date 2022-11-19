import cpu_package::*;

module cpu_control_tb;
    alu_function_t alu_control;
    instruction_type_t instruction_type;
    logic reg_write, alu_select, dmem_write, result_select, branch;
    
    logic[31:0] instruction;
    logic alu_equal;


    control control1(
        .instruction(instruction),
        .alu_equal(alu_equal),
        .reg_write(reg_write),
        .alu_select(alu_select),
        .dmem_write(dmem_write),
        .result_select(result_select),
        .branch(branch),
        .alu_control(alu_control),
        .instruction_type(instruction_type)
    );

    initial begin
        alu_equal <= 0;
        instruction <= 32'h0014A303;
    end
endmodule