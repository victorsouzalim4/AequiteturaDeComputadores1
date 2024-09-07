/*
Guia_0202.v
1478515 - Victor Souza Lima
*/
module Guia_0202;
// define data
real x = 0.75; // decimal
integer y = 7 ; // counter
reg [7:0] b = 0 ; // binary
// actions
initial
begin : main
$display ( "Guia_0202 - Tests" );
$display ( "x = %f" , x );
$display ( "b = 0.%8b", b );
while ( x > 0 && y >= 0 )
begin
if ( x*2 >= 1 )
begin
b[y] = 1;
x = x*2.0 - 1.0;
end
else
begin
b[y] = 0;
x = x*2.0;
end // end if
$display ( "b = 0.%8b", b );
y=y-1;
end // end while
end // main
endmodule // Guia_0202


/*Guia_0202 - Tests
x = 0.750000
b = 0.00000000
b = 0.10000000
b = 0.11000000*/