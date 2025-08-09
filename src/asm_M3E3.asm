org 0x7C00

; Prompt
mov ah, 0x0E
mov al, '>'
int 0x10

; Read first digit
mov ah, 0x00
int 0x16
sub al, '0'        ; Convert to number
mov bl, al         ; Store first digit

; Prompt again
mov ah, 0x0E
mov al, '+'
int 0x10

; Read second digit
mov ah, 0x00
int 0x16
sub al, '0'        ; Convert to number
add al, bl         ; Add to first digit
mov ah, 0          ; Clear upper byte
mov ax, ax         ; Result in AX

; Now convert result to string and print
mov bx, 10
mov si, buffer + 4

.next_digit:
    xor dx, dx
    div bx
    add dl, '0'
    dec si
    mov [si], dl
    test ax, ax
    jnz .next_digit

    mov byte [si - 1], 0

.print:
    mov al, [si]
    cmp al, 0
    je .done
    mov ah, 0x0E
    int 0x10
    inc si
    jmp .print

.done:
    jmp $

buffer db 0, 0, 0, 0, 0

times 510 - ($ - $$) db 0
dw 0xAA55
