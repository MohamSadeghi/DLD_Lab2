module MSSD(serin, clkpb, clk, rst, p0 ,p1 ,p2 ,p3 ,done ,valid ,sevseg);
input serin, clkpb, clk, rst;
output p0 ,p1 ,p2 ,p3 ,done ,valid;
output[6:0] sevseg;

wire clken ,co1 ,co2 , cod ,cnt1 ,cnt2 ,cntd ,ldcntd ,shen ,shend ,valid ,done;
wire[1:0] port;
wire[3:0] segdata ,dnsout;

OnePulser OP(.clkpb(clkpb),.clk(clk),.rst(rst),.clken(clken));
Controller C(.clk(clk) ,.clken(clken) ,.rst(rst) ,.serin(serin) ,.co1(co1) ,.co2(co2) ,.cod(cod) ,.cnt1(cnt1) ,.cnt2(cnt2) ,.cntd(cntd) ,.ldcntd(ldcntd) ,.shen(shen) ,.shend(shend) ,.valid(valid) ,.done(done));
Counter #(2)PC(.clk(clk) ,.rst(rst) ,.clken(clken) ,.cnt(cnt1) ,.co(co1));
Counter #(0)DNC(.clk(clk) ,.rst(rst) ,.clken(clken) ,.cnt(cnt2) ,.co(co2));
Demux DM(.serin(serin), .port(port) ,.p0(p0) ,.p1(p1) ,.p2(p2) ,.p3(p3));
LdCounter LC(.clk(clk) ,.rst(rst) ,.clken(clken) ,.data(dnsout) ,.cnt(cntd) ,.ld(ldcntd) ,.co(cod) ,.out(segdata));
ShReg #(2)PNS (.serin(serin) ,.en(shen) ,.rst(rst) ,.clk(clk) ,.clken(clken) ,.out(port));
ShReg #(4)DNS (.serin(serin) ,.en(shend) ,.rst(rst) ,.clk(clk) ,.clken(clken) ,.out(dnsout));
SSD ssd(.inp(segdata) ,.out(sevseg));
endmodule