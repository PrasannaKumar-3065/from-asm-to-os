org 0x7C00


call print_hello
call print_hello

print_hello:
	mov si, message
	.print_loop:
		lodsb
		or al, al
		je .done
		mov ah, 0x0E
		int 0x10
		jmp .print_loop
.done:
	ret

message db 'hello', 0
times 510-($-$$) db 0
dw 0xAA55
