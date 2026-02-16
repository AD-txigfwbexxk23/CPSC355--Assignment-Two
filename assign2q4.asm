//Zehaan Walji
//Sat Feb 4 2024
//CPSC355- Assignment Two - Question Four

//Labels for the three inputs:
.data
input0: .string "%ld"
input1: .string "%ld"
input2: .string "%ld"
input3: .string "%ld"
output0: .string "%ld\n"

//Uninitialized variables
.bss
.balign 8
num0: .skip 8
num1: .skip 8
num2: .skip 8
num3: .skip 8

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

ldr x0, =input3 //Load the address of the input format string into x0
ldr x1, =num3 //Load the address of the variable 'num3' into x1
bl scanf //Call the scanf function to read an integer from the user


//Loading all the numbers:
ldr x20, =num0 //Load the value of 'num0' into x20
ldr x21, [x20] //Get the value at the actual memory location

ldr x22, =num1 //Load the value of 'num1' into x22
ldr x23, [x22] //Get the value at the actual memory location

ldr x24, =num2 //Load the value of 'num2' into x24
ldr x25, [x24] //Get the value at the actual memory location

ldr x26, =num3 //Load the value of 'num3' into x26
ldr x27, [x26] //Get the value at the actual memory location


//Finding the sum of num0 + num1
add x20, x21, x23 //num0 + num1 --> sum0

//Finding the sum of num0 + num2
add x22, x21, x25 //num0 + num2 --> sum1

//Finding the sum of num0 + num3
add x24, x21, x27 //num0 + num3 --> sum2

//Finding the sum of num1 + num2
add x26, x23, x25 //num1 + num2 --> sum3   

//Finding the sum of num1 + num3
add x28, x23, x27 //num1 + num3 --> sum4

//Finding the sum of num2 + num3
add x29, x25, x27 //num2 + num3 --> sum5


//Finding which sum is largest:
mov x19, x20 //Initialize the greatest sum to sum0


//Compare sum1 to the greatest sum:
cmp x22, x19
b.le compare_sum2
mov x19, x22

//Compare sum2 to the greatest sum:
compare_sum2:
cmp x24, x19   
b.le compare_sum3
mov x19, x24

//Compare sum3 to the greatest sum:
compare_sum3:
cmp x26, x19  
b.le compare_sum4
mov x19, x26

//Compare sum4 to the greatest sum:
compare_sum4:
cmp x28, x19
b.le compare_sum5
mov x19, x28

//Compare sum5 to the greatest sum:
compare_sum5:
cmp x29, x19
b.le print_output
mov x19, x29



//Print the greatest sum:  
print_output:
ldr x0, =output0 //Load the address of the output format string into x0
mov x1, x19 //Move the greatest sum into x1
bl printf //Call the printf function to print the greatest sum


//RETURN
ldp x29, x30, [sp], #16 //Pop the frame pointer and return address from the stack
ret