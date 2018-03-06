# Preprocessing cpp or gcc -E
%.i : %.c
	gcc -E $< -o $@

# Compile to a_ssss_embly

%.s : %.i
	gcc -Wall -S $< -o $@

# as_semble into object code or machine code

%.o : %.s
	as $< -o $@


# Link : actually quite complicated  might be
# ld -dynamic-linker /lib/ld-linux.so.2/usr/lib/crt1.o /usr/lib/crti.o .....

% : %.o
	gcc $< -o $@

# Alternatively gcc -save-temps

all : hw.i hw.s hw.o hw

clean :
	rm -f hw.i hw.s hw.o hw
