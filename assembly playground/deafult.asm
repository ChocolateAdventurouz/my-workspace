global _start

;
; CONSTANTS
;
SYS_WRITE   equ 1
SYS_EXIT    equ 60
STDOUT      equ 1

;
; Initialised data goes here
;
SECTION .data
hello           db  "Welcome to my dumpster", 10      ; char *
hello_len       equ $-hello                 ; size_t

test            db "Test", 20
test_len        equ $-test
;
; Code goes here
;
SECTION .text

_start:
    ; syscall(SYS_WRITE, STDOUT, hello, hello_len);
    mov     rax, SYS_WRITE
    mov     rdi, STDOUT
    mov     rsi, hello
    mov     rdx, hello_len
    mov     rsi, test
    mov     rdx, test_len
    syscall
    push    rax

    ; syscall(SYS_EXIT, <sys_write return value> - hello_len);
    mov     rax, SYS_EXIT
    pop     rdi
    sub     rdi, hello_len
    sub     rdi, test_len
    syscall