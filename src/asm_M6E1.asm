org 0x7C00

mov bx, 5

.key_loop:
	mov ah, 0x00
	int 0x16
	dec bx
	cmp bx, -1
	je .done
	mov ah, 0x0E
	int 0x10
	jmp .key_loop
	
.done:
	jmp $

times 510-($-$$) db 0
dw 0xAA55
