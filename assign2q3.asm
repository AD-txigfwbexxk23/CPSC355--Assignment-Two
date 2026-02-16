//Zehaan Walji
//Sat Feb 4 2024
//CPSC355- Assignment Two - Question Three

//Labels for the three inputs:
.data
input0: .string "%ld"
input1: .string "%ld"
input2: .string "%ld"
output0: .string "%ld\n"
output1: .string "%ld\n"

//Uninitialized variables
.bss
.balign 8
num0: .skip 8
num1: .skip 8
num2: .skip 8

//Imports
.text
.global main
.extern scanf
.extern printf


// ----------------------------------------------------------------------//
//MAIN FUNCTION
main: stp x29, x30, [sp, #-16]!
mov x29, sp

//Getting the input for 3 numbers:
ldr x0, =input0 //Load the address of the input format string into x0
ldr x1, =num0 //Load the address of the variable 'num0' into x1
bl scanf //Call the scanf function to read an integer from the user

ldr x0, =input1 //Load the address of the input format string into x0
ldr x1, =num1 //Load the address of the variable 'num1' into x1
bl scanf //Call the scanf function to read an integer from the user

ldr x0, =input2 //Load the address of the input format string into x0
ldr x1, =num2 //Load the address of the variable 'num2' into x1
bl scanf //Call the scanf function to read an integer from the user


//Loading all the numbers:
ldr x20, =num0 //Load the value of 'num0' into x20
ldr x21, [x20] //Get the value at the actual memory location
ldr x22, =num1 //Load the value of 'num1' into x22
ldr x23, [x22] //Get the value at the actual memory location
ldr x24, =num2 //Load the value of 'num2' into x24
ldr x25, [x24] //Get the value at the actual memory location


mov x26, #0 //Intalize the greatest number register to 0

//FINDING THE LARGEST NUMBER
num0_num1:
cmp x21, x23 //Compare num0 and num1
b.gt num0_num2
cmp x23, x25 //Compare num1 and num2
b.gt set_greatest_num1
b set_greatest_num2


num0_num2:
cmp x21, x25 //Compare num0 and num2
b.gt set_greatest_num0
b set_greatest_num2

//Setting the greatest number:
set_greatest_num0:
mov x26, x21 //Set greatest to num0
b print_output
set_greatest_num1:
mov x26, x23 //Set greatest to num1
b print_output
set_greatest_num2:
mov x26, x25 //Set greatest to num2
b print_output


//Printing output:
print_output:
ldr x0, =output0 //Load the address of the output format string into x0
mov x1, x26 //Move the greatest number into x1
bl printf //Call the printf function to print the greatest number



//FINDING THE SMALLEST NUMBER
num0_num1_smallest:
cmp x21, x23 //Compare num0 and num1
b.lt num0_num2_smallest
cmp x23, x25 //Compare num1 and num2
b.lt set_smallest_num1
b set_smallest_num2

num0_num2_smallest:
cmp x21, x25 //Compare num0 and num2
b.lt set_smallest_num0
b set_smallest_num2

//Setting the smallest number:
set_smallest_num0:
mov x26, x21 //Set smallest to num0
b print_output_smallest
set_smallest_num1:
mov x26, x23 //Set smallest to num1
b print_output_smallest
set_smallest_num2:
mov x26, x25 //Set smallest to num2
b print_output_smallest

//Printing output:
print_output_smallest:
ldr x0, =output1 //Load the address of the output format string into x0
mov x1, x26 //Move the smallest number into x1
bl printf //Call the printf function to print the smallest number




//RETURN
ldp x29, x30, [sp], #16 //Pop the frame pointer and return address from the stack
ret