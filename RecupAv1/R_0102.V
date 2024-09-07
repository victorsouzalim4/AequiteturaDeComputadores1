// -------------------------
// Nome: Victor Souza Lima
// Matricula: 835287
// -------------------------

module f ( output s, input x, input y );
wire w1, w2, w3, w4;
not NOT_1 (w1, y);
and AND_1 (w2, x, w1);
not NOT_2 (w3, w2);
or OR__1 (w4, y, x);
or OR__2 (s, w3, w4);
endmodule // s = f (x,y)

module test_f;
// ------------------------- definir dados
reg x;
reg y;
wire a;
f modulof ( a, x, y );
// ------------------------- parte principal
initial
begin : main
$display("Test module");
$display("   x    y     a");
// projetar testes do modulo
$monitor("%4b %4b %4b", x, y, a);
x = 1'b0; y = 1'b0;
#1 x = 1'b0; y = 1'b1;
#1 x = 1'b1; y = 1'b0;
#1 x = 1'b1; y = 1'b1;
end
endmodule // test_f5

/*
Test module
   x    y    a
   0    0    1
   0    1    1
   1    0    1
   1    1    1
*/