module TB();
reg serin ,clkpb , rst , clk;
wire p0 ,p1 ,p2 ,p3 ,done ,valid;
wire[6:0] ssd;
MSSD all(.serin(serin), .clkpb(clkpb), .clk(clk), .rst(rst), .p0(p0) ,.p1(p1) ,.p2(p2) ,.p3(p3) ,.done(done) ,.valid(valid) ,.sevseg(ssd));

always begin
    #10 clk=~clk;
end

initial begin
    clkpb = 0;
    rst = 1;
    serin = 1;
    clk = 0;
    #20 rst = 0;
    
    #30 serin = 0;//0
    #50 clkpb = 1;
    #50 clkpb = 0;

    #30 serin = 1;//10
    #50 clkpb = 1;
    #50 clkpb = 0;
    #30 serin = 0;
    #50 clkpb = 1;
    #50 clkpb = 0;

    #30 serin = 0;//0011
    #50 clkpb = 1;
    #50 clkpb = 0;
    #30 serin = 0;
    #50 clkpb = 1;
    #50 clkpb = 0;
    #30 serin = 1;
    #50 clkpb = 1;
    #50 clkpb = 0;
    #30 serin = 1;
    #50 clkpb = 1;
    #50 clkpb = 0;

    #30 serin = 1;//110
    #50 clkpb = 1;
    #50 clkpb = 0;
    #30 serin = 1;
    #50 clkpb = 1;
    #50 clkpb = 0;
    #30 serin = 0;
    #50 clkpb = 1;
    #50 clkpb = 0;

    #30 serin = 1;
    #50 clkpb = 1;
    #50 clkpb = 0;
    #30 serin = 1;
    #50 clkpb = 1;
    #50 clkpb = 0;

    #30 rst = 0;//rst
    #50 clkpb = 1;
    #50 clkpb = 0;

    #30 serin = 0;//0
    #50 clkpb = 1;
    #50 clkpb = 0;

    #30 serin = 1;//10
    #50 clkpb = 1;
    #50 clkpb = 0;
    #30 serin = 0;
    #50 clkpb = 1;
    #50 clkpb = 0;

    #30 serin = 0;//0011
    #50 clkpb = 1;
    #50 clkpb = 0;
    #30 serin = 0;
    #50 clkpb = 1;
    #50 clkpb = 0;
    #30 serin = 1;
    #50 clkpb = 1;
    #50 clkpb = 0;
    #30 serin = 1;
    #50 clkpb = 1;
    #50 clkpb = 0;

    #30 serin = 1;//110
    #50 clkpb = 1;
    #50 clkpb = 0;
    #30 serin = 1;
    #50 clkpb = 1;
    #50 clkpb = 0;
    #30 serin = 0;
    #50 clkpb = 1;
    #50 clkpb = 0;

    #30 serin = 1;
    #50 clkpb = 1;
    #50 clkpb = 0;
    #30 serin = 1;
    #50 clkpb = 1;
    #50 clkpb = 0;
    #50 clkpb = 1;
    #50 clkpb = 0;
    #50 clkpb = 1;
    #50 clkpb = 0;
    #50 clkpb = 1;
    #50 clkpb = 0;
    #50 clkpb = 1;
    #50 clkpb = 0;

    #1000 $stop;
end

endmodule