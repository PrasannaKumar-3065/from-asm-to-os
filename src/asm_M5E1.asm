org 0x7C00


mov si, name

.print_loop:
	lodsb
	cmp al, 0
	je .done
	mov ah, 0x0E
	int 0x10
	jmp .print_loop
	
.done:
	jmp $


name db 'prasanna', 0
times 510-($-$$) db 0
dw 0xAA55
