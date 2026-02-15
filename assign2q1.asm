//Zehaan Walji
//Sat Feb 3 2024
//CPSC355- Assignment Two - Question One



//Creating labels for the input and output format strings
.data
input0: .string "%ld"
output0: .string "%ld\n"

//Reserving space for the variable 'num' in the .bss section
.bss //--> Where you put uninitialized data
.balign 8
num: .skip 8 //Reserve 8 bytes for the variable 'num'



.text
.global main //Makes the function visible to the linker
.extern scanf
.extern printf


// ----------------------------------------------------------------------//
//MAIN FUNCTION

main: stp x29, x30, [sp, #-16]! //Push the frame pointer and return address onto the stack
mov x29, sp //Set the frame pointer to the current stack pointer


//CODE BODY
ldr x0, =input0 //Load the address of the input format string into x0
ldr x1, =num //Load the address of the variable 'num' into x1
bl scanf //Call the scanf function to read an integer from the user

//Calculate the answer:
ldr x14, =num //Load the value of 'num' into x14
ldr x14, [x14] //Get the value at the actual memory location

add x15, x14, #1
add x16, x14, #2 
mul x17, x14, x15 //Calculate num * (num + 1)
mul x17, x17, x16 //Calculate num * (num + 1) * (num + 2)

ldr x0, =output0 //Load the address of the output format string into x0
mov x1, x17 //Move the result of the calculation into x1
bl printf //Call the printf function to print the result


//RETURN
ldp x29, x30, [sp], #16 //Pop the frame pointer and return address from the stack
ret