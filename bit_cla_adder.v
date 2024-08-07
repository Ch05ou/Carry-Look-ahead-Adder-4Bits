module bit_cla_adder(
    input A,B,Cin,
    output G,P,Sum
);
    assign Sum = (A ^ B) ^ Cin;
    assign G = A & B;
    assign P = A ^ B;

endmodule