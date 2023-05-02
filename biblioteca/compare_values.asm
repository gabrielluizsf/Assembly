%include 'const.inc'

section .data
v1 dw '105', LF, NULL

section .text

global _start

_start:
    call converter_valor
    call mostrar_valor

    mov eax, SYS_EXIT
    mov ebx, RET_EXIT
    int SYS_CALL

converter_valor:
    lea esi, [v1]; [] representa um ponteiro em assembly
    mov ecx, 0x3
    call string_to_int
    ; invés de 105 tem que ter 108 pq está adicionando +3  no valor definido em v1 
    add eax, 0x3
    ret

mostrar_valor:
    call int_to_string
    call saidaResultado
    ret


;=============================
; string para inteiro
; Input: ESI(Valor Convertido) ECX(Tamanho do Valor)
; Output: EAX
;==============================
string_to_int:
    xor ebx, ebx
.prox_digito:
  movzx   eax, byte[esi]
  inc esi
  sub al, '0'
  imul ebx, 0xA
  add ebx, eax ; ebx = ebx*10 + eax
  loop .prox_digito ; while (--ecx)
  mov eax, ebx
  ret

;=============================
; inteiro para string
; Input: inteiro para EAX
; Output: BUFFER (valor ECX) TAM_BUFFER(EDX)
;==============================
int_to_string:
    lea esi, [BUFFER]; associa uma variavel com o registrador
    add esi, 0x9
    mov byte[esi], 0xA; 0xA == 10
    mov ebx, 0xA
.prox_digito:
    xor edx, edx
    div ebx
    add dl, '0'
    dec esi
    mov [esi], dl
    test eax,  eax
    jnz .prox_digito
    ret