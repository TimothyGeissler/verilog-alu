module sll_one(in, shift, out);
input [31:0] in;
input shift;
output [31:0] out;
wire [31:0] temp;

assign temp[0] = 0;
assign temp[31:1] = in[30:0];

assign out = (shift == 1) ? temp : in;

endmodule

module sll_two(in, shift, out);
input [31:0] in;
input shift;
output [31:0] out;
wire [31:0] temp;

assign temp[1:0] = 0;
assign temp[31:2] = in[29:0];

assign out = (shift == 1) ? temp : in;

endmodule

module sll_four(in, shift, out);
input [31:0] in;
input shift;
output [31:0] out;
wire [31:0] temp;

assign temp[3:0] = 0;
assign temp[31:4] = in[26:0];

assign out = (shift == 1) ? temp : in;

endmodule

module sll_eight(in, shift, out);
input [31:0] in;
input shift;
output [31:0] out;
wire [31:0] temp;

assign temp[7:0] = 0;
assign temp[31:8] = in[23:0];

assign out = (shift == 1) ? temp : in;

endmodule

module sll_steen(in, shift, out);
input [31:0] in;
input shift;
output [31:0] out;
wire [31:0] temp;

assign temp[15:0] = 0;
assign temp[31:16] = in[15:0];

assign out = (shift == 1) ? temp : in;

endmodule

module sll(in, shift, out); //https://esrd2014.blogspot.com/p/barrel-shifter.html
    input [31:0] in;
    output [31:0] out;
    input [4:0] shift; //5 bits shiftamount = 5 layers of mux
    wire [31:0] bus1, bus2, bus3, bus4; //buses to connect each mux layer

    sll_one shifterone(in, shift[0], bus1);
    sll_two shiftertwo(bus1, shift[1], bus2);
    sll_four shifterthree(bus2, shift[2], bus3);
    sll_eight shifterfour(bus3, shift[3], bus4);
    sll_steen shifterfive(bus4, shift[4], out);

endmodule