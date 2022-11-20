module instr_memory #(
    parameter memory_file="imem.mem",
    parameter memory_size=64,
    parameter memory_addr_size=6
)(
    input logic[memory_addr_size-1:0] read_reg,
    output logic[31:0] read_data
);
    logic[7:0] memory_block [memory_size-1:0];

    initial begin
        // This is a temporary memory element
        // Which should be replaced with something that can be written to in a proper manner

        $readmemh(memory_file, memory_block);
    end

    assign read_data = {memory_block[read_reg], memory_block[read_reg+1], memory_block[read_reg+2], memory_block[read_reg+3]};
endmodule