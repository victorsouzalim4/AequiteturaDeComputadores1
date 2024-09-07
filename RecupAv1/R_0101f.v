// -------------------------
// Nome: Victor Souza Lima
// Matricula: 835287
// -------------------------

module f ( output s, input a, input b, input c, input d );
    
    wire nor_a,nor_b,nor_c,nor_d,n1,n2,n3,n4;

    nor nora (nor_a,a,a);
    nor norb (nor_b,b,b);
    nor norc (nor_c,c,c);
    nor nord (nor_d,d,d);

    nor nor1 (n1,nor_b,d);
    nor nor2 (n2,nor_b,nor_c);
    nor nor3 (n3,nor_a,nor_c);
    nor nor4 (n4,nor_a,b,nor_d);

    nor nor5 (s,n1,n2,n3,n4);

endmodule 

module test_f;
// ------------------------- definir dados
reg a;
reg b;
reg c;
reg d;
wire s;
f modulof ( s, a, b, c, d );
// ------------------------- parte principal
initial
begin : main
$display("Test module");
$display("   a    b    c    d |    s");
// projetar testes do modulo
$monitor("%4b %4b %4b %4b | %4b", a, b, c, d, s);
a = 1'b0; b = 1'b0; c = 1'b0; d = 1'b0;
#1 a = 1'b0; b = 1'b0; c = 1'b0; d = 1'b1;
#1 a = 1'b0; b = 1'b0; c = 1'b1; d = 1'b0;
#1 a = 1'b0; b = 1'b0; c = 1'b1; d = 1'b1;
#1 a = 1'b0; b = 1'b1; c = 1'b0; d = 1'b0;
#1 a = 1'b0; b = 1'b1; c = 1'b0; d = 1'b1;
#1 a = 1'b0; b = 1'b1; c = 1'b1; d = 1'b0;
#1 a = 1'b0; b = 1'b1; c = 1'b1; d = 1'b1;
#1 a = 1'b1; b = 1'b0; c = 1'b0; d = 1'b0;
#1 a = 1'b1; b = 1'b0; c = 1'b0; d = 1'b1;
#1 a = 1'b1; b = 1'b0; c = 1'b1; d = 1'b0;
#1 a = 1'b1; b = 1'b0; c = 1'b1; d = 1'b1;
#1 a = 1'b1; b = 1'b1; c = 1'b0; d = 1'b0;
#1 a = 1'b1; b = 1'b1; c = 1'b0; d = 1'b1;
#1 a = 1'b1; b = 1'b1; c = 1'b1; d = 1'b0;
#1 a = 1'b1; b = 1'b1; c = 1'b1; d = 1'b1;
end
endmodule // test_f5

/*
Test module
   a    b    c    d |    s
   0    0    0    0 |    1
   0    0    0    1 |    1
   0    0    1    0 |    1
   0    0    1    1 |    1
   0    1    0    0 |    0
   0    1    0    1 |    1
   0    1    1    0 |    0
   0    1    1    1 |    0
   1    0    0    0 |    1
   1    0    0    1 |    0
   1    0    1    0 |    0
   1    0    1    1 |    0
   1    1    0    0 |    0
   1    1    0    1 |    1
   1    1    1    0 |    0
   1    1    1    1 |    0
*/