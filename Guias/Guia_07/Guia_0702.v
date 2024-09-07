// -------------------------
// -------------------------
// Guia_0702.v - GATES
// Nome: Victor Souza Lima
// Matricula: 835287
// -------------------------
// -------------------------
// multiplexer
// -------------------------
module mux ( output s,input a,input b,input select );
// definir dados locais
wire not_select;
wire sa;
wire sb;
wire s1; 
wire s2;
// descrever por portas

//Operações
or OR (s1, a, b);
nor NOR (s2, a, b);

not NOT1 ( not_select, select );
and AND1 ( sa, s1, not_select );
and AND2 ( sb, s2, select );
or OR1 ( s , sa, sb );
endmodule // mux
module test_f7;
// ------------------------- definir dados
reg x;
reg y;
reg s;
wire saida;

mux MUX1 ( saida, x, y, s );
// ------------------------- parte principal
initial
begin : main
$display("Guia_0702");
$display("Test LU's module");
$display("   x	y    s	   saida");

// projetar testes do modulo
$monitor("%4b %4b %4b | %4b", x, y, s, saida);

x = 1'b0; y = 1'b0; s = 1'b0;
#1 x = 1'b0; y = 1'b0; s = 1'b1;
#1 x = 1'b0; y = 1'b1; s = 1'b0;
#1 x = 1'b0; y = 1'b1; s = 1'b1;
#1 x = 1'b1; y = 1'b0; s = 1'b0;
#1 x = 1'b1; y = 1'b0; s = 1'b1;
#1 x = 1'b1; y = 1'b1; s = 1'b0;
#1 x = 1'b1; y = 1'b1; s = 1'b1;
end
endmodule // test_f7

/*
Guia_0702
Test LU's module
   x    y    s     saida
   0    0    0 |    0
   0    0    1 |    1
   0    1    0 |    1
   0    1    1 |    0
   1    0    0 |    1
   1    0    1 |    0
   1    1    0 |    1
   1    1    1 |    0
*/