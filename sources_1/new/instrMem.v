module instrMem(
    input clk,
    input rst,
    input  [31:0] addr,
    output reg [31:0] data
);

    reg [31:0] memory [0:1023]; //2^10 instead of 2^32

    initial begin
        memory[0] = 32'hA00000AA;
        memory[1] = 32'h10000011;
        memory[2] = 32'h20000022;
        memory[3] = 32'h30000033;
        memory[4] = 32'h40000044;
        memory[5] = 32'h50000055;
        memory[6] = 32'h60000066;
        memory[7] = 32'h70000077;
        memory[8] = 32'h80000088;
        memory[9] = 32'h90000099;
    end
    
    always @(posedge clk or posedge rst) begin
        if (rst)
            data <= 32'b0;
        else
            data <= memory[addr[31:2]];
    end
    
endmodule