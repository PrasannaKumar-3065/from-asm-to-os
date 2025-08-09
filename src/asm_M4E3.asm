org 0x7C00

mov ax, 'X'
mov bx, 'Y'

push ax
push bx

pop ax
pop bx

mov ah, 0x0E
mov al, al
int 0x10

mov al, bl
int 0x10

times 510-($-$$) db 0
dw 0xAA55
