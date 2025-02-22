.globl _start
.section .data

numberofnumbers:
.quad 7
mynumbers:
.quad 4,3,7,23,55,34,62

.section .text
_start:
movq numberofnumbers, %rcx
movq $0, %rdi

// check before entering the loop
cmp $0, %rcx
je endloop

myloop:
movq mynumbers-8(,%rcx, 8), %rax
cmp %rdi, %rax
// will jump if value in rax is less than value in rdi
jbe loopcontrol
movq %rax, %rdi

loopcontrol: 
loopq myloop

endloop:
movq $60, %rax
syscall