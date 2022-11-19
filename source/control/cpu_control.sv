import cpu_package::*;
import cpu_control_package::*;

module control(
    input logic[31:0] instruction,
    input logic alu_equal,

    output logic reg_write,
    output logic alu_select,
    output logic dmem_write,
    output logic result_select,
    output logic branch,
    output alu_function_t alu_control,
    output instruction_type_t instruction_type
);
    logic[6:0] opcode;
    logic[2:0] funct3;

    assign opcode = instruction[6:0];
    assign funct3 = instruction[14:12];

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

        if (opcode == BRANCH) begin
            instruction_type = B_TYPE;
        end
    end
endmodule