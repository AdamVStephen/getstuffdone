	.file	"hw.c"
	.section	.rodata
	.align 2
.LC0:
	.string	"Hello World"
	.section	".text"
	.align 2
	.globl main
	.type	main, @function
main:
	stwu 1,-32(1)
	mflr 0
	stw 0,36(1)
	stw 31,28(1)
	mr 31,1
	stw 3,8(31)
	stw 4,12(31)
	lis 0,.LC0@ha
	addic 3,0,.LC0@l
	bl puts
	li 0,0
	mr 3,0
	addi 11,31,32
	lwz 0,4(11)
	mtlr 0
	lwz 31,-4(11)
	mr 1,11
	blr
	.size	main,.-main
	.ident	"GCC: (Debian 4.6.3-14) 4.6.3"
	.section	.note.GNU-stack,"",@progbits
