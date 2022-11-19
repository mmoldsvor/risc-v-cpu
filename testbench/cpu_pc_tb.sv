module cpu_pc_tb;
    logic clk, reset_n;
    logic[31:0] pc, imem_data;

    always #10 clk = ~clk;

    program_counter pc1(
        .clk(clk),
        .reset_n(reset_n),
        .pc(pc)
    );

    instr_memory instr_memory1(
        .read_reg(pc),
        .read_data(imem_data)
    );
    
    initial begin
        clk <= 0;
        reset_n <= 0;
        #20;
        reset_n <= 1;
    end
endmodule