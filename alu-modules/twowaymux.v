module twowaymux(input a, input b, input sel, output out);
wire w1, w2, sbar;

and (w1, b, sel), (w2, a, sbar);
not (sbar, sel);
or (out, w1, w2);
endmodule