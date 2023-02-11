module second_lvl_cla(c0, g, p, c8, c16, c24, c32);

input c0;
input [3:0] g, p;

output c8, c16, c24, c32;

//c1=g0|(p0&cin),
wire w1;
and(w1, p[0], cin);
or(c8, g[0], w1);

//c2=g1|(p1&g0)|(p1&p0&cin),
wire [1:0] w2;
and(w2[0], p[1], g[0]);
and(w2[1], p[1], p[0], cin);
or(c16, g[1], w2[0], w2[1]);

//c3=g2|(p2&g1)|(p2&p1&g0)|(p2&p1&p0&cin),
wire [2:0] w3;
and(w3[0], p[2], g[1]);
and(w3[1], p[2], p[1], g[0]);
and(w3[2], p[2], p[1], p[0], cin);
or(c24, g[2], w3[0], w3[1], w3[2]);

//c4=g3|(p3&g2)|(p3&p2&g1)|(p3&p2&p1&g0)|(p3&p2&p1&p0&cin);
wire [3:0] w4;
and(w4[0], p[3], g[2]);
and(w4[1], p[3], p[2], g[1]);
and(w4[2], p[3], p[2], p[1], g[0]);
and(w4[3], p[3], p[2], p[1], p[0], cin);
or(c32, g[3], w4[0], w4[1], w4[2], w4[3]);

endmodule