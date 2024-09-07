// -------------------------
// Nome: Victor Souza Lima
// Matricula: 835287
// -------------------------
module f ( output s1, output s2, input[0:7] a, input[0:7] b );
wire not_a,not_b;

not NOTa (not_a,a);
not NOTb (not_b,b);

xor XOR1 (s1,a,b);
xor XOR2 (s2,not_a,not_b);
endmodule 

module test_f;
// ------------------------- definir dados
reg[0:7] a;
reg[0:7] b;
wire s1;
wire s2;
f modulof ( s1, s2, a, b );
// ------------------------- parte principal
initial
begin : main
$display("Test module");
$display("   a         b    |   s1    s2");
// projetar testes do modulo
$monitor("%4b %4b | %4b %4b", a, b, s1, s2);
a = 8'b00000101; b = 8'b00000110; 
end
endmodule // test_f5

/*
Test module
   a         b    |   s1    s2
00000101 00000110 |    1    1
*/