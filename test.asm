section .data
    Q db 0x51, 0x41, 0xc3 0x9c, 0x0A, 0x00
section .text
    global _start

_start:
    mov rax, 0x1                 ; syscall: write
    mov rdi, 0x1                 ; file descriptor 1 = stdout
    lea rsi, [rel Q]           ; lea Q
    mov rdx, 0x5                 ; l = 5
    syscall

    sub rsp, 8                 ; stack + 0x8 negative
    mov qword [rsp], 1         ; current rsp is a 64bit value that has the value of -> 1
    call test                  ; call function
    add rsp, 0x8               ; free stack

    mov rax, 0x3C               
    mov rdi, 0x0
    db 0x0F 0x05 ;syscall 

test:
    push rbp
    mov rbp, rsp
    add qword [rbp+0x10], 4      ; qword rsp is at [rbp+16]
    mov rax, 0x0
    pop rbp                      ; = mov rsp, rbp / pop rbp
    db 0xC3 ;ret
