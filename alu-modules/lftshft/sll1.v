module sll_one(in, shift, out);
input [31:0] in;
input shift;
output [31:0] out;
wire [31:0] temp;

assign temp[0] = 0;
assign temp[31:1] = in[30:0];

assign out = (shift == 1) ? temp : in;

endmodule