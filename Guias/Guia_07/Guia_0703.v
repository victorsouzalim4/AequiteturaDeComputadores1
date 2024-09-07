// -------------------------
// -------------------------
// Guia_0703.v - GATES
// Nome: Victor Souza Lima
// Matricula: 835287
// -------------------------
// -------------------------
// multiplexer
// -------------------------
module mux ( output s_group1, output s_group2, output s,input a,input b,input select_port, input select_grupo );
// definir dados locais
wire not_select;
wire not_select2;
wire sa;
wire sb;
wire sc;
wire sd;
wire se;
wire sf;
wire s1; 
wire s2;
wire s3;
wire s4;
// descrever por portas

//Grupo1
and AND(s1, a, b);
nand NAND(s2, a, b);

//Grupo2
or OR (s3, a, b);
nor NOR (s4, a, b);

//Select porta
not NOT1 ( not_select, select_port );

and AND1 ( sa, s1, not_select );
and AND2 ( sb, s2, select_port );
or OR1 ( s_group1 , sa, sb );

and AND3 ( sc, s3, not_select );
and AND4 ( sd, s4, select_port );
or OR2 ( s_group2 , sc, sd );

//select_grupo
not NOT3 ( not_select2, select_grupo );
and AND5 ( se, s_group1, not_select2 );
and AND6 ( sf, s_group2, select_grupo );
or OR3 ( s , se, sf );

endmodule // mux
module test_f7;
// ------------------------- definir dados
reg x;
reg y;
reg s1;
reg s2;
wire saida_group1;
wire saida_group2;
wire saida;


mux MUX1 ( saida_group1, saida_group2, saida, x, y, s1, s2 );
// ------------------------- parte principal
initial
begin : main
$display("Guia_0703");
$display("Test LU's module");
$display("   x	y    s1   s2  saida1  saida2 saida-final");

// projetar testes do modulo
$monitor("%4b %4b %4b %4b | %4b %4b %4b", x, y, s1, s2, saida_group1, saida_group2, saida);

x = 1'b0; y = 1'b0; s1 = 1'b0 ; s2= 1'b0;
#1 x = 1'b0; y = 1'b0; s1 = 1'b0 ; s2= 1'b1;
#1 x = 1'b0; y = 1'b0; s1 = 1'b1 ; s2= 1'b0;
#1 x = 1'b0; y = 1'b0; s1 = 1'b1 ; s2= 1'b1;
#1 x = 1'b0; y = 1'b1; s1 = 1'b0 ; s2= 1'b0;
#1 x = 1'b0; y = 1'b1; s1 = 1'b0 ; s2= 1'b1;
#1 x = 1'b0; y = 1'b1; s1 = 1'b1 ; s2= 1'b0;
#1 x = 1'b0; y = 1'b1; s1 = 1'b1 ; s2= 1'b1;
#1 x = 1'b1; y = 1'b0; s1 = 1'b0 ; s2= 1'b0;
#1 x = 1'b1; y = 1'b0; s1 = 1'b0 ; s2= 1'b1;
#1 x = 1'b1; y = 1'b0; s1 = 1'b1 ; s2= 1'b0;
#1 x = 1'b1; y = 1'b0; s1 = 1'b1 ; s2= 1'b1;
#1 x = 1'b1; y = 1'b1; s1 = 1'b0 ; s2= 1'b0;
#1 x = 1'b1; y = 1'b1; s1 = 1'b0 ; s2= 1'b1;
#1 x = 1'b1; y = 1'b1; s1 = 1'b1 ; s2= 1'b0;
#1 x = 1'b1; y = 1'b1; s1 = 1'b1 ; s2= 1'b1;
end
endmodule // test_f7

/*
Guia_0703
Test LU's module
   x    y    s1   s2  saida1  saida2 saida-final
   0    0    0    0 |    0    0    0
   0    0    0    1 |    0    0    0
   0    0    1    0 |    1    1    1
   0    0    1    1 |    1    1    1
   0    1    0    0 |    0    1    0
   0    1    0    1 |    0    1    1
   0    1    1    0 |    1    0    1
   0    1    1    1 |    1    0    0
   1    0    0    0 |    0    1    0
   1    0    0    1 |    0    1    1
   1    0    1    0 |    1    0    1
   1    0    1    1 |    1    0    0
   1    1    0    0 |    1    1    1
   1    1    0    1 |    1    1    1
   1    1    1    0 |    0    0    0
   1    1    1    1 |    0    0    0
*/