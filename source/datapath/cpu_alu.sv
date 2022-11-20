import cpu_package::*;

module alu (
    input alu_function_t alu_control,

    input logic[31:0] a,
    input logic[31:0] b,

    output logic[31:0] result
);
    logic[31:0] b_inverted;
    logic[31:0] b_selected;
    logic[31:0] and_result;
    logic[31:0] or_result;
    logic[31:0] sum;
    logic carry_in;

    assign and_result = a & b;
    assign or_result = a | b;

    assign b_inverted = ~b;
    assign b_selected = alu_control == ALU_SUB ? b_inverted : b;
    assign carry_in   = alu_control == ALU_SUB ? 1 : 0;
    
    assign sum = a + b_selected + carry_in;

    always_comb begin
        case (alu_control)
            ALU_AND:
                result = and_result;
            ALU_OR:
                result = or_result;
            default:
                result = sum;
        endcase
    end
endmodule