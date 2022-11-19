package cpu_package;
    typedef enum {
        ADD = 3'b000,
        SUB = 3'b001,
        AND = 3'b010,
        OR  = 3'b011
    } alu_function_t;

    typedef enum {
        R_TYPE = 0,
        I_TYPE,
        S_TYPE,
        B_TYPE,
        U_TYPE,
        J_TYPE
    } instruction_type_t;

    typedef enum {
        LOAD        = 7'b0000011,
        MISC_MEM    = 7'b0001111,
        OP_IMM      = 7'b0010011,
        AUIPC       = 7'b0010111,
        STORE       = 7'b0100011,
        OP          = 7'b0110011,
        LUI         = 7'b0110111,
        BRANCH      = 7'b1100011,
        JALR        = 7'b1100111,
        JAL         = 7'b1101111,
        SYSTEM      = 7'b1110011
    } opcode_type_t;
endpackage