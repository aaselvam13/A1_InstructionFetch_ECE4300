module incrementer (
    input clk,
    input rst,
    input [31:0] pcin,
    output reg [31:0] pcout
);

    always @(posedge clk or posedge rst) begin
        if (rst)
            pcout <= 32'b0;
        else
            pcout <= pcin + 32'd4;
    end
    

endmodule