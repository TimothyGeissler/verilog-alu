module or_tb();
wire [31:0] a, b, out;

or_gate big_or(out, a, b);

integer i, j;

assign {a} = i[31:0];
assign {b} = j[31:0];


initial begin
    for (i = 0; i < 64; i = i + 1) begin
        for (j = 0; j < 64; j = j + 1) begin
            if (out == (a | b)) begin
                $display("%b | %b = %b -- CORRECT", a, b, out);
            end else begin
                $display("%b | %b = %b -- INCORRECT -- EXPECTED: %b", a, b, out, a | b);
            end
            #50;
        end
    end
end

endmodule