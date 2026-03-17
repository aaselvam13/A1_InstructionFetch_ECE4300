`timescale 1ns/1ps

module fetch_tb;

    reg clk;
    reg rst;
    reg ex_mem_pc_src;
    reg [31:0] ex_mem_npc;
    wire [31:0] if_id_instr;
    wire [31:0] if_id_npc;

    top instructionFetch (
        .clk(clk),
        .rst(rst),
        .ex_mem_pc_src(ex_mem_pc_src),
        .ex_mem_npc(ex_mem_npc),
        .if_id_instr(if_id_instr),
        .if_id_npc(if_id_npc)
    );

    initial clk = 0;
    always #5 clk = ~clk;

    initial begin
    
        rst = 1; //start values
        ex_mem_pc_src = 0;
        ex_mem_npc = 32'd0;

        #12;
        rst = 0; //start test

        
        #10 ex_mem_pc_src = 0;      //fetches next sequential instruction
        #20 ex_mem_pc_src = 1; 
            ex_mem_npc = 32'd20;   //does a branch to skip a few instructions 
        #10 ex_mem_pc_src = 0;      // back to sequential instructions

        #50;
        $finish;
    end


endmodule
