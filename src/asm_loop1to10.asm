org 0x7C00

mov al, 1
mov ah, 0x0E

.for_loop:
	mov bl, al
	add al, '0'
	int 0x10
	mov al, bl
	inc al
	cmp al, 11
	je .done
	
	jmp .for_loop


.done:
	jmp $

times 510 - ($-$$) db 0
dw 0xAA55
