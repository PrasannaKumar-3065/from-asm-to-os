org 0x7C00

mov si, buffer
xor bx, bx  ; Clear BX (character count)

.print:
    mov ah, 0x00
    int 0x16         ; Wait for keypress, char in AL
    cmp al, 0x1B     ; If ESC key, end input
    je .word_print

    mov [si], al     ; Store character
    inc si           ; Move to next slot
    inc bl           ; Increment character count

    mov ah, 0x0E     ; Echo char to screen
    int 0x10

    jmp .print

.word_print:
    mov si, buffer   ; Reset SI to start of input buffer

.next_char:
    lodsb
    or al, al
    jz .message_print
    mov ah, 0x0E
    int 0x10
    jmp .next_char

.message_print:
    mov si, total_char

.print_message:
    lodsb
    or al, al
    jz .print_count
    mov ah, 0x0E
    int 0x10
    jmp .print_message

.print_count:
    mov al, bl       ; Get count
    add al, '0'      ; Convert to ASCII
    mov ah, 0x0E
    int 0x10

.done:
    jmp $

total_char db "  Total characters entered: ", 0
buffer times 64 db 0

times 510-($-$$) db 0
dw 0xAA55
