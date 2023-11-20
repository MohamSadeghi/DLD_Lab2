module Demux(serin, port ,p0 ,p1 ,p2 ,p3);
input serin;
input[1:0] port;
output p0 ,p1 ,p2 ,p3;

assign p0 = port == 0 ? serin : 1'b0; 
assign p1 = port == 1 ? serin : 1'b0; 
assign p2 = port == 2 ? serin : 1'b0; 
assign p3 = port == 3 ? serin : 1'b0; 
endmodule