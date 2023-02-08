module CLA_Adder(a,b,cin,sum,cout);
input[3:0] a,b;
input cin;
output [3:0] sum;
output cout;
wire p0,p1,p2,p3,g0,g1,g2,g3,c1,c2,c3,c4;

xor(p0, a[0], b[0]);
xor(p1, a[1], b[1]);
xor(p2, a[2], b[2]);
xor(p3, a[3], b[3]);

and(g0, a[0], b[0]);
and(g1, a[1], b[1]);
and(g2, a[2], b[2]);
and(g3, a[3], b[3]);

assign c0=cin,
c1=g0|(p0&cin),
c2=g1|(p1&g0)|(p1&p0&cin),
c3=g2|(p2&g1)|(p2&p1&g0)|(p2&p1&p0&cin),
c4=g3|(p3&g2)|(p3&p2&g1)|(p3&p2&p1&g0)|(p3&p2&p1&p0&cin);

xor(sum[0], p0, c0);
xor(sum[1], p1, c1);
xor(sum[2], p2, c2);
xor(sum[3], p3, c3);

assign cout=c4;
endmodule