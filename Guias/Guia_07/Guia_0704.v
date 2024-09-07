// -------------------------
// -------------------------
// Guia_0704.v - GATES
// Nome: Victor Souza Lima
// Matricula: 835287
// -------------------------
// -------------------------
// multiplexer
// -------------------------
module mux ( output result, input a, input b, input [1:0] select );
// definir dados locais

wire or_result;
wire nor_result;
wire xor_result;
wire xnor_result;

// descrever por portas

or OR (or_result, a, b);          // OR
nor NOR (nor_result, a, b);        // NOR
xor XOR (xor_result, a, b);        // XOR
xnor XNOR (xnor_result, a, b);      // XNOR

assign result = (select == 2'b00) ? or_result :
                (select == 2'b01) ? nor_result :
                (select == 2'b10) ? xor_result :
                xnor_result;   // Sel == 2'b11


endmodule // mux
module test_f7;
// ------------------------- definir dados
reg x;
reg y;
reg [1:0] s;
wire saida;


mux MUX1 ( saida, x, y, s );
// ------------------------- parte principal
initial
begin : main
$display("Guia_0704");
$display("Test LU's module");
$display("   x	y    s  saida");

// projetar testes do modulo
$monitor("%4b %4b %4b | %4b", x, y, s, saida);

x = 1'b0; y = 1'b0; s = 2'b00;
#1 x = 1'b0; y = 1'b0; s = 2'b01;
#1 x = 1'b0; y = 1'b0; s = 2'b10;
#1 x = 1'b0; y = 1'b0; s = 2'b11;
#1 x = 1'b0; y = 1'b1; s = 2'b00;
#1 x = 1'b0; y = 1'b1; s = 2'b01;
#1 x = 1'b0; y = 1'b1; s = 2'b10;
#1 x = 1'b0; y = 1'b1; s = 2'b11;
#1 x = 1'b1; y = 1'b0; s = 2'b00;
#1 x = 1'b1; y = 1'b0; s = 2'b01;
#1 x = 1'b1; y = 1'b0; s = 2'b10;
#1 x = 1'b1; y = 1'b0; s = 2'b11;
#1 x = 1'b1; y = 1'b1; s = 2'b00;
#1 x = 1'b1; y = 1'b1; s = 2'b01;
#1 x = 1'b1; y = 1'b1; s = 2'b10;
#1 x = 1'b1; y = 1'b1; s = 2'b11; 
end
endmodule // test_f7

/*
Guia_0704
Test LU's module
   x    y    s  saida
   0    0   00 |    0
   0    0   01 |    1
   0    0   10 |    0
   0    0   11 |    1
   0    1   00 |    1
   0    1   01 |    0
   0    1   10 |    1
   0    1   11 |    0
   1    0   00 |    1
   1    0   01 |    0
   1    0   10 |    1
   1    0   11 |    0
   1    1   00 |    1
   1    1   01 |    0
   1    1   10 |    0
   1    1   11 |    1
*/