    ; 起始地址
    org 0x7c00

; 栈起始地址
BaseOfStack equ 0x7c00

Label_Start:
    ; 初始化
    mov ax, cs
    mov ds, ax
    mov es, ax
    mov ss, ax
    mov sp, BaseOfStack

    ; 清屏
    mov ax, 0600h
    mov bx, 0700h
    mov cx, 0
    mov dx, 0184fh
    int 10h

    ; 设置光标
    mov ax, 0200h
    mov bx, 0000h
    mov dx, 0000h
    int 10h

    ; 屏幕显示
    mov ax, 1301h
    mov bx, 000fh
    mov cx, 10
    push ax
    mov ax, ds
    mov es, ax
    pop ax
    mov bp, StartBootMessage
    int 10h

    ; 重置软盘
    xor ah, ah
    xor dl, dl
    int 13h

    jmp $

StartBootMessage: db "Start Boot"

    ; 填充文件使得文件大小为512B
    times 510 - ($ - $$) db 0
    dw 0xaa55
