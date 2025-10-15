;remote wsl 
section .data
    msg db "Hello", 0xA

section .text
    global _start              ; main function


_start:
    mov rax, 1                 ; syscall: write
    mov rdi, 1                 ; file descriptor 1 - stdout
    lea rsi, [rel msg]         ; load ef adress of the ptr
    mov rdx, 15                ; l
    syscall

    call test

    mov rax, 60                ; syscall: exit  
    mov rdi, 0            ; ret 0
    syscall

    
test:
    ret