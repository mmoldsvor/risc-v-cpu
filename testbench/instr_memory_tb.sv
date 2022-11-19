module instr_memory_tb;
    logic[5:0] read_reg;
    logic[32:0] read_data;

    instr_memory instr_memory1(.read_reg(read_reg), .read_data(read_data));
    
    initial begin
        read_reg <= 0;
        #40;
        read_reg <= 2;
    end
endmodule