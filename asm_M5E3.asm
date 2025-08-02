org 0x7C00

mov cl, 'A'
mov ah, 0x0E 

.print_loop:
	mov al, cl
	int 0x10
	inc cl
	cmp cl, 'Z'+1
	jne .print_loop

.done:
	jmp $
	
times 510-($-$$) db 0
dw 0xAA55
