
        .data
prompt: .asciz "Enter the quantity of grains in litres: "
out1:   .asciz "\nMakokopo (20L): "
out2:   .asciz "\nRemaining litres: "

        .text
        .globl main
main:
        # Print prompt
        li a7, 4              # print string
        la a0, prompt
        ecall

        # Read integer (litres)
        li a7, 5              # read int
        ecall
        mv t0, a0             # store litres in t0

        # Divide by 20
        li t1, 20
        div t2, t0, t1        # t2 = litres / 20
        rem t3, t0, t1        # t3 = litres % 20

        # Print makokopo result
        li a7, 4
        la a0, out1
        ecall
        li a7, 1
        mv a0, t2
        ecall

        # Print remainder
        li a7, 4
        la a0, out2
        ecall
        li a7, 1
        mv a0, t3
        ecall

        # Exit
        li a7, 10
        ecall

