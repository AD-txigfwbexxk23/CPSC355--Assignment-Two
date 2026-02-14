        .section .rodata
fmt:    .string "Meaning of life = %d\n"

        .text
        .global main
main:
        stp     x29, x30, [sp, -16]!
        mov     x29, sp

        adrp    x0, fmt
        add     x0, x0, :lo12:fmt
        mov     w1, #42
        bl      printf

        mov     w0, #0
        ldp     x29, x30, [sp], 16
        ret
