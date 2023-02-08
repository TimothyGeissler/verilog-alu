module TestModule();
// Inputs
/*wire [3:0] a;
wire [3:0] b;
wire cin;

// Outputs
wire [3:0] sum;
wire cout;

integer i, j, k;

CLA_Adder adder(a, b, cin, sum, cout);

assign {a} = i[3:0];
assign {b} = j[3:0];
assign cin = k[0];

initial begin
for (i = 0; i < 8; i = i + 1) begin
    for (j = 0; j < 8; j = j + 1) begin
        for (k = 0; k < 2; k = k + 1) begin
            $display("i: %b, j: %b, k: %b", a, b, cin);
            /*if ((sum + cout) == (a + b + cin)) begin
                $display("a: %b, b: %b, cin: %b, sum: %b, cout: %b -- CORRECT", a, b, cin, sum, cout);
            end else begin
                $display("a: %b, b: %b, cin: %b, sum: %b, cout: %b -- INCORRECT, should be %b", a, b, cin, sum, cout, (a + b + cin));
            end
        end
    end
end


end*/

// Inputs
 wire [3:0] a, b;
 wire cin;
 
 integer i, j, k;
 real score = 0;
 real total = 0;

 // Outputs
 wire [3:0] sum;

 CLA_Adder adder(a, b, cin, sum, cout);

assign {a} = i[3:0];
assign {b} = j[3:0];
assign cin = k[0];

 initial begin //go through each possible shift amount for inputs 0 -> 512
 $display("a:b:cin:sum:cout");
    for (i = 0; i < 8; i = i + 1) begin
        for (j = 0; j < 8; j = j + 1) begin
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