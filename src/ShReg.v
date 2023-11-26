module ShReg #(parameter n)(serin ,en ,rst ,clk ,clken ,out);
input serin ,en ,rst ,clk ,clken;
output reg[n-1:0] out;

always @(posedge clk ,posedge rst) begin
    if(rst)
        out = 0;
    else if(clken && en)
        out = {out ,serin};
end
endmodule