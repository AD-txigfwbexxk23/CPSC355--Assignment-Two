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





//CODE BODY
ldr x0, =input0 //Load the address of the input format string into x0
ldr x1, =num //Load the address of the variable 'num' into x1
bl scanf //Call the scanf function to read an integer from the user

mov x19, #1 //Creating a starting counter
ldr x20, =num //Load the value of 'num' into x20
ldr x21, [x20] //Get the value at the actual memory location
mov x25, xzr //Initialize value to 0





loop:
cmp x19, x21 //Compare the counter with the input number
b.gt endloop //If the counter is equal to the input number, exit the loop



//Calculate the answer:
mul x20, x19, x19 //num^2
mov x21, #2
mul x22, x19, x21 //2num
add x23, x22, #1 //2num + 1
mul x24, x23, x20 //num^2 * (2*num + 1)
add x25, x25, x24 //Summing previous answers

add x19, x19, #1 //Increment the counter


cmp x19, x21 //Compare the counter with the input number again
b.le loop //If the counter is less than the input number, continue the loop



endloop:
ldr x0, =output0 //Load the address of the output format string into x0
mov x1, x25 //Move the result of the calculation into x1
bl printf //Call the printf function to print the result





//RETURN
ldp x29, x30, [sp], #16 //Pop the frame pointer and return address from the stack
ret