module memory_tb;
    logic clk, write_enable;
    logic[5:0] imem_read_reg, dmem_read_reg, write_reg;
    logic[31:0] imem_read_data, dmem_read_data;

    always #10 clk = ~clk;

    instr_memory instr_memory1(
        .read_reg(imem_read_reg),
        .read_data(imem_read_data)
    );
    
    data_memory data_memory1(
        .clk(clk),
        .write_enable(write_enable),
        .read_reg(dmem_read_reg),
        .read_data(dmem_read_data),
        .write_reg(write_reg),
        .write_data(imem_read_data)
    );
    
    initial begin
        clk <= 0;
        write_enable <= 0;

        imem_read_reg <= 0;
        dmem_read_reg <= 0;
        write_reg <= 0;
        #20;
        write_enable = 1;
        #20;
        imem_read_reg <= 1;
        write_reg <= 2;
        #20;
        imem_read_reg <= 2;
        write_reg <= 4;
        #20;
        imem_read_reg <= 3;
        write_reg <= 6;

        #20;
        write_enable <= 0;
        #20;
        dmem_read_reg <= 2;
        #20;
        dmem_read_reg <= 4;
        #20;
        dmem_read_reg <= 6;
    end
endmodule