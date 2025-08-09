org 0x07C00

mov si, message

.print_loop:
	lodsb
	cmp al,0
	jz .print_key
	mov ah, 0x0E
	int 0x10
	jmp .print_loop

.print_key:
	mov ah, 0x00
	int 0x16
	mov ah, 0x0E
	int 0x10
	jmp .done

.done:
	jmp $

message db 'you typed: ', 0
times 510-($-$$) db 0
dw 0xAA55
