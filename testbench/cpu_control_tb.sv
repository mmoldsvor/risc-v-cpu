import cpu_package::*;

module cpu_control_tb;
    alu_function_t alu_control;
    instruction_type_t instruction_type;
    
    logic[31:0] instruction;
    logic alu_equal;

    control control1(
        .instruction(instruction),
        .alu_equal(alu_equal),
        .alu_control(alu_control),
        .instruction_type(instruction_type)
    );

    initial begin
        alu_equal <= 0;
        instruction <= {{25{1'b0}}, 7'b0000011};
    end
endmodule