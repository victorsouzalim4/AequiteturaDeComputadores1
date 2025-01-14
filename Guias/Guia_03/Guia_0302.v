/*
Guia_0302.v
1478515 - Victor Souza Lima
*/
module Guia_0302;
// define data
reg [7:0] a = 8'h0a ; // hexadecimal
reg [6:0] b = 8'o15 ; // octal
reg [5:0] c = 13 ; // decimal
reg [7:0] d = 0 ; // binary
reg [6:0] e = 0 ; // binary
reg [5:0] f = 0 ; // binary
// actions
initial
begin : main
$display ( "Guia_0302 - Tests" );
d = ~a+1;
$display ( "a = %8b -> C1(a) = %8b -> C2(a) = %8b", a, ~a, d );
e = ~b+1;
$display ( "b = %7b -> C1(b) = %7b -> C2(b) = %7b", b, ~b, e );
f = ~c+1;
$display ( "c = %6b -> C1(c) = %6b -> C2(c) = %6b", c, ~c, f );
end // main
endmodule // Guia_0302



/*Guia_0302 - Tests
a = 00001010 -> C1(a) = 11110101 -> C2(a) = 11110110
b = 0001101 -> C1(b) = 1110010 -> C2(b) = 1110011
c = 001101 -> C1(c) = 110010 -> C2(c) = 110011*/