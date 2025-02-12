.globl _start
.section .data
numberofnumbers:
.quad 7
mynumbers:
.quad 4,3,7,23,55,34,62

.section .text
_start:
movq numberofnumbers, %rcx
movq $0, %rbx
movq $0, %rdi

// check before entering the loop
cmp $0, %rcx
je endloop

myloop:

// put the next number from array to rax 
movq mynumbers(,%rbx, 8), %rax
cmp %rdi, %rax
jbe loopcontrol
movq %rax, %rdi

loopcontrol: 
incq %rbx
loopq myloop

endloop:
movq $60, %rax
syscall