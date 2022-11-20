module alu_decode(
    input instruction_type_t instruction_type,
    input logic[2:0] funct3,
    input logic[6:0] funct7,

    output alu_function_t alu_control
);
    always_comb begin
        alu_control = ALU_ADD;

        if (instruction_type == R_TYPE) begin
            case (funct7)
                7'b0000000: begin
                    alu_control = ALU_ADD;
                end
                7'b0100000: begin
                    alu_control = ALU_SUB;
                end
            endcase
        end

        if (instruction_type == B_TYPE) begin
            alu_control = ALU_SUB;
        end
    end
endmodule