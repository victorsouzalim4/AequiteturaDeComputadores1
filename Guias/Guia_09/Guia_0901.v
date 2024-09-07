// ---------------------------
// Nome: Victor Souza Lima
// Matricula: 835287
// ---------------------------
module clock ( output clk );
reg clk;

initial
begin
clk = 1'b0;
end

always
begin
#12 clk = ~clk;
end
endmodule

module pulse ( signal, clock );
input clock;
output signal;
reg signal;
always @ ( clock )
begin
signal = 1'b1;
#2 signal = 1'b0;
#2 signal = 1'b1;
#2 signal = 1'b0;
end
endmodule // pulse

module trigger ( signal, on, clock );
input on, clock;
output signal;
reg signal;
always @ ( posedge clock & on )
begin
#10 signal = 1'b1;
#10 signal = 1'b0;
end
endmodule // trigger

module Guia_0901;
wire clock;
clock clk ( clock );
reg p;
wire p1,t1;
pulse pulse1 ( p1, clock );
trigger trigger1 ( t1, p, clock );
initial begin
p = 1'b0;
end
initial begin
$dumpfile ( "Guia_0901.vcd" );
$dumpvars ( 1, clock, p1, p, t1 );
#20 p = 1'b1;
#40 p = 1'b0;
#60 p = 1'b1;
#80 p = 1'b0;
#100 p = 1'b1;
#120 p = 1'b0;
#140 $finish;
end
endmodule // Guia_0901