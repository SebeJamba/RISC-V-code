#include <iostream>
#using namespace std;

#int main() {
#    int n;
#    cout << "Enter height n: ";
#    cin >> n;

#    for (int i = 1; i <= n; i++) {
#        for (int j = 1; j <= i; j++) {
#            cout << "*";
#        }
#        cout << endl;
#    }

#    return 0;
#}



.data
prompt: .asciz "Enter height n: "
star:   .asciz "*" # String for the star
newline: .asciz "\n" # String for the newline

.text
.globl main
main:
    # print prompt
    la   a0, prompt      # address of prompt string
    li   a7, 4           # syscall: print string
    ecall

    # read integer n
    li   a7, 5           # syscall: read int
    ecall
    mv   t0, a0          # t0 = n

    li   t1, 1           # t1 = current line i (starts at 1)

outer_loop:
    bgt  t1, t0, done    # if i > n, finished

    li   t2, 0           # t2 = inner counter j (how many stars printed this line)

inner_loop:
    beq  t2, t1, line_done # if j == i, end this line
    
    # Use syscall 4 (print string) to print the star
    la   a0, star        # load address of star string
    li   a7, 4           # syscall: print string
    ecall

    addi t2, t2, 1      # j++
    j    inner_loop

line_done:
    # Use syscall 4 (print string) to print the newline
    la   a0, newline     # address of newline string
    li   a7, 4           # syscall: print string
    ecall

    addi t1, t1, 1      # i++
    j    outer_loop

done:
    li   a7, 10          # syscall: exit
    ecall