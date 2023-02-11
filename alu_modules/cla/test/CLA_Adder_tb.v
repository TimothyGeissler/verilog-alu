module TestModule();

// Inputs
 wire [7:0] a, b;
 wire cin;
 
 integer i, j, k;
 real score = 0;
 real total = 0;

 // Outputs
 wire [7:0] sum;
 wire cout;

 wire G0, P0;

 CLA_Adder adder(a, b, cin, sum, cout, G0, P0);

assign {a} = i[7:0];
assign {b} = j[7:0];
assign cin = k[0];

 initial begin //go through each possible shift amount for inputs 0 -> 512
 //Test pos + pos
 k[0] = 0; // set cin = 0
 $display("a:b:cin:sum:cout:and:or");
    for (i = 0; i < 128; i = i + 1) begin
        for (j = 0; j < 128; j = j + 1) begin
            total = total + 1;
                if (((sum) == (a + b))) begin
                    $display("%b + %b + %b = %b + %b -- CORRECT", a, b, cin, sum, cout);
                    score = score + 1;
                end else begin
                    $display("%b + %b + %b = %b + %b -- INCORRECT, expected: %b", a, b, cin, sum, cout, (a + b + cin));
                end
                #50;
            /*for (k = 0; k < 2; k = k + 1) begin
                
            end*/
        end
    end
    // Test negative
    k[0] = 1;
    for (i = -128; i < 0; i = i + 1) begin
        for (j = 0; j < 127; j = j + 1) begin
            total = total + 1;
            if (sum == a + b + cin) begin
               $display("%b (%d) + %b (%d) + %b = %b (%d) + %b -- CORRECT", a, a, b, b, cin, sum, sum, cout);
                    score = score + 1;
                end else begin
                    $display("%b + %b + %b = %b + %b -- INCORRECT, expected: %b", a, b, cin, sum, cout, (a + b + cin));
                end
                #50;
        end
    end
    $display("Score: %d%", (score/total) * 100);
 end


endmodule