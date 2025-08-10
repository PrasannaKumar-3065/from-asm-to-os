org 0x7E00

mov cx, 3
mov ah, 0x0E

.outer_loop:
	push cx
	mov cx, 3
	.loop_label:
		mov al, '*'
		int 0x10
	loop .loop_label	
	call .print_new_lines
	pop cx
loop .outer_loop

jmp $

.print_new_lines:
	mov al, 0x0D    ; Carriage return
    int 0x10
    mov al, 0x0A    ; Line feed
    int 0x10
    ret

times 510-($-$$) db 0
dw 0xAA55
