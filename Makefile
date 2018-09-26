CC=~/llvm-build/bin/clang
AS=/opt/msp430/bin/msp430-elf-as
LD=/opt/msp430/bin/msp430-elf-ld

test: test.o aes.o nanolib.o crt0.o
	$(LD) -e _start -o test $^

crt0.o: crt0.S
	$(AS) -mcpu=430 -o $@ $<

.c.o:
	$(CC) -O2 -S $<
	$(AS) -mcpu=430 -o $@ $(<:.c=.s)

clean:
	rm -f test *.s *.o
