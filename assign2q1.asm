fmt: .string "Meaning of life\n %d\n" //Define a string with a format specifier for an integer

.balign 4 //Align the string to an 8-byte boundary
.global main //Makes the function visible to the linker


main: stp x29, x30, [sp, #-16]! //Push the frame pointer and return address onto the stack
mov x29, sp //Set the frame pointer to the current stack pointer






ldr x0,=fmt
mov w1, 42
bl printf //Call printf to print the string









ldp x29, x30, [sp], #16 //Pop the frame pointer and return address from the stack
ret