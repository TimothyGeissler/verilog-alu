module and_tb;
reg [31:0] a, b;
wire [31:0] out;

integer i;

and_alu andmodule(a, b, out);

initial begin
    $display("a:b:a&b");
    //$monitor(a, b, out);
    for (i = 0; i < 4; i=i+1) begin
        b = i[1:0];
        a = i[2:1];
        if (out == a&b) begin
            $display("PASSED");
        end else begin
            $display("FAILED: %b & %b = %b -> should be: %b", a, b, out, a&b);
        end
        #5;
    end
end


endmodule