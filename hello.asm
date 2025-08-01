org 0x7C00                ;Boot sector start

start:
	mov si, message


print_loop:
	lodsb                 ;Load byte from DS:SI to AL and increment SI
	or al, al             ;Check if byte is 0
	jz done
	mov ah, 0x0E          ;BIOS teletype
	int 0x10              ;print AL
	jmp print_loop

done:
	jmp $

message db 'Hello World', 0

times 510-($-$$) db 0     ;pad to 510 bytes
dw 0xAA55                 ;boot signature
