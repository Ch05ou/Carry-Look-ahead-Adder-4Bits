`timescale 1ns / 1ps
`define CYCLE 5

`define SDFFILE  "./CLA_Adder_4bits_syn.sdf"
//`include "cla_adder4bits.v"
module adder_4bit_tb;
  reg [3:0] A;
  reg [3:0] B;
  reg Cin;
  wire [3:0] Sum;
  wire Cout;

  reg[3:0]result;
  reg c;
  integer i,j,err=0,correct;
  integer num = 0;
  integer ans;

  cla_adder4bits Adder (.A(A), .B(B), .Cin(Cin), .Sum(Sum), .Cout(Cout));

 `ifdef SDF
    initial $sdf_annotate(`SDFFILE, Adder);
 `endif

  /*initial begin
	$fsdbDumpfile("cla_4bits.fsdb");
	$fsdbDumpvars("+mda");
  end*/


  initial begin
    for(i=0;i<32;i=i+1)begin
        for(j=0;j<16;j=j+1)begin
            #`CYCLE A = i[3:0]; B = j; Cin = i[4];
            #`CYCLE {c, result} = i[3:0] + j + i[4];
            if((c === Cout) && (result === Sum))
                $display("%d data is correct", num);
            else begin
                $display("%d data is error !! your data is %b, correct data is %b", num, {Cout, Sum}, {c, result});
                err = err + 1;
            end
            num = num + 1;
        end
    end

    if(err == 0) begin
        $display("-------------------PASS-------------------");
        $display("All data have been generated successfully!");    
    end else begin
        $display("-------------------ERROR-------------------");
        $display("There are %d errors!", err);
    end
        
    #10 $finish;
  end
endmodule
