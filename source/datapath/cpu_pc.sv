module program_counter(
    input logic clk,
    input logic reset_n,

    input logic pc_select,
    input logic[31:0] branch_offset,

    output logic[31:0] pc
);
    logic[31:0] pc_next;
    logic[31:0] pc_normal, pc_branch;

    always_ff @(posedge clk, negedge reset_n) begin
        if (!reset_n)
            pc <= 0;
        else
            pc <= pc_next;
    end

    assign pc_normal = pc + 4;
    assign pc_branch = pc + branch_offset;
    assign pc_next = pc_select ? pc_branch : pc_normal;
endmodule