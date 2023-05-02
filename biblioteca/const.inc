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
    
    ; Tamanho do Buffer de 10 posições
    TAM_BUFFER equ 0xA

segment .bss
  BUFFER resb 0x1

segment .text

saidaResultado:
  mov EAX, SYS_WRITE
  mov EBX, STD_OUT
  mov ECX, BUFFER
  mov EDX, TAM_BUFFER
  int SYS_CALL
  ret
