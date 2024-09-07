// -------------------------
// Nome: Victor Souza Lima
// Matricula: 835287
// -------------------------

module f ( output s, input a, input b, input c, input d );
    assign s = (~a & ~b) | (b & ~c & d) | (~b & ~c & ~d);
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