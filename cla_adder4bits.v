`include "clag4bits.v"          //Carry Look-ahead Generator
`include "bit_cla_adder.v"        // 1 bit Full-Adder
module cla_adder4bits(
    input [3:0]A,B,
    input Cin,
    output [3:0]Sum,
    output Cout
);
    wire [3:0]g,p;
    wire [3:0]gen_Cout;

    bit_cla_adder Adder1(.A(A[0]),.B(B[0]),.Cin(Cin),.G(g[0]),.P(p[0]),.Sum(Sum[0]));
    bit_cla_adder Adder2(.A(A[1]),.B(B[1]),.Cin(gen_Cout[0]),.G(g[1]),.P(p[1]),.Sum(Sum[1]));
    bit_cla_adder Adder3(.A(A[2]),.B(B[2]),.Cin(gen_Cout[1]),.G(g[2]),.P(p[2]),.Sum(Sum[2]));
    bit_cla_adder Adder4(.A(A[3]),.B(B[3]),.Cin(gen_Cout[2]),.G(g[3]),.P(p[3]),.Sum(Sum[3]));

    clag4bits generator(.Cin(Cin),.G(g),.P(p),.Cout(gen_Cout));

    assign Cout = gen_Cout[3];
endmodule