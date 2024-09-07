/*
Guia_0304.v
1478515 - Victor Souza Lima
*/
module Guia_0304;
// define data
reg signed [7:0] a = 8'b1111_1010; // binary
reg signed [6:0] b = 8'b1111_101 ; // binary
reg signed [5:0] c = 8'b0001_10 ; // binary
reg signed [7:0] d = 0 ; // binary
reg signed [6:0] e = 0 ; // binary
reg signed [5:0] f = 0 ; // binary
// actions
initial
begin : main
$display ( "Guia_0304 - Tests" );
$display ( "a = %8b = %d", a, a );
$display ( "b = %8b = %d", b, b );
$display ( "c = %8b = %d", c, c );
d = a-b;
$display ( "d = a-b = %8b-%8b = %8b = %d", a, b, d, d );
d = b-a;
$display ( "d = b-a = %8b-%8b = %8b = %d", b, a, d, d );
d = a-c;
$display ( "d = a-c = %8b-%8b = %8b = %d", a, c, d, d );
d = c-a;
$display ( "d = c-a = %8b-%8b = %8b = %d", c, a, d, d );
end // main
endmodule // Guia_0304




/*Guia_0304 - Tests
a = 11111010 =   -6
b =  1111101 =  -3
c =   000110 =   6
d = a-b = 11111010- 1111101 = 11111101 =   -3
d = b-a =  1111101-11111010 = 00000011 =    3
d = a-c = 11111010-  000110 = 11110100 =  -12
d = c-a =   000110-11111010 = 00001100 =   12*/