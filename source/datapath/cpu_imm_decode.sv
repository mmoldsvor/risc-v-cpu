import cpu_package::instruction_type_t;

module immediate_decode(
    input instruction_type_t instruction_type,
    input logic[31:0] instruction,
    output logic[31:0] immediate
);

    always_comb begin
        case (instruction_type)
            cpu_package::I_TYPE:
                immediate = {{20{instruction[31]}}, instruction[31:20]};
            cpu_package::S_TYPE:
                immediate = {{20{instruction[31]}}, instruction[31:25], instruction[11:7]};
            cpu_package::B_TYPE:
                immediate = {{19{instruction[31]}}, instruction[31], instruction[7], instruction[30:25], instruction[11:8], 1'b0};
            default:
                // Not required when all instructions types are implemented
                immediate = 0;
        endcase
    end
endmodule