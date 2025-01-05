.section __DATA,__data
newline: .ascii "\n"

.section __TEXT,__text
.globl _main
.align 2

_main:
    stp x29, x30, [sp, #-16]!
    mov x29, sp

    mov x4, #0
    mov x5, #1
    mov x6, #0
    mov x7, #7
    
fib_loop:
    mov x0, x4
    bl print_number
    
    mov x0, #1
    adrp x1, newline@PAGE
    add x1, x1, newline@PAGEOFF
    mov x2, #1
    mov x16, #4
    svc #0x80
    
    add x6, x4, x5
    mov x4, x5
    mov x5, x6
    
    sub x7, x7, #1
    cmp x7, #0
    b.gt fib_loop
    
    mov x0, #0
    mov x16, #1
    svc #0x80

print_number:
    sub sp, sp, #16
    stp x29, x30, [sp, #-16]!
    mov x29, sp
    
    mov x19, x0
    mov x20, sp
    add x20, x20, #16
    mov x21, #0
    
    cmp x19, #0
    b.ne convert_loop
    mov w22, #48
    strb w22, [x20], #1
    mov x21, #1
    b print_digits

convert_loop:
    cbz x19, print_digits
    mov x23, #10
    udiv x24, x19, x23
    msub x22, x24, x23, x19
    add w22, w22, #48
    strb w22, [x20], #1
    add x21, x21, #1
    mov x19, x24
    b convert_loop

print_digits:
    mov x0, #1
    sub x20, x20, x21
    mov x1, x20
    mov x2, x21
    mov x16, #4
    svc #0x80
    
    ldp x29, x30, [sp], #16
    add sp, sp, #16
    ret