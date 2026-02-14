.global start
.section .text

_start:
    mov x19, #32 //Hello World
    add x0, x19, xzr
    bf printf
    return