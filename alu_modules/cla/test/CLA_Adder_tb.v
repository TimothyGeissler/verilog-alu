module TestModule();

// Inputs
 wire [8:0] a, b;
 wire cin;
 
 integer i, j, k;
 real score = 0;
 real total = 0;

 // Outputs
 wire [8:0] sum;
 wire cout;

 CLA_Adder adder(a, b, cin, sum, cout);

assign {a} = i[8:0];
assign {b} = j[8:0];
assign cin = k[0];

 initial begin //go through each possible shift amount for inputs 0 -> 512
 $display("a:b:cin:sum:cout");
    for (i = 0; i < 256; i = i + 1) begin
        for (j = 0; j < 256; j = j + 1) begin
            for (k = 0; k < 2; k = k + 1) begin
                total = total + 1;
                if ((sum + cout) == (a + b + cin)) begin
                    $display("%b + %b + %b = %b + %b -- CORRECT", a, b, cin, sum, cout);
                    score = score + 1;
                end else begin
                    $display("%b + %b + %b = %b + %b -- INCORRECT, expected: %b", a, b, cin, sum, cout, (a + b + cin));
                end
                #50;
            end
        end
    end
    $display("Score: %d%", (score/total) * 100);
 end


endmodule