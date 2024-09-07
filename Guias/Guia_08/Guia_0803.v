// -------------------------
// Guia_0803 
// Nome: Victor Souza Lima
// Matrícula: 835287
// -------------------------
// módulo comparador de igualdade
// -------------------------
module comparadorIgualdade(output igual, input [5:0] a, input [5:0] b);
    wire [5:0] xor_saida;
    
    // Realiza a operação XOR bit a bit entre a e b
    xor (xor_saida[0], a[0], b[0]);
    xor (xor_saida[1], a[1], b[1]);
    xor (xor_saida[2], a[2], b[2]);
    xor (xor_saida[3], a[3], b[3]);
    xor (xor_saida[4], a[4], b[4]);
    xor (xor_saida[5], a[5], b[5]);
    
    // Se todos os bits de xor_saida são 0, então a e b são iguais
    nor (igual, xor_saida[0], xor_saida[1], xor_saida[2], xor_saida[3], xor_saida[4], xor_saida[5]);
endmodule

// -------------------------
// Módulo de Teste para o Comparador de Igualdade
// -------------------------
module testeComparadorIgualdade;
    reg [5:0] x, y;
    wire resultado;
    
    // Instancia o Comparador de Igualdade
    comparadorIgualdade compIgualdade(resultado, x, y);
    
    initial begin
        $display("Guia_0803 - André Luiz Rocha Cabral - 82007");
        $display("Teste do Comparador de Igualdade de 6 bits");
        
        // Caso de teste 1: Números iguais
        x = 6'b100010; // -30 em complemento de dois
        y = 6'b100010; // -30 em complemento de dois
        #10; // Espera 10 unidades de tempo
        $display("Caso 1 - x: %b, y: %b, Iguais: %b", x, y, resultado);
        
        // Caso de teste 2: Números diferentes
        x = 6'b100010; // -30 em complemento de dois
        y = 6'b011101; // 29
        #10; // Espera 10 unidades de tempo
        $display("Caso 2 - x: %b, y: %b, Iguais: %b", x, y, resultado);
    end
endmodule
