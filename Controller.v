module Controller(clk ,clken ,rst ,serin ,co1 ,co2 ,cod ,cnt1 ,cnt2 ,cntd ,ldcntd ,shen ,shend ,valid ,done);
input serin ,co1 ,co2 ,cod ,clk ,rst ,clken;
output cnt1 ,cnt2 ,cntd ,ldcntd ,shen ,shend ,valid ,done;

parameter IDLE = 3'b000 , PORT = 3'b001 , NUM = 3'b010 , DATA = 3'b011 , DONE = 3'b100 , LDC = 3'b101;

reg[2:0] ns ,ps;

always @(posedge clk,posedge rst) begin
    if(rst)
        ps = IDLE;
    else if(clken) ps = ns;
end

assign done = ps == DONE;
assign cnt1 = ps == PORT;
assign cnt2 = ps == NUM;
assign cntd = ps == DATA;
assign ldcntd = ps == LDC;
assign shen = ps == PORT;
assign shend = ps == NUM;
assign valid = (ps == DATA)||(ps == LDC);


always @(serin ,co1 ,co2 ,cod, ps) begin
    ns = 3'bxx;
    case (ps)
        IDLE: ns = serin ? IDLE : PORT;
        PORT: ns = co1 ? NUM : PORT;
        NUM: ns = co2 ? LDC : NUM;
        DATA: ns = cod ? DONE : DATA;
        DONE: ns = serin ? IDLE : PORT;
        LDC: ns = DATA;
        default: ns = 3'bxx;
    endcase
end

endmodule