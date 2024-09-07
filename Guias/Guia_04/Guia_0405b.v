// ---------------------
// Aluno: Victor Souza Lima
// Num. Matrícula: 835287 
// ---------------------

// ---------------------
// -- SoP
// ---------------------
module SoP (output s,
 input x, y);
 // mintermos
assign s = ( ~x & ~y ) | ( ~x & y ) | (x & y); 
endmodule // SoP

// ---------------------
// -- PoS
// ---------------------
module PoS (output S,
 input X, Y);
 // MAXTERMOS
assign S = ( ~X | Y ); 
endmodule // PoS

// ---------------------
// -- test_module
// ---------------------
module test_module;
reg x, y;
wire s1, s2;
 // instancias
SoP SOP1 (s1, x, y);
PoS POS1 (s2, x, y);
 // valores iniciais
initial begin: start
 x=1'bx; y=1'bx; // indefinidos
end
 // parte principal
initial begin: main
 // identificacao
 // monitoramento
 $display(" x  y = s1 s2");
 $monitor("%2b %2b = %2b %2b", x, y, s1, s2);
 // sinalizacao
 #1 x=0; y=0;
 #1 x=0; y=1;
 #1 x=1; y=0;
 #1 x=1; y=1;
end
endmodule // test_module

/*
 x  y = s1 s2
 x  x =  x  x
 0  0 =  1  1
 0  1 =  1  1
 1  0 =  0  0
 1  1 =  1  1
*/
