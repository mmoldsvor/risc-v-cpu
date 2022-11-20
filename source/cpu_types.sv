package cpu_package;
    typedef enum {
        ALU_ADD = 3'b000,
        ALU_SUB = 3'b001,
        ALU_AND = 3'b010,
        ALU_OR  = 3'b011
    } alu_function_t;

    typedef enum {
        R_TYPE = 0,
        I_TYPE,
        S_TYPE,
        B_TYPE,
        U_TYPE,
        J_TYPE
    } instruction_type_t;
endpackage