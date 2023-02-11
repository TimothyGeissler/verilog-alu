module BigTestModule();

// Inputs
 wire [31:0] a, b;
 wire cin;
 
 integer i, j, k;
 real score = 0;
 real total = 0;

 // Outputs
 wire [31:0] sum;
 wire cout;

big_cla cla(a, b, cin, sum, cout);

assign {a} = i[31:0];
assign {b} = j[31:0];
assign cin = k[0];

 initial begin //go through each possible shift amount for inputs 0 -> 512
 k[0] = 0;
 $display("a:b:cin:sum:cout:and:or");
    for (i = 0; i < 32; i = i + 1) begin
        for (j = 0; j < 32; j = j + 1) begin
            /*for (k = 0; k < 2; k = k + 1) begin
                
            end*/
            total = total + 1;
                if (sum == (a + b)) begin
                    $display("%b + %b + %b = %b + %b -- CORRECT", a, b, cin, sum, cout);
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