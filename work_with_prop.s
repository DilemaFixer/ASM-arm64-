.section __DATA,__data
memory_step: 
    .word 4
count_of_memory: 
    .word 64 
count_of_iterations:
    .word 0

.section __TEXT,__text
.globl _main
.align 2

_main:
    stp x29, x30, [sp, #-16]!
    mov x29, sp 
    
    adrp x8, memory_step@PAGE
    add x8, x8, memory_step@PAGEOFF
    ldr w0, [x8]

    adrp x8, count_of_memory@PAGE
    add x8, x8, count_of_memory@PAGEOFF
    ldr w1, [x8]

    udiv w2, w1, w0

    adrp x8, count_of_iterations@PAGE
    add x8, x8, count_of_iterations@PAGEOFF
    str w2, [x8]

    mov x2, #10
    uxtw x3 , w2
    udiv x19, x3, x2

    mov x0, x19
    
    mov x0, #0
    mov x16, #1
    svc #0x80
