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
	stwu 1,-48(1)
	mflr 0
	stw 0,52(1)
	stw 31,44(1)
	mr 31,1
	stw 3,24(31)
	stw 4,28(31)
	lwz 0,8(31)
	li 9,0
	mr 11,0
	stw 9,0(11)
	lwz 0,8(31)
	mr 9,0
	lwz 0,0(9)
	addic 9,0,13
	lwz 0,8(31)
	mr 11,0
	stw 9,0(11)
	lis 0,.LC0@ha
	addic 3,0,.LC0@l
	bl puts
	li 0,0
	mr 3,0
	addi 11,31,48
	lwz 0,4(11)
	mtlr 0
	lwz 31,-4(11)
	mr 1,11
	blr
	.size	main,.-main
	.ident	"GCC: (Debian 4.6.3-14) 4.6.3"
	.section	.note.GNU-stack,"",@progbits
