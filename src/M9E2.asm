org 0x7C00

mov si, loading_message
mov ah, 0x0E

; Set CX = string length
mov cx, loading_message_end - loading_message

.print_loop:
    lodsb
    or al, al
    jz .done
    int 0x10
    push cx         ; Save print loop counter
    call .delay
    pop cx          ; Restore print loop counter
    loop .print_loop

.done:
    jmp $

.delay:
    push ax         ; Save registers
    push cx
    mov cx, 65535
.delay_loop:
    loop .delay_loop
    pop cx
    pop ax
    ret

loading_message db "Loading...", 0
loading_message_end:

times 510-($-$$) db 0
dw 0xAA55
