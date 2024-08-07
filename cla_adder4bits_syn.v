/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : Q-2019.12
// Date      : Wed Aug  7 15:03:51 2024
/////////////////////////////////////////////////////////////


module clag4bits ( Cin, G, P, Cout );
  input [3:0] G;
  input [3:0] P;
  output [3:0] Cout;
  input Cin;
  wire   N0, N1, N2, N3, N4, N5, N6, N7, N8, N9, N10, N11, N12, N13, N14, N15,
         N16, N17, N18, N19, N20, N21;

  AND2X8 C38 ( .A(N2), .B(P[0]), .Y(N20) );
  AND2X8 C37 ( .A(N20), .B(Cin), .Y(N21) );
  AND2X8 C36 ( .A(N2), .B(G[0]), .Y(N18) );
  AND2X8 C35 ( .A(N1), .B(G[1]), .Y(N16) );
  AND2X8 C34 ( .A(P[3]), .B(G[2]), .Y(N14) );
  OR2X8 C33 ( .A(G[3]), .B(N14), .Y(N15) );
  OR2X8 C32 ( .A(N15), .B(N16), .Y(N17) );
  OR2X8 C31 ( .A(N17), .B(N18), .Y(N19) );
  OR2X8 C30 ( .A(N19), .B(N21), .Y(Cout[3]) );
  AND2X8 C29 ( .A(N1), .B(P[1]), .Y(N2) );
  AND2X8 C28 ( .A(P[3]), .B(P[2]), .Y(N1) );
  AND2X8 C27 ( .A(N0), .B(P[0]), .Y(N12) );
  AND2X8 C26 ( .A(N12), .B(Cin), .Y(N13) );
  AND2X8 C25 ( .A(N0), .B(G[0]), .Y(N10) );
  AND2X8 C24 ( .A(P[2]), .B(G[1]), .Y(N8) );
  OR2X8 C23 ( .A(G[2]), .B(N8), .Y(N9) );
  OR2X8 C22 ( .A(N9), .B(N10), .Y(N11) );
  OR2X8 C21 ( .A(N11), .B(N13), .Y(Cout[2]) );
  AND2X8 C20 ( .A(P[2]), .B(P[1]), .Y(N0) );
  AND2X8 C19 ( .A(P[1]), .B(P[0]), .Y(N6) );
  AND2X8 C18 ( .A(N6), .B(Cin), .Y(N7) );
  AND2X8 C17 ( .A(P[1]), .B(G[0]), .Y(N4) );
  OR2X8 C16 ( .A(G[1]), .B(N4), .Y(N5) );
  OR2X8 C15 ( .A(N5), .B(N7), .Y(Cout[1]) );
  AND2X8 C14 ( .A(P[0]), .B(Cin), .Y(N3) );
  OR2X8 C13 ( .A(G[0]), .B(N3), .Y(Cout[0]) );
endmodule

