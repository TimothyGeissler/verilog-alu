`timescale 1ns / 1ps
module cla_32bit(a, b, cin, sum, cout, neq, lt, ovf);
input [31:0] a,b;
input cin;
output [31:0] sum;
output cout; // overflow flag
output neq, lt, ovf; // neq = 1 if A - B < 0, lt = 1 if A - B = 0
wire c1,c2,c3;
reg zero = 32'd0;

/*if (sum[31] == 1'b1) begin
    assign lt = 1;
end else begin
    assign lt = 0;
end*/
assign lt = sum[31];

/*if (sum == 0) begin 
    assign eq = 1;
end else begin
    assign eq = 0;
end*/
assign neq = sum ? 1 : 0;

//Calculate overflow
wire inputAnd;
and(inputAnd, a[31], b[31]);
xor(ovf, inputAnd, sum[31]);


cla_8bit cla1 (.a(a[7:0]), .b(b[7:0]), .cin(cin), .sum(sum[7:0]), .cout(c1));
cla_8bit cla2 (.a(a[15:8]), .b(b[15:8]), .cin(c1), .sum(sum[15:8]), .cout(c2));
cla_8bit cla3(.a(a[23:16]), .b(b[23:16]), .cin(c2), .sum(sum[23:16]), .cout(c3));
cla_8bit cla4(.a(a[31:24]), .b(b[31:24]), .cin(c3), .sum(sum[31:24]), .cout(cout));

endmodule

module cla_8bit(a, b, cin, sum, cout);
input [7:0] a,b;
input cin;
output [7:0] sum;
output cout;

wire [8:0] p,g,c;

// Assign
genvar i;
generate
    for (i = 0; i < 8; i = i + 1) begin
        xor(p[i], a[i], b[i]);
        and(g[i], a[i], b[i]);

        xor(sum[i], p[i], c[i]);

        //or(orOut[i], a[i], b[i]);
        //and(andOut[i], a[i], b[i]);
    end
endgenerate

//carry=gi + Pi.ci

assign c[0]=cin;

wire w1;
and(w1, p[0], cin);
or(c[1], g[0], w1);

wire [1:0] w2;
and(w2[0], p[1], g[0]);
and(w2[1], p[1], p[0], cin);
or(c[2], g[1], w2[0], w2[1]);

wire [2:0] w3;
and(w3[0], p[2], g[1]);
and(w3[1], p[2], p[1], g[0]);
and(w3[2], p[2], p[1], p[0], cin);
or(c[3], g[2], w3[0], w3[1], w3[2]);

wire [3:0] w4;
and(w4[0], p[3], g[2]);
and(w4[1], p[3], p[2], g[1]);
and(w4[2], p[3], p[2], p[1], g[0]);
and(w4[3], p[3], p[2], p[1], p[0], cin);
or(c[4], g[3], w4[0], w4[1], w4[2], w4[3]);

//c5=g4|(p4&g3)|(p4&p3&g2)|(p4&p3&p2&g1)|(p4&p3&p2&p1&g0)|(p4&p3&p2&p1&p0&cin);
wire [4:0] w5;
and(w5[0], p[4], g[3]);
and(w5[1], p[4], p[3], g[2]);
and(w5[2], p[4], p[3], p[2], g[1]);
and(w5[3], p[4], p[3], p[2], p[1], g[0]);
and(w5[4], p[4], p[3], p[2], p[1], p[0], cin);
or(c[5], g[4], w5[0], w5[1], w5[2], w5[3], w5[4]);

//c6=g5|(p5&g4)|(p5&p4&g3)|(p5&p4&p3&g2)|(p5&p4&p3&p2&g1)|(p5&p4&p3&p2&p1&g0)|(p5&p4&p3&p2&p1&p0&cin);
wire [5:0] w6;
and(w6[0], p[5], g[4]);
and(w6[1], p[5], p[4], g[3]);
and(w6[2], p[5], p[4], p[3], g[2]);
and(w6[3], p[5], p[4], p[3], p[2], g[1]);
and(w6[4], p[5], p[4], p[3], p[2], p[1], g[0]);
and(w6[5], p[5], p[4], p[3], p[2], p[1], p[0], cin);
or(c[6], g[5], w6[0], w6[1], w6[2], w6[3], w6[4], w6[5]);

//c7=g6|(p6&g5)|(p6&p5&g4)|(p6&p5&p4&g3)|(p6&p5&p4&p3&g2)|(p6&p5&p4&p3&p2&g1)|(p6&p5&p4&p3&p2&p1&g0)|(p6&p5&p4&p3&p2&p1&p0&cin)
wire [6:0] w7;
and(w7[0], p[6], g[5]);
and(w7[1], p[6], p[5], g[4]);
and(w7[2], p[6], p[5], p[4], g[3]);
and(w7[3], p[6], p[5], p[4], p[3], g[2]);
and(w7[4], p[6], p[5], p[4], p[3], p[2], g[1]);
and(w7[5], p[6], p[5], p[4], p[3], p[2], p[1], g[0]);
and(w7[6], p[6], p[5], p[4], p[3], p[2], p[1], p[0], cin);
or(c[7], g[6], w7[0], w7[1], w7[2], w7[3], w7[4], w7[5], w7[6]);

wire [7:0] w8;
and(w8[0], p[7], g[6]);
and(w8[1], p[7], p[6], g[5]);
and(w8[2], p[7], p[6], p[5], g[4]);
and(w8[3], p[7], p[6], p[5], p[4], g[3]);
and(w8[4], p[7], p[6], p[5], p[4], p[3], g[2]);
and(w8[5], p[7], p[6], p[5], p[4], p[3], p[2], g[1]);
and(w8[6], p[7], p[6], p[5], p[4], p[3], p[2], p[1], g[0]);
and(w8[7], p[7], p[6], p[5], p[4], p[3], p[2], p[1], p[0], cin);
or(cout, g[7], w8[0], w8[1], w8[2], w8[3], w8[4], w8[5], w8[6], w8[7]);

//assign cout= g[3] | (p[3]&g[2]) | p[3]&p[2]&g[1] | p[3]&p[2]&p[1]&g[0] | p[3]&p[2]&p[1]&p[0]&c[0];
//assign sum=p^c;

endmodule