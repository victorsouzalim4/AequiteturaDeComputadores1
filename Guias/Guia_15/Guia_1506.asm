// HL <- endereço de dado01
	   MOV A,M
	   ADD A
	   MOV A,M	// A <- MEM[HL] (dado01)
	   ADD A	// A <- A + A (2 * dado01)
	   MOV B,A	// B <- 2 * dado01
	   INX H	// HL <- HL + 1 (endereço de dado02)
	   MOV A,M	// A <- MEM[HL] (dado02)
	   ADD A	// A <- A + A (2 * dado02)
	   MOV C,A
	   ADD A	// A <- A + C (3 * dado02)
	   MOV C,A
	   MOV A,B	// A <- 2 * dado01
	   SUB C	// A <- A - 3 * dado02
// Área de dados
// exemplo de valor para dado01
// exemplo de valor para dado02
// resultado (inicializado com zero)
// MEM[dado03] <- A (resultado)
