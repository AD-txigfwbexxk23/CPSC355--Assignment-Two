.global main //Makes the function visible to the linker


main: stp x29, x30, [sp, #-16]! //Push the frame pointer and return address onto the stack
mov x29, sp //Set the frame pointer to the current stack pointer

mov x0, "Meaning of life"
bl printf //Call printf to print the string


ldp x29, x30, [sp], #16 //Pop the frame pointer and return address from the stack
ret