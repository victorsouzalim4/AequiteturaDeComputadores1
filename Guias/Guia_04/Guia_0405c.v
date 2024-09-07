// ---------------------
// Aluno: Victor Souza Lima
// Num. Matrícula: 835287 
// ---------------------

// ---------------------
// -- SoP
// ---------------------
module SoP (output s,
 input x, y, z);
 // mintermos
assign s = ( ~x & ~y & ~z ) | ( ~x & ~y & z ) | (~x & y & z) | (x & ~y & ~z) | (x & y & ~z) | (x & y & z); 
endmodule // SoP

// ---------------------
// -- PoS
// ---------------------
module PoS (output S,
 input X, Y, Z);
 // MAXTERMOS
assign S = ( X | ~Y | Z ) & (~X | Y | ~Z); 
endmodule // PoS

// ---------------------
// -- test_module
// ---------------------
module test_module;
reg x, y, z;
wire s1, s2;
 // instancias
SoP SOP1 (s1, x, y, z);
PoS POS1 (s2, x, y, z);
 // valores iniciais
initial begin: start
 x=1'bx; y=1'bx; // indefinidos
end
 // parte principal
initial begin: main
 // identificacao
 // monitoramento
 $display(" x  y  z = s1 s2");
 $monitor("%2b %2b %2b = %2b %2b", x, y, z, s1, s2);
 // sinalizacao
 #1 x=0; y=0; z=0;
 #1 x=0; y=0; z=1;
 #1 x=0; y=1; z=0;
 #1 x=0; y=1; z=1;
 #1 x=1; y=0; z=0;
 #1 x=1; y=0; z=1;
 #1 x=1; y=1; z=0;
 #1 x=1; y=1; z=1;
end
endmodule // test_module

/*
 x  y  z = s1 s2
 x  x  x =  x  x
 0  0  0 =  1  1
 0  0  1 =  1  1
 0  1  0 =  0  0
 0  1  1 =  1  1
 1  0  0 =  1  1
 1  0  1 =  0  0
 1  1  0 =  1  1
 1  1  1 =  1  1
*/
