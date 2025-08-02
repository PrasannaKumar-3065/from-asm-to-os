org 0x7C00

start:
    mov cx, 10
    add cx, 5
    sub cx, 3
    int 21h
   
times 510 - ($ - $$) db 0
dw 0xAA55
