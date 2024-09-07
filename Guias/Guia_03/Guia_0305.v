/*
Guia_0305.v
1478515 - Victor Souza Lima
*/
module Guia_0305;
// define data
reg [2:0] a = 0 ; // binary
reg [3:0] b = 0 ; // binary
reg [4:0] c = 0 ; // binary
reg [4:0] d = 0 ; // binary
reg [6:0] e = 0 ; // binary
// actions
initial
begin : main
$display ( "Guia_0305 - Tests" );
a = 5 + 3; // OVERFLOW (transbordamento)
b = 10 - 5 + 25 + 3 + 1; // OVERFLOW (transbordamento)
c = 2 - 35; // OVERFLOW (transbordamento)
$display("\nOverflow");
$display("a = %d = %3b = %d", (5+3) , a, a);
$display("b = %d = %4b = %d", (10 - 5 + 25 + 3 + 1), b, b);
$display("c = %d = %5b = %d", (2-35), c, c);
$display("\nComplements");
$display("0= %d = %3b = %3b", ~1 , (1-1), ~(1*1) );
$display("1= %d = %3b = %3b", ~0 , (2-1), ~(0*1) );
$display("2= %d = %3b = %3b", (1+1), (3-1), ~0+~0 );
end // main
endmodule // Guia_0305



/*Guia_0305 - Tests

Overflow
a =           8 = 000 = 0
b =          34 = 0010 =  2
c =         -33 = 11111 = 31

Complements
0=          -2 = 00000000000000000000000000000000 = bc1qf92drq0wwm8w7rnw9d8p4wjvaut2csdd5sg2cx
1=          -1 = 00000000000000000000000000000001 = bc1qf92drq0wwm8w7rnw9d8p4wjvaut2csdd5sg2cx
2=           2 = 00000000000000000000000000000010 = bc1qf92drq0wwm8w7rnw9d8p4wjvaut2csdd5sg2cx*/
