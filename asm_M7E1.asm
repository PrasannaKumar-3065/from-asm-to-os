org 0x7C00

start:
	mov ah, 0x02
	mov al, 0x01

	mov ch, 0x00
	mov cl, 0x03

	mov dh, 0x00
	mov dl, 0x00

	mov bx, 0x7E00
	int 0x13
	jc .error

	mov al, [0x7E00]
	mov ah, 0x0E
	int 0x10
	jmp $

.error:
	mov si, error_message
.print_loop:
	lodsb
	or al, al
	je .done
	mov ah, 0x0E
	int 0x10
	jmp .print_loop

.done:
	jmp $

error_message db "Error reading sector", 0
times 510-($-$$) db 0
dw 0xAA55
