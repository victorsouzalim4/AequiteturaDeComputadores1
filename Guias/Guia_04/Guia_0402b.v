// ---------------------
// Aluno: Victor Souza Lima
// Num. Matrícula: 835287 
// ---------------------
// ---------------------
// -- expression
// ---------------------
module fxy (output s1, s2,input x, y);
	assign s1 = (~x | y) | (x & y);
	assign s2 = ~x | y;
endmodule // fxy

// ---------------------
// -- test_module
// ---------------------
module test_module;
reg x, y;
wire s1, s2;
 // instancias
fxy FXY1 (s1, s2, x, y);
 // valores iniciais
initial begin: start
 x=1'bx; y=1'bx; // indefinidos
end
 // parte principal
initial begin: main
 // identificacao
 $display("Guia_0402a\n");
 // monitoramento
 $display(" x  y  = s1");
 $monitor("%2b %2b = %2b", x, y, s1);
 // sinalizacao
 #1 x=0; y=0; 
 #1 x=0; y=1; 
 #1 x=1; y=0; 
 #1 x=1; y=1;

 $display("\n x  y = s2");
 $monitor("%2b %2b = %2b", x, y, s2);
 // sinalizacao
 #1 x=0; y=0; 
 #1 x=0; y=1; 
 #1 x=1; y=0; 
 #1 x=1; y=1;  
end
endmodule // test_module

/*
 x  y  = s1
 x  x =  x
 0  0 =  1
 0  1 =  1
 1  0 =  0
 1  1 =  1

 x  y = s2
 0  0 =  1
 0  1 =  1
 1  0 =  0
 1  1 =  1
*/