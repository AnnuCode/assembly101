.globl _start
.section .data

numberofnumbers:
.quad 7
mynumbers:
.quad 3,6,34,55,43,37,44
desired:
.quad 99

.section .text
_start:
movq numberofnumbers, %rcx
movq $0, %rdi

// check before entering the loop
cmp $0, %rcx
je endloop

myloop:
movq mynumbers-8(,%rcx, 8), %rax
cmp desired, %rax
jne loopcontrol
movq $1, %rdi

loopcontrol: 
loopq myloop

endloop:
movq $60, %rax
syscall


// how to handle the case of returning 0 if the desired number is not found? By starting rdi with 0
// note that while comparing value with a register, value should be the first argument