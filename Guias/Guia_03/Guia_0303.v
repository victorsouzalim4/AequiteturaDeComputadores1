/*
Guia_0303.v
1478515 - Victor Souza Lima
*/
module Guia_0303;
// define data
reg signed [7:0] a = 8'b1111_1010; // binary
reg signed [6:0] b = 8'b1111_101 ; // binary
reg signed [5:0] c = 8'b1111_10 ; // binary
reg signed [7:0] d = 0 ; // binary
reg signed [6:0] e = 0 ; // binary
// actions
initial
begin : main
$display ( "Guia_0303 - Tests" );
d = ~a+1;
e = ~(a-1);
$display ( "a = %8b -> C1(a) = %8b -> C2(a) = %8b = %d = %d", a, ~a, d, d, e );
d = ~b+1;
e = ~(b-1);
$display ( "b = %7b -> C1(b) = %7b -> C2(b) = %7b = %d = %d", b, ~b, d, d, e );
d = ~c+1;
e = ~(c-1);
$display ( "c = %6b -> C1(c) = %6b -> C2(c) = %6b = %d = %d", c, ~c, d, d, e );
end // main end // main
endmodule // Guia_0303



/*Guia_0303 - Tests
a = 11111010 -> C1(a) = 00000101 -> C2(a) = 00000110 =    6 =   6
b = 1111101 -> C1(b) = 0000010 -> C2(b) = 00000011 =    3 =   3
c = 111110 -> C1(c) = 000001 -> C2(c) = 00000010 =    2 =   2*/