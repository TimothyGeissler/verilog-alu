module sra_one(in, shift, out);
input [31:0] in;
input shift;
output [31:0] out;
wire [31:0] temp;

assign temp[31] = in[31];
assign temp[30:0] = in[31:1];

assign out = (shift == 1) ? temp : in;
endmodule

module sra_two(in, shift, out);
input [31:0] in;
input shift;
output [31:0] out;
wire [31:0] temp;

assign temp[31:30] = in[31:30];
assign temp[29:0] = in[31:2];

assign out = (shift == 1) ? temp : in;
endmodule


module sra_four(in, shift, out);
input [31:0] in;
input shift;
output [31:0] out;
wire [31:0] temp;

assign temp[31:28] = in[31:28];
assign temp[27:0] = in[31:4];

assign out = (shift == 1) ? temp : in;
endmodule

module sra_eight(in, shift, out);
input [31:0] in;
input shift;
output [31:0] out;
wire [31:0] temp;

assign temp[31:24] = in[31:24];
assign temp[23:0] = in[31:8];

assign out = (shift == 1) ? temp : in;
endmodule

module sra_steen(in, shift, out);
input [31:0] in;
input shift;
output [31:0] out;
wire [31:0] temp;

assign temp[31:16] = in[31:16];
assign temp[15:0] = in[31:16];

assign out = (shift == 1) ? temp : in;
endmodule

module sra(in, shift, out);
    input [31:0] in;
    output [31:0] out;
    input [4:0] shift; //5 bits shiftamount = 5 layers of mux
    wire [31:0] bus1, bus2, bus3, bus4; //buses to connect each mux layer

    sra_one shifterone(in, shift[0], bus1);
    sra_two shiftertwo(bus1, shift[1], bus2);
    sra_four shifterthree(bus2, shift[2], bus3);
    sra_eight shifterfour(bus3, shift[3], bus4);
    sra_steen shifterfive(bus4, shift[4], out);
endmodule