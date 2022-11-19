import cpu_package::alu_function_t;

module cpu_alu_tb;
    alu_function_t alu_control;
    logic[31:0] a, b, result;

    alu alu1(.alu_control(alu_control), .a(a), .b(b), .result(result));

    initial begin
        a <= 3;
        b <= 6;
        alu_control <= cpu_package::ADD;
    end
endmodule