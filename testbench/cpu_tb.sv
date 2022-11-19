module cpu_tb;
    logic clk, reset_n;
    logic dmem_write;
    logic[5:0] imem_reg, dmem_reg;
    logic[31:0] imem_data, dmem_read_data, dmem_write_data;

    always #10 clk = ~clk;

    cpu_core cpu_core1(
        .clk(clk),
        .reset_n(reset_n),

        .imem_reg(imem_reg),
        .imem_data(imem_data),

        .dmem_write(dmem_write),
        .dmem_reg(dmem_reg),
        .dmem_write_data(dmem_write_data),
        .dmem_read_data(dmem_read_data)
    );

    instr_memory instr_memory1(
        .read_reg(imem_reg),
        .read_data(imem_data)
    );
    
    data_memory data_memory1(
        .clk(clk),
        .write_enable(dmem_write),
        .read_reg(dmem_reg),
        .read_data(dmem_read_data),
        .write_reg(dmem_reg),
        .write_data(dmem_write_data)
    );
    
    initial begin
        clk <= 0;
        reset_n <= 0;
        #20;
        reset_n <= 1;
    end
endmodule