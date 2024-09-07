// HL <- endereço de dado01
	   MOV A,M
	   ANI 01
	   ANI 01	// A <- A & 01h (A % 2)
	   MOV B,A	// B <- dado01 % 2
	   INX H	// HL <- HL + 1 (endereço de dado02)
	   MOV A,M	// A <- MEM[HL] (dado02)
	   RRC	// A <- A / 2 (deslocamento à direita)
	   RRC	// A <- A / 4 (deslocamento à direita)
	   ADD B	// A <- A + B
// MEM[dado03] <- A (resultado)
// Área de dados
// exemplo de valor para dado01
// exemplo de valor para dado02
// resultado (inicializado com zero)
