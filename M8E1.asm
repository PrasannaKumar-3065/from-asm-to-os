org 0x7C00

start:
    mov bx, 0         ; state selector: 0 -> show bytes at 0x9000, 1 -> 0x7E00, 2 -> after copy
    jmp print_msg

; print message entrypoint - decides which message to print
print_msg:
    cmp bx, 0
    je load_9000
    cmp bx, 1
    je load_7E00
    cmp bx, 2
    je load_after_9000
    jmp done             ; fallback

load_9000:
    mov si, msg_9000
    jmp print_message

load_after_9000:
    mov si, msg_9000A
    jmp print_message

print_message:
    ; print string at DS:SI
    lodsb
    or al, al
    je done_message
    mov ah, 0x0E
    int 0x10
    jmp print_message

done_message:
    mov si, 0x9000
    cmp bx, 0
    je loop_9000
    mov si, 0x7E00
    cmp bx, 1
    je loop_7E00
    jmp done

; -------------------------
; Print loop for 0x9000 area (example)
loop_9000:
    ; assume SI already points to string to print
    lodsb
    or al, al
    je fill_bytes
    mov ah, 0x0E
    int 0x10
    jmp loop_9000

; -------------------------
fill_bytes:
    ; fill 0x7E00.. with zeros (512 bytes)
    mov di, 0x7E00
    mov cx, 512
    mov al,0
    rep stosb
    ; continue to copy bytes
    jmp print_7E00_bytes
; -------------------------

load_7E00:
    mov si, msg_7E00
    jmp print_message

print_7E00_bytes:
	mov bx, 1
	jmp print_msg

loop_7E00:
	lodsb
	or al, al
	je copy_bytes
	mov ah, 0x0E
	int 0x10
	jmp loop_7E00

copy_bytes:
    ; copy 512 bytes from 0x7E00 to 0x9000
    mov si, 0x7E00
    mov di, 0x9000
    mov cx, 512
    rep movsb
    jmp print_bytes

; -------------------------
print_bytes:
    mov si, 0x9000

print_bytes_loop:
    lodsb
    or al, al
    je done
    mov ah, 0x0E
    int 0x10
    jmp print_bytes_loop

done:
    jmp $            ; hang

; -------------------------
; newline routine - callable
new_line:
    mov ah, 0x0E
    mov al, 0x0D         ; CR
    int 0x10
    mov al, 0x0A         ; LF
    int 0x10
    ret

; -------------------------

; -------------------------
; Messages (labels must not start with digit)
msg_9000    db "Initial bytes in 0x9000 > ", 0
msg_7E00    db "Bytes in 0x7E00 > ", 0
msg_9000A   db "After copying the bytes in 0x9000 > ", 0

; pad to 512 bytes and boot signature
times 510-($-$$) db 0
dw 0xAA55
