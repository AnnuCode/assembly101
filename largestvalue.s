.globl _start
.section .data
numberofnumbers:
.quad 7
mynumbers:
.quad 2,4,22,42,56,82,7

.section .text
_start:

# no $ means numberofnumbers is treated as an address, content of that address is moved to rcx (direct memory mode)
movq numberofnumbers, %rcx

# $ sign means mynumbers is treated as a value, remember, mynumbers is just a 8 bytes long number (immediate mode)
movq $mynumbers, %rbx

movq $0, %rdi
cmp $0, %rcx
je endloop

myloop:

# content of %rbx is an address, go to that address and get the value living in that address
movq (%rbx), %rax
cmp %rdi, %rax
jbe loopcontrol

/* what is the difference between this and the register indirect mode? The content of rax is treated as a value, not address */
movq %rax, %rdi

loopcontrol:
addq $8, %rbx
loopq myloop

endloop:
movq $60, %rax
syscall