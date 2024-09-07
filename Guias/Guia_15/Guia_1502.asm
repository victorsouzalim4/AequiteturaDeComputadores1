; Programa para calcular dado04 = dado01 + dado02 - dado03 com 16 bits

LXI H, dado01  ; HL <- endere�o de dado01
MOV A, M       ; A <- MEM[HL] (parte baixa de dado01)
INX H          ; HL <- HL + 1
MOV H, M       ; H <- MEM[HL] (parte alta de dado01)
LXI D, dado02  ; DE <- endere�o de dado02
MOV E, M       ; E <- MEM[DE] (parte baixa de dado02)
INX D          ; DE <- DE + 1
MOV D, M       ; D <- MEM[DE] (parte alta de dado02)
DAD D          ; HL <- HL + DE (dado01 + dado02)
LXI D, dado03  ; DE <- endere�o de dado03
MOV E, M       ; E <- MEM[DE] (parte baixa de dado03)
INX D          ; DE <- DE + 1
MOV D, M       ; D <- MEM[DE] (parte alta de dado03)
MOV A, E
CPI 0          ; Verificar se dado03 � positivo ou negativo
JNZ negativo
NEG:
MOV A, L
SUB E          ; Subtrair parte baixa
MOV L, A
MOV A, H
SBB D          ; Subtrair parte alta com carry
MOV H, A
JMP CONTINUE
negativo:
MOV A, L
ADD E          ; Adicionar parte baixa
MOV L, A
MOV A, H
ADC D          ; Adicionar parte alta com carry
MOV H, A
CONTINUE:
SHLD dado04    ; Armazenar resultado em dado04
HLT            ; parar

; �rea de dados
dado01: DW 0002h ; exemplo de valor para dado01
dado02: DW 0003h ; exemplo de valor para dado02
dado03: DW 0001h ; exemplo de valor para dado03
dado04: DW 0000h ; resultado (inicializado com zero)