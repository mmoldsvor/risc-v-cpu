import cpu_package::alu_function_t;
import cpu_package::instruction_type_t;

module datapath(
    input logic clk,
    input logic reset_n,

    input logic reg_write,
    input logic alu_select,
    input logic dmem_write,
    input logic result_select,
    input logic branch,
    input alu_function_t alu_control,
    input instruction_type_t instruction_type,

    output logic[5:0] imem_reg,
    input logic[31:0] imem_data,

    output logic[5:0] dmem_reg,
    output logic[31:0] dmem_write_data,
    input logic[31:0] dmem_read_data,

    output logic[31:0] instruction
);
    logic[31:0] pc, immediate;

    logic[31:0] reg_data1, reg_data2;

    logic[31:0] alu_b, alu_result;

    logic[31:0] reg_write_data;

    program_counter pc1(
        .clk(clk),
        .reset_n(reset_n),
        .pc(pc)
    );

    assign imem_reg = pc;
    assign instruction = imem_data;

    reg_file reg_file1(
        .clk(clk), 
        .write_enable(reg_write),
        .read_reg1(instruction[19:15]), 
        .read_reg2(instruction[24:20]), 
        .read_data1(reg_data1), 
        .read_data2(reg_data2), 
        .write_reg(instruction[11:7]), 
        .write_data(reg_write_data)
    );

    immediate_decode imm_decode1(
        .instruction_type(instruction_type),
        .instruction(instruction),
        .immediate(immediate)
    );
    
    assign alu_b = alu_select ? immediate : reg_data2;

    alu alu1(
        .alu_control(alu_control),
        .a(reg_data1),
        .b(alu_b),
        .result(alu_result)
    );

    assign dmem_reg = alu_result;
    assign dmem_write_data = reg_data2;

    assign reg_write_data = result_select ? dmem_read_data : alu_result;
endmodule