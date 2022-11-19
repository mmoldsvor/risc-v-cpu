module reg_file(
    input logic clk,
    input logic write_enable,

    input logic[4:0] read_reg1,
    input logic[4:0] read_reg2,

    output logic[31:0] read_data1,
    output logic[31:0] read_data2,

    input logic[4:0] write_reg,
    input logic[31:0] write_data
);
    logic[31:0] registers [31:0];

    assign read_data1 = registers[read_reg1];
    assign read_data2 = registers[read_reg2];

    assign registers[0] = 0;

    always_ff @(posedge clk) begin
        if (write_enable && write_reg !== 0) begin
            registers[write_reg] <= write_data;
        end
    end
endmodule