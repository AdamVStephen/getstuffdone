# From developerworks at IBM library/l-ppc/

.data # section declaration - variables only

msg:
	.string "Hello, world!\n"
	len = . - msg # Length of our string

.text # The program text, or code
	.global _start
_start:
	# Write our string via system call write (4) to stdout (fd 1)
	li	0,4	# System call to gpr0
	li	3,1	# First argument to write is fd, passed by convention in gpr3
	
			# Second argument prepared in gpr4: address of string
	# Note that because the instructions are fixed 32 bits
	# and the opcode, src and dest register take up 16 bits
	# addi can only take a further 16 bits payload as an operand
	# Likewise, li can only load a 16 bit intermediates
	# lis is load immediate shift, which moves into the high 16 bits of gpr4

	lis	4,msg@ha	# Top 16 bits of &msg
	addi	4,4,msg@l	# Bottom 16 bits of &msg
	li	5,len		# Third argument is length
	sc			# Call to kernel
	
	# Exercise : how do we obtain the return code from the system call	
	
	li	0,1	# Prepare to exit via system call 1 sys_exit
	li	3,1	# Passing in exit code 1
	sc


