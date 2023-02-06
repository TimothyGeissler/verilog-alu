module mux(input a, input b, input sel, output out);
wire w1, w2, sbar;

and (w1, b, sel), (w2, a, sbar);
not (sbar, sel);
or (out, w1, w2);
endmodule

module sll();
    input [31:0] in
    output [31:0] out;
    input [4:0] select; //5 bits shiftamount = 5 layers of mux
    wire [31:0] bus1, bus2, bus3, bus4; //buses to connect each mux layer

    mux(in[0], in[1], sel[])

endmodule