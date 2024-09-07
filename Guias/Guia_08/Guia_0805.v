// -------------------------
// Guia_0805
// Nome: Victor Souza Lima
// Matrícula: 835287
// -------------------------
// módulo complemento de 2
// -------------------------
module complemento2(output [4:0] saida, input [4:0] entrada);
    wire [4:0] invertido;
    wire [4:0] vaiUm; // Corrigido: Agora é um vetor para acompanhar o "carry" de cada bit
    
    // Inverte todos os bits
    not (invertido[0], entrada[0]);
    not (invertido[1], entrada[1]);
    not (invertido[2], entrada[2]);
    not (invertido[3], entrada[3]);
    not (invertido[4], entrada[4]);
    
    // Adiciona 1 ao valor invertido
    // Corrigido: Propagação correta do "vai-um"
    fullAdder FA0(saida[0], vaiUm[0], invertido[0], 1'b1, 1'b0);
    fullAdder FA1(saida[1], vaiUm[1], invertido[1], 1'b0, vaiUm[0]);
    fullAdder FA2(saida[2], vaiUm[2], invertido[2], 1'b0, vaiUm[1]);
    fullAdder FA3(saida[3], vaiUm[3], invertido[3], 1'b0, vaiUm[2]);
    fullAdder FA4(saida[4], vaiUm[4], invertido[4], 1'b0, vaiUm[3]);
endmodule

// módulo somador completo utilizado pelo complemento de 2
module fullAdder(output soma, output carryOut, input a, input b, input carryIn);
    wire s1, c1, c2;
    
    xor (s1, a, b);
    xor (soma, s1, carryIn);
    and (c1, a, b);
    and (c2, s1, carryIn);
    or (carryOut, c1, c2);
endmodule

// -------------------------
// Módulo de Teste para o Complemento de 2
// -------------------------
module testeComplemento2;
    reg [4:0] entrada;
    wire [4:0] saida;
    
    // Instancia o módulo Complemento de 2
    complemento2 comp2(saida, entrada);
    
    initial begin
        $display("Guia_0805 - André Luiz Rocha Cabral - 82007");
        $display("Teste do Complemento de 2 de 5 bits");
        
        // Caso de teste
        entrada = 5'b01101; // 13
        #10; // Espera 10 unidades de tempo
        $display("Entrada: %b, Complemento de 2: %b", entrada, saida);
        
        entrada = 5'b10010; // -14 em complemento de dois
        #10;
        $display("Entrada: %b, Complemento de 2: %b", entrada, saida);
    end
endmodule
