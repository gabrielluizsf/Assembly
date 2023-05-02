segment .data; constantes
    LF        equ 0xA ; Pular linha Line Feed
    NULL      equ 0xD ; Final da string 
    SYS_CALL  equ 0x80; Envia as informações ao SO
    SYS_EXIT  equ 0x1;  Finaliza o programa
    SYS_WRITE equ 0x4;  Operação de escrita
    SYS_READ  equ 0x3;  Operação de leitura
    RET_EXIT  equ 0x0;  Operação realizada com sucesso
    STD_IN    equ 0x0;  Entrada padrão
    STD_OUT   equ 0x1;  Saída padrão

section .data; constantes
; db = define byte 1byte  dw = define word 1char db = 1int 4bytes dq = define quad word 8bytes dt= define  10 words 10bytes
    x    dd 50; dd = define double words
    y    dd 10
    msg1 db 'x é maior que y', LF, NULL
    tam1 equ $- msg1
    msg2 db 'y é maior que x',LF,NULL
    tam2 equ $- msg2

section .text

global _start

_start:
    mov EAX, DWORD[x]
    mov EBX, DWORD[y]
    ;  if  em assembly - simples comparação
    cmp EAX, EBX
    ; Saltos condicionais: je é um =  jg  é um > jge >= jl < jle <= jne !=
    jge maior
    ; o else
    mov ECX, msg2
    mov EDX, tam2
    ; Salto incondicional: jmp é um goto
    jmp final
maior:
    mov  ECX, msg1
    mov  EDX, tam1
final:
    mov EAX, SYS_WRITE
    mov EBX, STD_OUT
    int SYS_CALL

    mov EAX, SYS_EXIT
    ; number             AND         OR        XOR
    ; --------------------------------------------------
    ; 7                 0111        0111       0111
    ; 5                 0101        0101       0101
    ;---------------------------------------------------
    ; resultado:        0101 = 5    0111 = 7   0010 = 2      
    xor EBX, EBX ; == mov EBX, RET_EXIT
    int SYS_CALL