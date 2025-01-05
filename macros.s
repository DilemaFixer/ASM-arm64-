// when you want add file with macros to any other , you need write #include <macros> and file with 
// macros must be at same directory 

.macro craete_sf
    stp x29, x30, [sp, #-16]!
    mov x29, sp 
.endm

.macro exit_sf
   ldp x29, x30, [sp], #16   
   ret 
.endm

.macro exit_sf_with_offset , offset
   add sp , sp , \offset
   ldp x29, x30, [sp], #16   
   ret 
.endm

.macro exit_sf_with_ret
   ldp x29, x30, [sp], #16   
   ret 
.endm

.macro exit_sf_with_ret_and_offset , offset
   add sp , sp , \offset
   ldp x29, x30, [sp], #16   
   ret 
.endm