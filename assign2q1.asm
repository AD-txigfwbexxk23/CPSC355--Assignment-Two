.global start
.section .text

_start:
    mov x1, #32 //Hello World
    add x0, x1, xzr
    ret x0
