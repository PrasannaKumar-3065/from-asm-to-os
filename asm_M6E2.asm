org 0x7C00

.key_input_loop:
	mov ah, 0x00
	int 0x16
	cmp al, 0x1B
	je .done
	mov ah,0x0E
	int 0x10
	jmp .key_input_loop
	
.done:
	jmp $

times 510-($-$$) db 0
dw 0xAA55
