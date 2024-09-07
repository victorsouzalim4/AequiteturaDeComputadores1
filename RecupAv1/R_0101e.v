// -------------------------
// Nome: Victor Souza Lima
// Matricula: 835287
// -------------------------

module f ( output s, input a, input b, input c, input d );
    
    wire nand_a,nand_b,nand_c,nand_d,n1,n2,n3;

    nand NANDa (nand_a,a,a);
    nand NANDb (nand_b,b,b);
    nand NANDc (nand_c,c,c);
    nand NANDd (nand_d,d,d);

    nand NAND1 (n1,nand_a,nand_b);
    nand NAND2 (n2,b,nand_c,d);
    nand NAND3 (n3,nand_b,nand_c,nand_d);

    nand NAND4 (s,n1,n2,n3);

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