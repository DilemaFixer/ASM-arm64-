.section __TEXT,__text
.globl _main
.align 2

.data
message:
    .asciz "Hello, World!\n"

.text
_main:
    
    stp x29, x30, [sp, #-16]!
    mov x29, sp

    
    adrp x1, message@PAGE
    add x1, x1, message@PAGEOFF

    
    mov x2, #14        

    
    mov x0, #1          
    mov x16, #4        
    svc #0x80

    mov x0, #0
    ldp x29, x30, [sp], #16
    ret