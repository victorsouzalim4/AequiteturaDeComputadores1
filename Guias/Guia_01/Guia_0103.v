/*
Guia_0103.v
1478515 - Victor Souza Lima
*/
module Guia_0103;
// define data
integer x = 13; // decimal
reg [7:0] b = 0; // binary
// actions
initial
begin : main
$display ( "Guia_0103 - Tests" );
$display ( "x = %d" , x );
$display ( "b = %8b", b );
b = x;
$display ( "b = %B (2) = %o (8) = %x (16) = %X (16)", b, b, b, b );
end // main
endmodule // Guia_0103



/*Guia_0103 - Tests
x =          13
b = 00000000
b = 00001101 (2) = 015 (8) = 0d (16) = 0d (16)*/