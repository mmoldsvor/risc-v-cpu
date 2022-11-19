module cpu_regfile_tb;
    logic clk, write_enable;
    logic[4:0] read_reg1, read_reg2, write_reg;
    logic[31:0] read_data1, read_data2, write_data;

    always #10 clk = ~clk;
    
    reg_file reg_file1(
        .clk(clk), 
        .write_enable(write_enable), 
        .read_reg1(read_reg1), 
        .read_reg2(read_reg2), 
        .read_data1(read_data1), 
        .read_data2(read_data2), 
        .write_reg(write_reg), 
        .write_data(write_data)
    );

    initial begin
        clk <= 0;
        read_reg1 <= 1;
        read_reg2 <= 0;
        write_enable <= 1;
        write_reg <= 1;
        write_data <= 32'hAAAAAAAA;
        #40;

        write_reg <= 8;
        write_data <= 32'hFFFFFFFF;
        #40;

        read_reg1 <= 8;
        read_reg2 <= 1;

        #40;

        write_reg <= 0;
        write_data <= 32'hCCCCCCCC;
        read_reg1 <= 0;
    end
endmodule