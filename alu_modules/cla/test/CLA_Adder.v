module CLA_Adder(a,b,cin,sum,cout);
input[8:0] a,b;
input cin;
output [8:0] sum;
output cout;
wire p0,p1,p2,p3,p4,p5,p6,g0,g1,g2,g3,g4,g5,g6,c1,c2,c3,c4,c5,c6,c7;
wire [8:0] p, g;
wire [9:0] c;

genvar i;
generate
    for (i = 0; i < 9; i = i + 1) begin
        xor(p[i], a[i], b[i]);
        and(g[i], a[i], b[i]);

        xor(sum[i], p[i], c[i]);
    end
endgenerate

/*xor(p[0], a[0], b[0]);
xor(p[1], a[1], b[1]);
xor(p[2], a[2], b[2]);
xor(p[3], a[3], b[3]);
xor(p[4], a[4], b[4]);
xor(p[5], a[5], b[5]);
xor(p[6], a[6], b[6]);
xor(p[7], a[7], b[7]);
xor(p[8], a[8], b[8]);

and(g[0], a[0], b[0]);
and(g[1], a[1], b[1]);
and(g[2], a[2], b[2]);
and(g[3], a[3], b[3]);
and(g[4], a[4], b[4]);
and(g[5], a[5], b[5]);
and(g[6], a[6], b[6]);
and(g[7], a[7], b[7]);
and(g[8], a[8], b[8]);

xor(sum[0], p[0], c[0]);
xor(sum[1], p[1], c[1]);
xor(sum[2], p[2], c[2]);
xor(sum[3], p[3], c[3]);
xor(sum[4], p[4], c[4]);
xor(sum[5], p[5], c[5]);
xor(sum[6], p[6], c[6]);
xor(sum[7], p[7], c[7]);
xor(sum[8], p[8], c[8]);*/

assign c[0]=cin;

//c1=g0|(p0&cin),
wire w1;
and(w1, p[0], cin);
or(c[1], g[0], w1);

//c2=g1|(p1&g0)|(p1&p0&cin),
wire [1:0] w2;
and(w2[0], p[1], g[0]);
and(w2[1], p[1], p[0], cin);
or(c[2], g[1], w2[0], w2[1]);

//c3=g2|(p2&g1)|(p2&p1&g0)|(p2&p1&p0&cin),
wire [2:0] w3;
and(w3[0], p[2], g[1]);
and(w3[1], p[2], p[1], g[0]);
and(w3[2], p[2], p[1], p[0], cin);
or(c[3], g[2], w3[0], w3[1], w3[2]);

//c4=g3|(p3&g2)|(p3&p2&g1)|(p3&p2&p1&g0)|(p3&p2&p1&p0&cin);
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
or(c[8], g[7], w8[0], w8[1], w8[2], w8[3], w8[4], w8[5], w8[6], w8[7]);

wire [8:0] w9;
and(w9[0], p[8], g[7]);
and(w9[1], p[8], p[7], g[6]);
and(w9[2], p[8], p[7], p[6], g[5]);
and(w9[3], p[8], p[7], p[6], p[5], g[4]);
and(w9[4], p[8], p[7], p[6], p[5], p[4], g[3]);
and(w9[5], p[8], p[7], p[6], p[5], p[4], p[3], g[2]);
and(w9[6], p[8], p[7], p[6], p[5], p[4], p[3], p[2], g[1]);
and(w9[7], p[8], p[7], p[6], p[5], p[4], p[3], p[2], p[1], g[0]);
and(w9[8], p[8], p[7], p[6], p[5], p[4], p[3], p[2], p[1], p[0], cin);
or(c[9], g[8], w9[0], w9[1], w9[2], w9[3], w9[4], w9[5], w9[6], w9[7], w9[8]);

assign cout=c[9];
endmodule