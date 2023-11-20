module SSD(inp ,out);
input[3:0] inp;
output reg[6:0] out;

parameter _0 = 7'h40;
parameter _1 = 7'h79;
parameter _2 = 7'h24;
parameter _3 = 7'h30;
parameter _4 = 7'h19;
parameter _5 = 7'h12;
parameter _6 = 7'h02;
parameter _7 = 7'h78;
parameter _8 = 7'h00;
parameter _9 = 7'h10;
parameter _a = 7'h08;
parameter _b = 7'h03;
parameter _c = 7'h46;
parameter _d = 7'h21;
parameter _e = 7'h06;
parameter _f = 7'h0e;

always @(inp) begin
    out = 0;
    case (inp)
        0: out = _0; 
        1: out = _1; 
        2: out = _2; 
        3: out = _3; 
        4: out = _4; 
        5: out = _5; 
        6: out = _6; 
        7: out = _7; 
        8: out = _8; 
        9: out = _9; 
        10: out = _a; 
        11: out = _b; 
        12: out = _c; 
        13: out = _d; 
        14: out = _e; 
        15: out = _f; 
        default: out = 7'bx;
    endcase
end
endmodule