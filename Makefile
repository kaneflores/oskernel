# flags
flags :=
cflags :=
ldflags :=

# bootloader (focus on kernel, but focus on loading the kernel
loader.img: loader.o
	ld --script=loader.ld $< -o $@
	chmod -x $@
	truncate -s "%512" $@
	rm -f kernel.img
	dd if=/dev/zero of=kernel.img bs=1 count=512
	
loader.o: loader.asm
	nasm $(flags) $<
