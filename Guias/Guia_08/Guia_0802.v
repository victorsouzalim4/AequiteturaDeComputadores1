// -------------------------
// Guia_0802 
// Nome: Victor Souza Lima
// Matrícula: 835287
// -------------------------
// módulo meio subtrator
// -------------------------
module meioSubtrator(output dif, output emprestaSaida, input a, input b);
    xor (dif, a, b);
    and (emprestaSaida, ~a, b);
endmodule

// -------------------------
// módulo subtrator completo
// -------------------------
module subtratorCompleto(output dif, output emprestaSaida, input a, input b, input emprestaEntrada);
    wire dif_meio, empresta_meio1, empresta_meio2;
    
    meioSubtrator MS1(dif_meio, empresta_meio1, a, b);
    meioSubtrator MS2(dif, empresta_meio2, dif_meio, emprestaEntrada);
    or (emprestaSaida, empresta_meio1, empresta_meio2);
endmodule

// -------------------------
// Unidade Aritmética (AU) de 6 bits com Subtrator Completo
// -------------------------
module UnidadeAritmeticaSub(output [5:0] dif, output emprestaFinal, input [5:0] a, input [5:0] b, input emprestaInicial);
    wire [5:0] empresta;
    
    subtratorCompleto SC0(dif[0], empresta[0], a[0], b[0], emprestaInicial);
    subtratorCompleto SC1(dif[1], empresta[1], a[1], b[1], empresta[0]);
    subtratorCompleto SC2(dif[2], empresta[2], a[2], b[2], empresta[1]);
    subtratorCompleto SC3(dif[3], empresta[3], a[3], b[3], empresta[2]);
    subtratorCompleto SC4(dif[4], empresta[4], a[4], b[4], empresta[3]);
    subtratorCompleto SC5(dif[5], emprestaFinal, a[5], b[5], empresta[4]);
endmodule

// -------------------------
// Módulo de Teste para a Unidade Aritmética com Subtração
// -------------------------
module testeUnidadeAritmeticaSub;
    reg [5:0] x, y;
    wire [5:0] resultado;
    wire emprestaSaida;
    
    // Instancia a Unidade Aritmética para Subtração
    UnidadeAritmeticaSub UA(resultado, emprestaSaida, x, y, 1'b0);
    
    initial begin
        $display("Guia_0802 - André Luiz Rocha Cabral - 82007");
        $display("Teste da AU de 6 bits com subtrator completo");
        
        // Caso de teste
        x = 6'b100010; // -30 em complemento de dois
        y = 6'b011101; // 29
        #10; // Espera 10 unidades de tempo
        
        $display("x = %b, y = %b, dif = %b, emprestaSaida = %b", x, y, resultado, emprestaSaida);
    end
endmodule
