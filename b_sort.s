.data 
    numbers: .word 256, 32767, 1024, 45000, 12345, 50000, 128, 65000, 8192, 15000
.global _main
.align 2
.text
_main:
    adrp x0, numbers@PAGE 
    add x0, x0, numbers@PAGEOFF
    mov x1, #10    
    mov x2, #4     
    mul x3, x1, x2
    sub x3, x3, x2 
    mov x4, #0
out_loop:
    cmp x4, x1
    b.ge exit 
    mov x5, #0
    sub x7, x3, x4, lsl #2
inner_loop:
    ldr w8, [x0, x5]
    add x9, x5, x2
    ldr w10, [x0, x9]
    cmp w8, w10
    b.le next_inner_loop 
    str w10, [x0, x5]
    str w8, [x0, x9]
next_inner_loop: 
    add x5, x5, x2 
    cmp x5, x7
    b.lt inner_loop
    add x4, x4, #1
    b out_loop
exit: 
    mov x0, #0
    mov x16, #1
    svc #0x80