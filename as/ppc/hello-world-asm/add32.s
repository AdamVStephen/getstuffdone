# Ref http://www.ds.ewi.tudelft.nl/vakken/in1006/instruction-set/

# Data sections hold writable memory declarations
.data
.align 3 # Guessing this is to 2^2 = 4 byte boundary, example was 3->8 byte (64 bit)

# First and second values
first_value:
	# "quad" emits an 8-byte entity, so what do I do for 4 bytes ?
	.quad 16
second_value:
	.quad 32

# Official Procedure Descriptor gets a section
.section ".opd", "aw"
.align 3

.global _start
.text
._start:
	lis 7,first_value@h
	ori 7,7, first_value@l
	lwz 4,0(7)
	lis 7,second_value@h
	ori 7,7,second_value@l
	lwz 5,0(7)
	add 6,4,5
	li 0,1
	mr 3,6
	sc
