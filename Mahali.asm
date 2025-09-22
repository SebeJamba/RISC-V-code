    .data
prompt:    .asciz "Enter the number of cattle: "
notEnough: .asciz "Not enough for bohali\n"
smallHerd: .asciz "Small herd\n"
wealthy:   .asciz "Wealthy cattle owner\n"

    .text
    .globl main
main:
    # Print prompt
    la a0, prompt       # load address of prompt
    li a7, 4            # syscall: print string
    ecall

    # Read integer input
    li a7, 5            # syscall: read int
    ecall
    mv t0, a0           # store input in t0

    # if (cattle < 8) → Not enough for bohali
    li t1, 8
    blt t0, t1, NOT_ENOUGH

    # else if (cattle <= 30) → Small herd
    li t1, 31
    blt t0, t1, SMALL_HERD

    # else → Wealthy cattle owner
    j WEALTHY

NOT_ENOUGH:
    la a0, notEnough
    li a7, 4
    ecall
    j EXIT

SMALL_HERD:
    la a0, smallHerd
    li a7, 4
    ecall
    j EXIT

WEALTHY:
    la a0, wealthy
    li a7, 4
    ecall

EXIT:
    li a7, 10           # syscall: exit
    ecall
