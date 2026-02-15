output: "The output of these values is: %d\n"
.global main //Makes the function visible to the linker


// ----------------------------------------------------------------------//

main: stp x29, x30, [sp, #-16]! //Push the frame pointer and return address onto the stack
mov x29, sp //Set the frame pointer to the current stack pointer

//Calulcating answer
mov x19, #2
mneg x20, #1,#3
mov x21, #5
mov x22, #7
mov x23, #4


mul x0, x23, x23, x23 //x^3
mul x1, x23, x23 //x^2

mul x2, x0, x19 //ax^3
mul x3, x1, x20 //bx^2
mul x4, x23, x21 //cx^1

add x5, x2, x3 //ax^3 + bx^2
add x6, x5, x4 //ax^3 + bx^2 + cx
add x7, x6, x22 //ax^3 + bx^2 + cx + d


ldr x0, =output
move x1, x7
bl printf //Call printf to print the output


ldp x29, x30, [sp], #16 //Pop the frame pointer and return address from the stack
ret