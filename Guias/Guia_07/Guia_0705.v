// -------------------------
// -------------------------
// Guia_0705.v - GATES
// Nome: Victor Souza Lima
// Matricula: 835287
// -------------------------
// -------------------------
// multiplexer
// -------------------------
module mux ( output result, input a, input b, input [2:0] select );
// definir dados locais

wire nota_result;
wire notb_result;
wire and_result;
wire nand_result;
wire or_result;
wire nor_result;
wire xor_result;
wire xnor_result;

// descrever por portas

not NOT(nota_result, a);
not NOTB(notb_result, b);
and AND(and_result, a, b);
nand NAND(nand_result, a, b);
or OR (or_result, a, b);          // OR
nor NOR (nor_result, a, b);        // NOR
xor XOR (xor_result, a, b);        // XOR
xnor XNOR (xnor_result, a, b);      // XNOR

assign result = (select == 3'b000) ? nota_result :
                (select == 3'b001) ? notb_result :
                (select == 3'b010) ? and_result :
                (select == 3'b011) ? nand_result:
                (select == 3'b100) ? or_result:
                (select == 3'b101) ? nor_result:
                (select == 3'b110) ? xor_result:
                xnor_result;


endmodule // mux
module test_f7;
// ------------------------- definir dados
reg x;
reg y;
reg [2:0] s;
wire saida;


mux MUX1 ( saida, x, y, s );
// ------------------------- parte principal
initial
begin : main
$display("Guia_0705");
$display("Test LU's module");
$display("   x	y    s  saida");

// projetar testes do modulo
$monitor("%4b %4b %4b | %4b", x, y, s, saida);

x = 1'b0; y = 1'b0; s = 3'b000;
#1 x = 1'b0; y = 1'b0; s = 3'b001;
#1 x = 1'b0; y = 1'b0; s = 3'b010;
#1 x = 1'b0; y = 1'b0; s = 3'b011;
#1 x = 1'b0; y = 1'b0; s = 3'b100;
#1 x = 1'b0; y = 1'b0; s = 3'b101;
#1 x = 1'b0; y = 1'b0; s = 3'b110;
#1 x = 1'b0; y = 1'b0; s = 3'b111;
#1 x = 1'b0; y = 1'b1; s = 3'b000;
#1 x = 1'b0; y = 1'b1; s = 3'b001;
#1 x = 1'b0; y = 1'b1; s = 3'b010;
#1 x = 1'b0; y = 1'b1; s = 3'b011;
#1 x = 1'b0; y = 1'b1; s = 3'b100;
#1 x = 1'b0; y = 1'b1; s = 3'b101;
#1 x = 1'b0; y = 1'b1; s = 3'b110;
#1 x = 1'b0; y = 1'b1; s = 3'b111;
#1 x = 1'b1; y = 1'b0; s = 3'b000;
#1 x = 1'b1; y = 1'b0; s = 3'b001;
#1 x = 1'b1; y = 1'b0; s = 3'b010;
#1 x = 1'b1; y = 1'b0; s = 3'b011;
#1 x = 1'b1; y = 1'b0; s = 3'b100;
#1 x = 1'b1; y = 1'b0; s = 3'b101;
#1 x = 1'b1; y = 1'b0; s = 3'b110;
#1 x = 1'b1; y = 1'b0; s = 3'b111;
#1 x = 1'b1; y = 1'b1; s = 3'b000;
#1 x = 1'b1; y = 1'b1; s = 3'b001;
#1 x = 1'b1; y = 1'b1; s = 3'b010;
#1 x = 1'b1; y = 1'b1; s = 3'b011;
#1 x = 1'b1; y = 1'b1; s = 3'b100;
#1 x = 1'b1; y = 1'b1; s = 3'b101;
#1 x = 1'b1; y = 1'b1; s = 3'b110;
#1 x = 1'b1; y = 1'b1; s = 3'b111;
end
endmodule // test_f7

/*
Guia_0705
Test LU's module
   x    y    s  saida
   0    0  000 |    1
   0    0  001 |    1
   0    0  010 |    0
   0    0  011 |    1
   0    0  100 |    0
   0    0  101 |    1
   0    0  110 |    0
   0    0  111 |    1
   0    1  000 |    1
   0    1  001 |    0
   0    1  010 |    0
   0    1  011 |    1
   0    1  100 |    1
   0    1  101 |    0
   0    1  110 |    1
   0    1  111 |    0
   1    0  000 |    0
   1    0  001 |    1
   1    0  010 |    0
   1    0  011 |    1
   1    0  100 |    1
   1    0  101 |    0
   1    0  110 |    1
   1    0  111 |    0
   1    1  000 |    0
   1    1  001 |    0
   1    1  010 |    1
   1    1  011 |    0
   1    1  100 |    1
   1    1  101 |    0
   1    1  110 |    0
   1    1  111 |    1
*/