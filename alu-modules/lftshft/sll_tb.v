module sll_tb();
// Inputs
wire [31:0] in;
 wire [4:0] select;

 reg [31:0] compReg; // compare shifts
 
 integer i;
 integer x;
 //integer score;

 // Outputs
 wire [31:0] out;

 // Instantiate the Unit Under Test (UUT)
 sll leftshifter(in, select, out);

assign {select} = i[4:0];
assign {in} = x[31:0];

 initial begin //go through each possible shift amount for inputs 0 -> 512
    for (x = 0; x < 511; x = x + 1) begin
        for (i = 0; i < 7; i = i + 1) begin
            $display("Shift: %b by %d", in, select);
            compReg = x<<i;
            if (compReg == out) begin
                $display("CORRECT SHIFT");
                //score = score + 1;
            end else begin
                $display("INCORRECT SHIFT: %b, should be %b", out, compReg);
            end
            #50;
        end
    end
    //$display("Score: %d", score);
 end

endmodule