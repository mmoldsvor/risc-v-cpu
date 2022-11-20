import cpu_control_package::*;

module control_decode(
    input opcode_type_t opcode, 
    input logic[2:0] funct3,

    output logic reg_write,
    output logic alu_select,
    output logic dmem_write,
    output logic result_select,
    output logic branch,
    output instruction_type_t instruction_type
);
    always_comb begin
        reg_write = 0;
        alu_select = 0;
        dmem_write = 0;
        result_select = 0;
        branch = 0;

        instruction_type = R_TYPE;

        if (opcode == LOAD) begin
            instruction_type = I_TYPE;
            case (funct3)
                LW: begin
                    reg_write = 1;
                    alu_select = 1;
                    dmem_write = 0;
                    result_select = 1;
                    branch = 0;
                end
            endcase
        end

        if (opcode == STORE) begin
            instruction_type = S_TYPE;
            case (funct3)
                SW: begin
                    reg_write = 0;
                    alu_select = 1;
                    dmem_write = 1;
                    branch = 0;
                end
            endcase
        end

        if (opcode == OP_IMM) begin
            instruction_type = I_TYPE;
            
            reg_write = 1;
            alu_select = 1;
            dmem_write = 0;
            result_select = 0;
            branch = 0;
        end

        if (opcode == OP) begin
            instruction_type = R_TYPE;

            reg_write = 1;
            alu_select = 0;
            dmem_write = 0;
            result_select = 0;
            branch = 0;
        end

        if (opcode == BRANCH) begin
            instruction_type = B_TYPE;
        end
    end
endmodule