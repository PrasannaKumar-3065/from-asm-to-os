org 0x7c00

start:
	mov si, name

print_loop:
	lodsb
	or al, al
	jz done
	mov ah, 0x0E
	int 0x10
	jmp print_loop

done:
	jmp $

name db 'prasanna', 0
times 510-($-$$) db 0
dw 0xAA55
