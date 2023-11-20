module Counter #(parameter load) (clk ,rst ,clken ,cnt ,co);
    input clk ,rst ,clken ,cnt;
    output co;

    reg[1:0] ps;


    always @(posedge clk, posedge rst) begin
        if(rst) 
            ps = load;
        else if(clken && cnt)
            ps = ps + 1;
    end

    assign co = ps == 2'b11;
endmodule

module LdCounter (clk ,rst ,clken ,data ,cnt ,ld ,co ,out);
    input clk ,rst ,clken ,cnt ,ld;
    input[3:0] data;
    output co;
    output reg[3:0] out;

    always @(posedge clk, posedge rst) begin
        if(rst) 
            out = 0;
        else if(ld && clken)
            out = data - 1;
        else if(clken && cnt)
            out = out - 1;
    end

    assign co = out == 1;
endmodule