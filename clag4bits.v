//Carry Look-ahead Generator 4 Bits
module clag4bits(
    input Cin,
    input [3:0]G,
    input [3:0]P,
    output [3:0]Cout
);
    assign Cout[0] = G[0] | (P[0] & Cin);
    assign Cout[1] = G[1] | (P[1] & G[0]) | (P[1] & P[0] & Cin);
    assign Cout[2] = G[2] | (P[2] & G[1])| (P[2] & P[1] & G[0]) | (P[2] & P[1] & P[0] & Cin);
    assign Cout[3] = G[3] | (P[3] & G[2]) |(P[3] & P[2] & G[1])| (P[3] & P[2] & P[1] & G[0]) | (P[3] & P[2] & P[1] & P[0] & Cin);
endmodule