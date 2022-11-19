import cpu_package::instruction_type_t;

module cpu_imm_decode_tb;
    instruction_type_t instruction_type;
    logic[31:0] instruction;
    logic[31:0] immediate;

    immediate_decode imm_decode1(
        .instruction_type(instruction_type),
        .instruction(instruction),
        .immediate(immediate)
    );

    initial begin
    
        instruction_type <= cpu_package::I_TYPE;
        instruction <= 32'hAAAAAAAA;
        #20;
        instruction_type <= cpu_package::S_TYPE;
        #20;
        instruction_type <= cpu_package::B_TYPE;
    end
endmodule