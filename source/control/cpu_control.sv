import cpu_package::*;
import cpu_control_package::*;

module control(
    input logic[31:0] instruction,
    input logic alu_zero,

    output logic reg_write,
    output logic alu_select,
    output logic dmem_write,
    output logic result_select,
    output logic pc_select,
    output alu_function_t alu_control,
    output instruction_type_t instruction_type
);
    opcode_type_t opcode;

    assign opcode[6:0] = instruction[6:0];

    control_decode control_decode1(
        .opcode(opcode),
        .funct3(instruction[14:12]),
        .reg_write(reg_write),
        .alu_select(alu_select),
        .dmem_write(dmem_write),
        .result_select(result_select),
        .branch(branch),
        .instruction_type(instruction_type)
    );

    alu_decode alu_decode1(
        .instruction_type(instruction_type),
        .funct3(instruction[14:12]),
        .funct7(instruction[31:25]),

        .alu_control(alu_control)
    );

    assign pc_select = alu_zero & branch;
endmodule