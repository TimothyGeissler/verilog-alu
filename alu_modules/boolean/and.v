module and_gate(out, a, b);
input [31:0] a, b;
output [31:0] out;

genvar i;
generate
    for (i = 0; i < 32; i = i + 1) begin
        and(out[i], a[i], b[i]);
        //or(orOut[i], a[i], b[i]);
        //and(andOut[i], a[i], b[i]);
    end
endgenerate

endmodule