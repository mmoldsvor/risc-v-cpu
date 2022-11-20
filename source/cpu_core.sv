import cpu_package::*;

module cpu_core(
    input logic clk,
    input logic reset_n,

    output logic[5:0] imem_reg,
    input logic[31:0] imem_data,

    output logic dmem_write,
    output logic[5:0] dmem_reg,
    output logic[31:0] dmem_write_data,
    input logic[31:0] dmem_read_data
);
    alu_function_t alu_control;
    instruction_type_t instruction_type;
    logic reg_write, alu_select, result_select, pc_select;
    logic alu_zero;

    logic[31:0] instruction;

    control control1(
        .instruction(instruction),
        .alu_zero(alu_zero),
        .reg_write(reg_write),
        .alu_select(alu_select),
        .dmem_write(dmem_write),
        .result_select(result_select),
        .pc_select(pc_select),
        .alu_control(alu_control),
        .instruction_type(instruction_type)
    );

    datapath datapath1(
        .clk(clk),
        .reset_n(reset_n),
        .reg_write(reg_write),
        .alu_select(alu_select),
        .dmem_write(dmem_write),
        .result_select(result_select),
        .pc_select(pc_select),
        .alu_control(alu_control),
        .instruction_type(instruction_type),

        .imem_reg(imem_reg),
        .imem_data(imem_data),

        .dmem_reg(dmem_reg),
        .dmem_write_data(dmem_write_data),
        .dmem_read_data(dmem_read_data),
        
        .alu_zero(alu_zero),
        .instruction(instruction)
    );
endmodule