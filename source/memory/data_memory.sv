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
    logic[7:0] memory_block [memory_size-1:0];

    assign read_data = {memory_block[read_reg], memory_block[read_reg+1], memory_block[read_reg+2], memory_block[read_reg+3]};

    always_ff @(posedge clk) begin
        if (write_enable) begin
            memory_block[write_reg] <= write_data[31:24];
            memory_block[write_reg+1] <= write_data[23:16];
            memory_block[write_reg+2] <= write_data[15:8];
            memory_block[write_reg+3] <= write_data[7:0];
        end
    end
endmodule