module basemux(a, b, select, out);
input select;
input [31:0] a, b;
output [31:0] out;

//output a if select = true, b if select = false
assign out = select ? b : a;
endmodule

module fourto1mux(a, b, c, d, select, out);
input [1:0] select;
input [31:0] a, b, c, d;
output [31:0] out;

wire [31:0] w1;
wire [31:0] w2;

basemux in1(a, b, select[0], w1);
basemux in2(c, d, select[0], w2);

basemux outmux(w1, w2, select[1], out);

endmodule

module mux(a, b, c, d, e, f, g, h, select, out);
input [2:0] select;
input [31:0] a, b, c, d, e, f, g, h;
output [31:0] out;

wire [31:0] w1;
wire [31:0] w2;

fourto1mux mux1(a, b, c, d, select[1:0], w1);
fourto1mux mux2(e, f, g, h, select[1:0], w2);

basemux finalmux(w1, w2, select[2], out);

endmodule