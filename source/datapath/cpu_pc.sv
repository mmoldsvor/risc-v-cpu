module program_counter(
    input logic clk,
    input logic reset_n,
    output logic[31:0] pc
);
    logic[31:0] pc_next;

    always_ff @(posedge clk, negedge reset_n) begin
        if (!reset_n)
            pc_next <= 0;
        else
            pc_next <= pc + 4;
    end

    assign pc = pc_next;
endmodule