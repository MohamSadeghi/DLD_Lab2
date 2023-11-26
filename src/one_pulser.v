module OnePulser(clkpb , clk , rst , clken);
input clkpb , clk , rst;
output clken;

parameter A = 2'b00 , B = 2'b01 , C = 2'b10;

reg [1:0]ps;
reg [1:0]ns;

always @(posedge clk , posedge rst) begin
    if(rst)
        ps = A;
    else
        ps = ns;
end

assign clken = ps == B;

always @(ps , clkpb) begin
    ns = A;
    case (ps)
        A: ns = clkpb ? B : A; 
        B: ns = C; 
        C: ns = clkpb ? C : A; 
        default: ns = 2'bxx;
    endcase
end

endmodule