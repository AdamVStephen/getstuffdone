# Ref http://www.ds.ewi.tudelft.nl/vakken/in1006/instruction-set/

# Data sections hold writable memory declarations
.data
.align 2 # Guessing this is to 2^2 = 4 byte boundary, example was 3->8 byte (64 bit)

# First and second values
first_value:
	# "quad" emits an 8-byte entity, so what do I do for 4 bytes ?
	.quad 271
secnd_value:
	.quad 314

# Official Procedure Descriptor gets a section
.section ".opd", "aw"
.align 2

.global _start
_start:
	.quad ._start, .TOC.@tocbase, 0

.text
._start:
	lis 7,first_value@highest
	ori 7,7, first_value@higher
	ld 4,0(7)
	lis 7,second_value@highest
	ori 7,7,second_value@higher
	ld 5,0(7)
	add 6,4,5
	li 0,1
	mr 3,6
	sc
