org 0x7C00

start:
	mov si, message

print_loop:
	lodsb
	or al, al
	jz done
	mov ah, 0x0E
	int 0x10
	jmp print_loop
	
done:
	jmp $

message db 'Hi this is a message', 0
times 510-($-$$) db 0
dw 0xAA55
