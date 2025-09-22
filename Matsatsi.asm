#include <iostream>
#include <string>
#using namespace std;

#int main() {
    
#    const string days[8] = {
#        "",            // placeholder for index 0
#        "Mantaha",     // 1 - Monday
#        "Labobeli",    // 2 - Tuesday
#        "Laboraro",    // 3 - Wednesday
#        "Labone",      // 4 - Thursday
#        "Labohlano",   // 5 - Friday
#        "Moqebelo",    // 6 - Saturday
#        "Sontaha"      // 7 - Sunday
#    };

#    int d;
#    cout << "Enter a number (1-7): ";
#    if (!(cin >> d)) {
#        cerr << "Error: invalid input." << endl;
#        return 1;
#    }

#    if (d >= 1 && d <= 7) {
#        cout << days[d] << endl;
#    } else {
#        cout << "Error: number must be between 1 and 7." << endl;
#    }

#    return 0;
#}


    .data
prompt:     .asciz "Enter a number (1-7): "
errormsg:   .asciz "Error: number must be between 1 and 7.\n"

day1:       .asciz "Mantaha\n"
day2:       .asciz "Labobeli\n"
day3:       .asciz "Laboraro\n"
day4:       .asciz "Labone\n"
day5:       .asciz "Labohlano\n"
day6:       .asciz "Moqebelo\n"
day7:       .asciz "Sontaha\n"

    .text
    .globl main
main:
    # print prompt
    la   a0, prompt
    li   a7, 4          # syscall: print string
    ecall

    # read integer input
    li   a7, 5          # syscall: read int
    ecall
    mv   t0, a0         # t0 = user input

    # check numbers 1–7
    li   t1, 1
    beq  t0, t1, print_day1
    li   t1, 2
    beq  t0, t1, print_day2
    li   t1, 3
    beq  t0, t1, print_day3
    li   t1, 4
    beq  t0, t1, print_day4
    li   t1, 5
    beq  t0, t1, print_day5
    li   t1, 6
    beq  t0, t1, print_day6
    li   t1, 7
    beq  t0, t1, print_day7

    # if no match → error
    la   a0, errormsg
    li   a7, 4
    ecall
    j    exit

print_day1:
    la   a0, day1
    li   a7, 4
    ecall
    j    exit

print_day2:
    la   a0, day2
    li   a7, 4
    ecall
    j    exit

print_day3:
    la   a0, day3
    li   a7, 4
    ecall
    j    exit

print_day4:
    la   a0, day4
    li   a7, 4
    ecall
    j    exit

print_day5:
    la   a0, day5
    li   a7, 4
    ecall
    j    exit

print_day6:
    la   a0, day6
    li   a7, 4
    ecall
    j    exit

print_day7:
    la   a0, day7
    li   a7, 4
    ecall

exit:
    li   a7, 10         # syscall: exit
    ecall
