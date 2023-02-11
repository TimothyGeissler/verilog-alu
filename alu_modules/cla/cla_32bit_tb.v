////Testbench
module cla_32bit_tb;
reg [31:0] a,b;
reg cin;
wire [31:0] sum;
wire cout;
wire neq, lt;// neq = 1 if A - B < 0, lt = 1 if A - B = 0

cla_32bit uut(.a(a), .b(b),.cin(cin),.sum(sum),.cout(cout), .neq(neq),.lt(lt));

initial begin
  a=0; b=0; cin=0;
  #10 a=16'd0; b=16'd0; cin=1'd1;
  #10 a=16'd14; b=16'd1; cin=1'd1;
  #10 a=16'd5; b=16'd0; cin=1'd0;
  #10 a=16'd999; b=16'd0; cin=1'd1;
  #10 a=32'd5;b=32'd6; cin=1'd1;
  #10 a = 32'd753; b = 32'd753; cin=1'd1;
  $display("Subtraction");
  #10 a=-32'd2567; b=32'd125; cin=1'd0;
end

initial
  $monitor( "A=%d, B=%d, Cin= %d, Sum=%d, Cout=%d, NEQ=%d, LT=%d", a,b,cin,sum,cout,neq,lt);
endmodule