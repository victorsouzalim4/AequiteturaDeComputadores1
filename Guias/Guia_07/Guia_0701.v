// -------------------------
// -------------------------
// Guia_0701.v - GATES
// Nome: Victor Souza Lima
// Matricula: 835287
// -------------------------
// -------------------------
// multiplexer
// -------------------------
module mux ( output s, output s1, output s2,input a,input b,input select );
// definir dados locais
wire not_select;
wire sa;
wire sb;
// descrever por portas

//Operações
and AND (s1, a, b);
nand NAND(s2, a, b);

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
wire saida_and;
wire saida_nand;
mux MUX1 ( saida, saida_and, saida_nand, x, y, s );
// ------------------------- parte principal
initial
begin : main
$display("Guia_0701");
$display("Test LU's module");
$display("   x	y    s	   and  nand saida");

// projetar testes do modulo
$monitor("%4b %4b %4b | %4b %4b %4b", x, y, s, saida_and, saida_nand, saida);

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
Guia_0701
Test LU's module
   x    y    s     and  nand saida
   0    0    0 |    0    1    0
   0    0    1 |    0    1    1
   0    1    0 |    0    1    0
   0    1    1 |    0    1    1
   1    0    0 |    0    1    0
   1    0    1 |    0    1    1
   1    1    0 |    1    0    1
   1    1    1 |    1    0    0
*/