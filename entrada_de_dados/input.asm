section .data
    LF        equ 0xA ; Pular linha Line Feed
    NULL      equ 0xD ; Final da string 
    SYS_CALL  equ 0x80; Envia as informações ao SO
    SYS_EXIT  equ 0x1;  Finaliza o programa
    SYS_WRITE equ 0x4;  Operação de escrita
    SYS_READ  equ 0x3;  Operação de leitura
    RET_EXIT  equ 0x0;  Operação realizada com sucesso
    STD_IN    equ 0x0;  Entrada padrão
    STD_OUT   equ 0x1;  Saída padrão

section .data
    msg db 'Qual seu nome?', LF, NULL
    tamMsg equ $- msg
    msgHello db 'Oi '
    tamHello equ $- msgHello

section .bss
    name resb 32

section .text

global _start

_start:
    ; Imprime a mensagem "Qual seu nome?"
    mov eax, SYS_WRITE
    mov ebx, STD_OUT
    mov ecx, msg
    mov edx, tamMsg
    int SYS_CALL

    ; Lê o nome do usuário
    mov eax, SYS_READ
    mov ebx, STD_IN
    mov ecx, name
    mov edx, 32
    int SYS_CALL

    ; Imprime a mensagem "Hello" seguida do nome do usuário
    mov eax, SYS_WRITE
    mov ebx, STD_OUT
    mov ecx, msgHello
    mov edx, tamHello
    int SYS_CALL

    ; Encontra o final da string do nome e substitui por um espaço
    xor eax, eax
    mov edi, name
    cld
    repne scasb
    stosb

    ; Imprime o nome do usuário
    mov eax, SYS_WRITE
    mov ebx, STD_OUT
    mov ecx, name
    mov edx, edi
    int SYS_CALL

    ; Encerra o programa
    mov eax, SYS_EXIT
    xor ebx, ebx
    int SYS_CALL
