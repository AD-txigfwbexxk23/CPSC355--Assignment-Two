        .section .rodata
fmt:    .string "Hello from CPSC 355! x = %d\n"

        .text
        .global main

main:
        // Prologue
        stp     x29, x30, [sp, -16]!
        mov     x29, sp

        // printf(fmt, 42)
        adrp    x0, fmt
        add     x0, x0, :lo12:fmt
        mov     w1, #42
        bl      printf

        // return 0
        mov     w0, #0

        // Epilogue
        ldp     x29, x30, [sp], 16
        ret
