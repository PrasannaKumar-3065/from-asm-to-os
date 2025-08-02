org 0x7C00

mov ax, 120
mov bx, 10

mov si, buffer+4

.num_loop:
	xor dx, dx
	div bx
	add dl, '0'
	dec si
	mov [si], dl
	test ax, ax
	jnz .num_loop

.print:
	mov ah, 0x0E
	lodsb
	cmp al, 0
	je .done
	int 0x10
	jmp .print

.done:
	jmp $

buffer db 0, 0, 0, 0, 0
times 510-($-$$) db 0
dw 0xAA55
