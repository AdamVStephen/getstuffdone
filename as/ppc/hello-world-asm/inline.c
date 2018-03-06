

// Examples of inline assembler, with inspiration from the GCC docs and confluence link.

/*
General format is 

asm [volatile] (  Assembly template : OutputOperands [ : InputOperands [ : Clobbers ] ])

Assembler Template : fix text, plus tokens referring to parameters
OutputOperands : comma separated list of C variables modified by assembler
InputOperatnds : comma separated list of C variables read by assembler
Clobbers : comma separated list of registers or other values changed (above and beyond outputs)
Max operands = 30  : an operand that is "+" read and written consumes two spots

(also some goto stuff, but omitted here)

Parameters are referred to positionally as %0, %1, %2, ...

Constraints qualify the operands as followss : 

"=": variable overwriting an existing value
"+": variable overwriting an existing value and read and write
"r": indicates operand to be placed in register
"m": indicates operand to be read from memory (not possible in ppc as I understand it)
"rm": indicates either is acceptable
"&" : indicates output must noteoverlap an input
"f" indicates a floating point register (ppc?)

Arrays can be handled - the syntax is more complex still
PPC has a bucket load of modifier options.

other subtle ordering issues arise if two output operands are set for register/memory
because GCC makes assumptions about hadnling all registers before memory.
Operand modifiers are per system - different for x86/ppc

Input operands can be expressions such as (Offset / 8)

Clobber registers are not used for input/output and so can be reserved for the asm code.
"cc" means flags register is modified
"memory" mesans memory reads/writes other than operands are made (not ppc)


e.g.

__asm__ volatile(@btsl %2,%1\n\t"
	"sbb %0,%0"
	: "=r" (old), "+rm" (*Base)
	: "Ir" (Offset)
	: "cc");
return old;

In general, this is low level.   You need to have some understanding of what the chip does, and what good practice is.   Ensuring the the prior and post stages work correctly and that the compiler doesn't then screw up the assembler by optimizations is also important.

Note also that the compiler could on some days choose register allocations that do not conflict with the code, and then under other circumstances get in the way, so again, lots of care and understanding is required to get this uniformly correct.

