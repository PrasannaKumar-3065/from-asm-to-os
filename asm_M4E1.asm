org 0x7C00

mov ax, 'A'
mov bx, 'B'
mov cx, 'C'

push ax
push bx
push cx

pop cx
pop bx
pop ax

mov ah, 0x0E
mov al, al
int 0x10

mov al, bl
int 0x10

mov al, cl
int 0x10

times 510-($-$$) db 0
dw 0xAA55
