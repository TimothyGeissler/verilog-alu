module sll_four(in, shift, out);
input [31:0] in;
input shift;
output [31:0] out;
wire [31:0] temp;

assign temp[3:0] = 0;
assign temp[31:4] = in[26:0];

assign out = (shift == 1) ? temp : in;

endmodule