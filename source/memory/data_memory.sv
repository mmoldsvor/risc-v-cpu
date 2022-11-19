module data_memory #(
    parameter memory_size=64,
    parameter memory_addr_size=6
)(
    input logic clk,
    input logic write_enable,
    
    input logic[memory_addr_size-1:0] read_reg,
    output logic[31:0] read_data,

    input logic[memory_addr_size-1:0] write_reg,
    input logic[31:0] write_data
);
    logic[31:0] memory_block [memory_size-1:0];

    assign read_data = memory_block[read_reg];

    always_ff @(posedge clk) begin
        if (write_enable) begin
            memory_block[write_reg] <= write_data;
        end
    end
endmodule