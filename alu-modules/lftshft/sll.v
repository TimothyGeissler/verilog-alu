module mux(input a, input b, input sel, output out);
wire w1, w2, sbar;

and (w1, b, sel), (w2, a, sbar);
not (sbar, sel);
or (out, w1, w2);
endmodule


module sll(in, select, bus3);//out); //https://esrd2014.blogspot.com/p/barrel-shifter.html
    input [31:0] in;
    input [4:0] select; //5 bits shiftamount = 5 layers of mux
    output [31:0] bus3;//out;

    wire [31:0] bus1, bus2;//, bus3, bus4; //buses to connect each mux layer

    reg zero = 1'b0;

//Layer 1 (shift by 1)
mux m0(zero, in[0], select[0], bus1[0]);
mux m1(in[0], in[1], select[0], bus1[1]);
mux m2(in[1], in[2], select[0], bus1[2]);
mux m3(in[2], in[3], select[0], bus1[3]);
mux m4(in[3], in[4], select[0], bus1[4]);
mux m5(in[4], in[5], select[0], bus1[5]);
mux m6(in[5], in[6], select[0], bus1[6]);
mux m7(in[6], in[7], select[0], bus1[7]);
mux m8(in[7], in[8], select[0], bus1[8]);
mux m9(in[8], in[9], select[0], bus1[9]);
mux m10(in[9], in[10], select[0], bus1[10]);
mux m11(in[10], in[11], select[0], bus1[11]);
mux m12(in[11], in[12], select[0], bus1[12]);
mux m13(in[12], in[13], select[0], bus1[13]);
mux m14(in[13], in[14], select[0], bus1[14]);
mux m15(in[14], in[15], select[0], bus1[15]);
mux m16(in[15], in[16], select[0], bus1[16]);
mux m17(in[16], in[17], select[0], bus1[17]);
mux m18(in[17], in[18], select[0], bus1[18]);
mux m19(in[18], in[19], select[0], bus1[19]);
mux m20(in[19], in[20], select[0], bus1[20]);
mux m21(in[20], in[21], select[0], bus1[21]);
mux m22(in[21], in[22], select[0], bus1[22]);
mux m23(in[22], in[23], select[0], bus1[23]);
mux m24(in[23], in[24], select[0], bus1[24]);
mux m25(in[24], in[25], select[0], bus1[25]);
mux m26(in[25], in[26], select[0], bus1[26]);
mux m27(in[26], in[27], select[0], bus1[27]);
mux m28(in[27], in[28], select[0], bus1[28]);
mux m29(in[28], in[29], select[0], bus1[29]);
mux m30(in[29], in[30], select[0], bus1[30]);
mux m31(in[30], in[31], select[0], bus1[31]);

// Layer 2 (shift by 2)
mux second_m0(zero, bus1[0], select[1], bus2[0]);
mux second_m1(zero, bus1[1], select[1], bus2[1]);
mux second_m2(bus1[0], bus1[2], select[1], bus2[2]);
mux second_m3(bus1[1], bus1[3], select[1], bus2[3]);
mux second_m4(bus1[2], bus1[4], select[1], bus2[4]);
mux second_m5(bus1[3], bus1[5], select[1], bus2[5]);
mux second_m6(bus1[4], bus1[6], select[1], bus2[6]);
mux second_m7(bus1[5], bus1[7], select[1], bus2[7]);
mux second_m8(bus1[6], bus1[8], select[1], bus2[8]);
mux second_m9(bus1[7], bus1[9], select[1], bus2[9]);
mux second_m10(bus1[8], bus1[10], select[1], bus2[10]);
mux second_m11(bus1[9], bus1[11], select[1], bus2[11]);
mux second_m12(bus1[10], bus1[12], select[1], bus2[12]);
mux second_m13(bus1[11], bus1[13], select[1], bus2[13]);
mux second_m14(bus1[12], bus1[14], select[1], bus2[14]);
mux second_m15(bus1[13], bus1[15], select[1], bus2[15]);
mux second_m16(bus1[14], bus1[16], select[1], bus2[16]);
mux second_m17(bus1[15], bus1[17], select[1], bus2[17]);
mux second_m18(bus1[16], bus1[18], select[1], bus2[18]);
mux second_m19(bus1[17], bus1[19], select[1], bus2[19]);
mux second_m20(bus1[18], bus1[20], select[1], bus2[20]);
mux second_m21(bus1[19], bus1[21], select[1], bus2[21]);
mux second_m22(bus1[20], bus1[22], select[1], bus2[22]);
mux second_m23(bus1[21], bus1[23], select[1], bus2[23]);
mux second_m24(bus1[22], bus1[24], select[1], bus2[24]);
mux second_m25(bus1[23], bus1[25], select[1], bus2[25]);
mux second_m26(bus1[24], bus1[26], select[1], bus2[26]);
mux second_m27(bus1[25], bus1[27], select[1], bus2[27]);
mux second_m28(bus1[26], bus1[28], select[1], bus2[28]);
mux second_m29(bus1[27], bus1[29], select[1], bus2[29]);
mux second_m30(bus1[28], bus1[30], select[1], bus2[30]);
mux second_m31(bus1[29], bus1[31], select[1], bus2[31]);

//Layer 3 (shift by 4)
mux third_m0(zero, bus2[0], select[2], bus3[0]);
mux third_m1(zero, bus2[1], select[2], bus3[1]);
mux third_m2(zero, bus2[2], select[2], bus3[2]);
mux third_m3(zero, bus2[3], select[2], bus3[3]);
mux third_m4(bus2[0], bus2[4], select[2], bus3[4]);
mux third_m5(bus2[1], bus2[5], select[2], bus3[5]);
mux third_m6(bus2[2], bus2[6], select[2], bus3[6]);
mux third_m7(bus2[3], bus2[7], select[2], bus3[7]);
mux third_m8(bus2[4], bus2[8], select[2], bus3[8]);
mux third_m9(bus2[5], bus2[9], select[2], bus3[9]);
mux third_m10(bus2[6], bus2[10], select[2], bus3[10]);
mux third_m11(bus2[7], bus2[11], select[2], bus3[11]);
mux third_m12(bus2[8], bus2[12], select[2], bus3[12]);
mux third_m13(bus2[9], bus2[13], select[2], bus3[13]);
mux third_m14(bus2[10], bus2[14], select[2], bus3[14]);
mux third_m15(bus2[11], bus2[15], select[2], bus3[15]);
mux third_m16(bus2[12], bus2[16], select[2], bus3[16]);
mux third_m17(bus2[13], bus2[17], select[2], bus3[17]);
mux third_m18(bus2[14], bus2[18], select[2], bus3[18]);
mux third_m19(bus2[15], bus2[19], select[2], bus3[19]);
mux third_m20(bus2[16], bus2[20], select[2], bus3[20]);
mux third_m21(bus2[17], bus2[21], select[2], bus3[21]);
mux third_m22(bus2[18], bus2[22], select[2], bus3[22]);
mux third_m23(bus2[19], bus2[23], select[2], bus3[23]);
mux third_m24(bus2[20], bus2[24], select[2], bus3[24]);
mux third_m25(bus2[21], bus2[25], select[2], bus3[25]);
mux third_m26(bus2[22], bus2[26], select[2], bus3[26]);
mux third_m27(bus2[23], bus2[27], select[2], bus3[27]);
mux third_m28(bus2[24], bus2[28], select[2], bus3[28]);
mux third_m29(bus2[25], bus2[29], select[2], bus3[29]);
mux third_m30(bus2[26], bus2[30], select[2], bus3[30]);
mux third_m31(bus2[27], bus2[31], select[2], bus3[31]);
/*
// Fourth layer (Shift by 8)
mux fourth_m0(zero, bus3[0], select[3], bus4[0]);
mux fourth_m1(zero, bus3[1], select[3], bus4[1]);
mux fourth_m2(zero, bus3[2], select[3], bus4[2]);
mux fourth_m3(zero, bus3[3], select[3], bus4[3]);
mux fourth_m4(zero, bus3[4], select[3], bus4[4]);
mux fourth_m5(zero, bus3[5], select[3], bus4[5]);
mux fourth_m6(zero, bus3[6], select[3], bus4[6]);
mux fourth_m7(zero, bus3[7], select[3], bus4[7]);
mux fourth_m8(bus3[0], bus3[8], select[3], bus4[8]);
mux fourth_m9(bus3[1], bus3[9], select[3], bus4[9]);
mux fourth_m10(bus3[2], bus3[10], select[3], bus4[10]);
mux fourth_m11(bus3[3], bus3[11], select[3], bus4[11]);
mux fourth_m12(bus3[4], bus3[12], select[3], bus4[12]);
mux fourth_m13(bus3[5], bus3[13], select[3], bus4[13]);
mux fourth_m14(bus3[6], bus3[14], select[3], bus4[14]);
mux fourth_m15(bus3[7], bus3[15], select[3], bus4[15]);
mux fourth_m16(bus3[8], bus3[16], select[3], bus4[16]);
mux fourth_m17(bus3[9], bus3[17], select[3], bus4[17]);
mux fourth_m18(bus3[10], bus3[18], select[3], bus4[18]);
mux fourth_m19(bus3[11], bus3[19], select[3], bus4[19]);
mux fourth_m20(bus3[12], bus3[20], select[3], bus4[20]);
mux fourth_m21(bus3[13], bus3[21], select[3], bus4[21]);
mux fourth_m22(bus3[14], bus3[22], select[3], bus4[22]);
mux fourth_m23(bus3[15], bus3[23], select[3], bus4[23]);
mux fourth_m24(bus3[16], bus3[24], select[3], bus4[24]);
mux fourth_m25(bus3[17], bus3[25], select[3], bus4[25]);
mux fourth_m26(bus3[18], bus3[26], select[3], bus4[26]);
mux fourth_m27(bus3[19], bus3[27], select[3], bus4[27]);
mux fourth_m28(bus3[20], bus3[28], select[3], bus4[28]);
mux fourth_m29(bus3[21], bus3[29], select[3], bus4[29]);
mux fourth_m30(bus3[22], bus3[30], select[3], bus4[30]);
mux fourth_m31(bus3[23], bus3[31], select[3], bus4[31]);

//Layer five (Shift by 16)
mux fifth_m0(zero, bus4[0], select[4], out[0]);
mux fifth_m1(zero, bus4[1], select[4], out[1]);
mux fifth_m2(zero, bus4[2], select[4], out[2]);
mux fifth_m3(zero, bus4[3], select[4], out[3]);
mux fifth_m4(zero, bus4[4], select[4], out[4]);
mux fifth_m5(zero, bus4[5], select[4], out[5]);
mux fifth_m6(zero, bus4[6], select[4], out[6]);
mux fifth_m7(zero, bus4[7], select[4], out[7]);
mux fifth_m8(zero, bus4[8], select[4], out[8]);
mux fifth_m9(zero, bus4[9], select[4], out[9]);
mux fifth_m10(zero, bus4[10], select[4], out[10]);
mux fifth_m11(zero, bus4[11], select[4], out[11]);
mux fifth_m12(zero, bus4[12], select[4], out[12]);
mux fifth_m13(zero, bus4[13], select[4], out[13]);
mux fifth_m14(zero, bus4[14], select[4], out[14]);
mux fifth_m15(zero, bus4[15], select[4], out[15]);
mux fifth_m16(bus4[0], bus4[16], select[4], out[16]);
mux fifth_m17(bus4[1], bus4[17], select[4], out[17]);
mux fifth_m18(bus4[2], bus4[18], select[4], out[18]);
mux fifth_m19(bus4[3], bus4[19], select[4], out[19]);
mux fifth_m20(bus4[4], bus4[20], select[4], out[20]);
mux fifth_m21(bus4[5], bus4[21], select[4], out[21]);
mux fifth_m22(bus4[6], bus4[22], select[4], out[22]);
mux fifth_m23(bus4[7], bus4[23], select[4], out[23]);
mux fifth_m24(bus4[8], bus4[24], select[4], out[24]);
mux fifth_m25(bus4[9], bus4[25], select[4], out[25]);
mux fifth_m26(bus4[10], bus4[26], select[4], out[26]);
mux fifth_m27(bus4[11], bus4[27], select[4], out[27]);
mux fifth_m28(bus4[12], bus4[28], select[4], out[28]);
mux fifth_m29(bus4[13], bus4[29], select[4], out[29]);
mux fifth_m30(bus4[14], bus4[30], select[4], out[30]);
mux fifth_m31(bus4[15], bus4[31], select[4], out[31]);
*/
endmodule