//Zehaan Walji
//Sat Feb 3 2024
//CPSC355- Assignment Two - Question Two

//Labels for the input and output format strings
.data
output0: .string "%ld\n"
input0: .string "%ld"

//Uninitialized variables
.bss
.balign 8
num: .skip 8

//Imports
.text
.global main
.extern scanf
.extern printf



// ----------------------------------------------------------------------//
//MAIN FUNCTION
main: stp x29, x30, [sp, #-16]!
mov x29, sp

//Code body
ldr x0, =input0
ldr x1, =num
bl scanf

//Calculate the answer:
ldr x19, =num
ldr x19, [x19]
mul x20, x19, x19 //num^2
mov x21, #2
mul x22, x19, x21 //2*num
add x23, x22, #1 //2*num + 1
mul x24, x23, x20 //num^2 * (2*num + 1)

//Printing the answer:
ldr x0, =output0
mov x1, x24
bl printf

//RETURN
ldp x29, x30, [sp], #16 //Pop the frame pointer and return address from the stack
ret