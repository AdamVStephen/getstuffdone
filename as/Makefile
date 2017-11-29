### Makefile --- 

## Author: astephen@freia017.hpc.l
## Version: $Id: Makefile,v 0.0 2017/11/29 13:12:40 astephen Exp $
## Keywords: 
## X-URL: 

%.o : %.s
	as -gstabs -o $@ $<

%.exe : %.o
	ld -o $@ $<

all : eatsyscall.exe

### Makefile ends here
