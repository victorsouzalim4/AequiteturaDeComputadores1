// ---------------------------
// Nome: Victor Souza Lima
// Matricula: 835287
// ---------------------------
`include "clock.v"

module pulse ( signal, clock );
input clock;
output signal;
reg signal;
always @ ( clock )
begin
signal = 1'b1;
#48 signal = 1'b0;
#48 signal = 1'b1;
#48 signal = 1'b0;
end
endmodule // pulse

module Guia_0903;
wire clock;
clock clk ( clock );
wire p;
pulse pls ( p, clock );

initial begin
$dumpfile ( " Guia_0903.vcd" );
$dumpvars ( 1, clock, p);
#129 $finish;
end
endmodule // Guia_0903