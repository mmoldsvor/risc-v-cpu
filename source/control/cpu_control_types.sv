package cpu_control_package;
    enum logic[6:0] {
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

    enum logic[2:0] {
        SW = 3'b010
    } store_funct_t;

    enum logic[2:0] {
        LW = 3'b010
    } load_funct_t; 
endpackage