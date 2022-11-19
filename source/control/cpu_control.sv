import cpu_package::*;

module control(
    input logic[31:0] instruction,
    input logic alu_equal,

    output alu_function_t alu_control,
    output instruction_type_t instruction_type
);
    opcode_type_t opcode;

    assign opcode[6:0] = instruction[6:0];

    always_comb begin
        if (opcode == LOAD || opcode == OP_IMM || opcode == JALR || opcode == SYSTEM)
             instruction_type = I_TYPE;
        
        if (opcode == STORE)
            instruction_type = S_TYPE;

        if (opcode == BRANCH)
            instruction_type = B_TYPE;

        if (opcode == OP)
            instruction_type = R_TYPE;

        if (opcode == LUI || opcode == AUIPC)
            instruction_type = U_TYPE;

        if (opcode == JAL)
            instruction_type = J_TYPE;
    end
endmodule;