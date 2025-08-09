org 0x7C00

mov si, message

.print_msg:
	lodsb
	or al, al
	je done
	mov ah, 0x0E
	int 0x10
	jmp .print_msg

done:
	jmp $
	
message db 'Hello World', 0
times 510-($-$$) db 0
dw 0xAA55
