test: test.o aes.o nanolib.o crt0.o
	msp430-ld -e _start -o test $^

crt0.o: crt0.S
	msp430-as -o $@ $<

.c.o:
	~/llvm-build/bin/clang -O2 -S $<
	msp430-as -o $@ $(<:.c=.s)

clean:
	rm -f test *.s *.o
