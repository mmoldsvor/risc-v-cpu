module instr_memory #(
    parameter memory_size=64,
    parameter memory_addr_size=6
)(
    input logic[memory_addr_size-1:0] read_reg,
    output logic[32:0] read_data
);
    logic[31:0] memory_block [memory_size-1:0];

    initial begin
        // This is a temporary memory element
        // Which should be replaced with something that can be written to in a proper manner

        $readmemh("./memory_test.mem", memory_block);
    end

    assign read_data = memory_block[read_reg];
endmodule