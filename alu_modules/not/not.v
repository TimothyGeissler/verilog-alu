module not_gate(in, out);
input [31:0] in;
output [31:0] out;

genvar i;
generate
    for (i = 0; i < 32; i = i + 1) begin
        not(out[i], in[i]);
    end
endgenerate

endmodule