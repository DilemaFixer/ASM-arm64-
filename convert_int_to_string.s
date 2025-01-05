.section __DATA, __data
number:
    .word 123

.section __TEXT, __text
.globl _main
.align 2

_main:
    stp x29, x30, [sp, #-16]!
    mov x29, sp 
    
    adrp x0, number@PAGE     
    add x0, x0, number@PAGEOFF 
    ldr x1, [x0]            
   
    sub sp, sp, #16         

    mov x19, x1              
    mov x3, sp               
    bl convert_loop
    
    mov x0, #1               
    mov x1, sp               
    mov x2, #3                
    mov x16, #4               
    svc #0                    
    
    add sp, sp, #16

    ldp x29, x30, [sp], #16
    ret

convert_loop:
    cbz x19, convert_end      
    mov x20, 10               
    udiv x21, x19, x20        
    msub x22, x21, x20, x19   
    add w22, w22, #48         
    strb w22, [x3], #1        
    mov x19, x21             
    b convert_loop

convert_end:
    ret

    