// ---------------------------
// Nome: Victor Souza Lima
// Matricula: 835287
// ---------------------------
`define found 1
`define notfound 0

module mealy ( y, x, clk, reset );
output y;
input x;
input clk;
input reset;
reg y;
parameter // state identifiers
start = 3'b000,
id1 = 3'b001,
id10 = 3'b011,
id101 = 3'b010,
id1010 = 3'b110; //
reg [2:0] E1; // current state variables
reg [2:0] E2; // next state logic output
// next state logic
always @( x or E1 )
begin
y = `notfound;
case ( E1 )
start:
if ( x == 1)
E2 = id1;
else
E2 = start;
id1:
if ( x == 0 )
E2 = id10;
else
E2 = start;
id10:
if ( x == 1)
E2 = id101;
else
E2 = start;
id101:
if ( x == 0)
begin
E2 = id1010;
y = `found;
end
else
E2 = start;
default: // undefined state
E2 = 3'bxxx;
endcase
end // always at signal or state changing
// state variables
always @( posedge clk or negedge reset )
begin
if ( reset )
E1 = E2; // updates current state
else
E1 = 0; // reset
end // always at signal changing
endmodule // mealy_1101


module Guia_1102;
reg clk, reset, x;
wire m1, m2;
mealy mealy1 ( m1, x, clk, reset );
initial
begin
$display ( "Time    X   mealy " );
// initial values
clk = 1;
reset = 0;
x = 0;
// input signal changing
#5 reset = 1;
#10 x = 1;
#10 x = 0;
#10 x = 1;
#10 x = 0;
#10 x = 1;
#10 x = 0;
#10 x = 1;
#10 x = 0;
#30 $finish;
end // initial
always
#5 clk = ~clk;
always @( posedge clk )
begin
$display ( "%4d %4b %5b", $time, x, m1);
end // always at positive edge clocking changing
endmodule // Guia_1100

/*
Time    X   mealy 
  10    0     0
  20    1     0
  30    0     0
  40    1     0
  50    0     1
  60    1     0
  70    0     0
  80    1     0
  90    0     0
 100    0     0
 110    0     0
*/