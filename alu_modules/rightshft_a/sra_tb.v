module sra_tb();
// Inputs
 wire [31:0] in;
 wire [4:0] select;
 
 integer i;
 integer x;
 integer score = 0;

 // Outputs
 wire [31:0] out;

 // Instantiate the Unit Under Test (UUT)
 sra rightshifter(in, select, out);

assign {select} = i[4:0];
assign {in} = x[31:0];

 initial begin //go through each possible shift amount for inputs 0 -> 512
    for (x = 0; x < 511; x = x + 1) begin
        for (i = 0; i < 7; i = i + 1) begin
            //$display("Shift: %b by %d", in, select);
            //compReg = x<<i;
            if (in>>>select == out) begin
                $display("Shift: %b by %d = %b - CORRECT", in, select, out);
                score = score + 1;
            end else begin
                $display("Shift: %b by %d = %b - INCORRECT = %b", in, select, in>>>select, out);
            end
            #50;
        end
    end
    $display("Score: %d", score);
 end

endmodule