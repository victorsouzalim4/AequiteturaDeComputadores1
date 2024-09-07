// Programa para calcular dado04 = dado01 - dado02 + dado03
		// HL <- endereço de dado01
	   MOV A,M
	   INX H
	   MOV A,M	// A <- MEM[HL] (dado01)
	   INX H	// HL <- HL + 1 (endereço de dado02)
	   MOV B,M	// B <- MEM[HL] (dado02)
	   INR B	// B <- B + 1 (para complemento de 2)
	   ADD B	// A <- A - dado02 (usando complemento de 2)
	   INX H	// HL <- HL + 1 (endereço de dado03)
	   ADD M	// A <- A + MEM[HL] (dado03)
// Área de dados
// exemplo de valor para dado01
// exemplo de valor para dado02
// exemplo de valor para dado03
// resultado (inicializado com zero)
		// MEM[dado04] <- A (resultado)
