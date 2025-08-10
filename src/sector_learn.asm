org 0x7C00

call .re_reset_memory_block

.read_0x7E00:
	mov ax, 0x000
	mov es, ax

	mov ah, 0x02
	mov al, 0x01

	mov ch, 0x00
	mov cl, 0x2

	mov dh, 0x00
	mov dl, 0x00

	mov bx, 0x7E00
	int 0x13
	jc .error
	mov si, .re_reset_memory_block
	call .print_error_msg

jmp $

.print_error_msg:
	lodsb
	or al, al
	jz .done
	mov ah, 0x0E
	int 0x10
	jmp .print_error_msg
	
.error:
	mov si, sector_error
	call .print_error_msg
	ret
	
.success:
	mov si, success_message
	call .print_error_msg
	ret
	
.done:
	call .print_newline
	ret

.move_memory:
	mov si, 0x7E00
	mov di, 0x9000
	mov cx, 512
	rep movsb
	mov si, mov_si_to_di
	call .print_error_msg
	ret
	
.re_move_memory:
	mov si, 0x9000
	mov di, 0x7E00
	mov cx, 512
	rep movsb
	mov si, mov_di_to_si
	call .print_error_msg
	ret

.reset_memory_block:
	mov di, 0x9000
	mov cx, 512
	mov al, 0
	rep stosb
	mov si, reset_0x9000
	call .print_error_msg
	ret
	
.re_reset_memory_block:
    mov di, 0x7E00
    mov cx, 511          ; fill first 511 bytes with '1'
    mov al, '1'
.fill_loop:
    stosb
    loop .fill_loop
    mov al, 0            ; null terminator
    stosb
    mov si, reset_0x7E00
    call .print_error_msg
    ret

.print_newline:
    mov ah, 0x0E    ; Teletype output function
    mov al, 0x0D    ; Carriage return
    int 0x10
    mov al, 0x0A    ; Line feed
    int 0x10
    ret


mov_si_to_di db "memory moved from 0x7E00 to 0x9000", 0
mov_di_to_si db "memory moved from 0x9000 to 0x7E00", 0

reset_0x7E00 db "memory block 0x7E00 reset to 0", 0
reset_0x9000 db "memory block 0x9000 reset to 0", 0

success_message db "sector reading done", 0
sector_error db "error reading sector", 0
times 510-($-$$) db 0
dw 0xAA55
