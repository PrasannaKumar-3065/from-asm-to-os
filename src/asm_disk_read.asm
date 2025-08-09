org 0x7C00

start:
	mov ah, 0x02    ; Read sector call from BIOS
	mov al, 0x01    ; No. of sectors to read

	mov ch, 0x00    ;Cylinder
	mov cl, 0x02    ;secor number (starts from 1)

	mov dh, 0x00    ;Head
	mov dl, 0x00	;Drive number (0x00 = Floppy Disk, 0x02 = Hard Disk)

	mov bx, 0x7E00	;Address to store sector offset
	int 0x13		;Call BIOS to read

	jc .error

	mov al, [0x7E00] ;Load first byte from sector 2
	mov ah, 0x0E
	int 0x10
	jmp $

.error:
	mov si, message
.print:
	lodsb
	or al, al
	jz $
	mov ah, 0x0E
	int 0x10
	jmp .print		

message db "Disk Read Error", 0
times 510-($-$$) db 0
dw 0xAA55
