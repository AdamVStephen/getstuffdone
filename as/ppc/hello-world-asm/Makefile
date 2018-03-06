
add64.o : add64.s
	as -a64 $< -o $@

%.o : %.s
	as $< -o $@

%.exe : %.o
	ld $< -o $@


all : add32.exe add64.exe hw32.exe

clean :
	rm -f *.o *.exe


