CC=c99
CFLAGS=-O2 -Wall -Wextra -pedantic
NASM=nasm
NASMFLAGS=-f elf64

all: sample

sample: sample_wrapper.o

.nasm.o:
	$(NASM) $(NASMFLAGS) -o $@ $<

.asm.o:
	$(NASM) $(NASMFLAGS) -o $@ $<

clean:
	@$(RM) -fv sample *.o

.SUFFIXES:
.SUFFIXES: .o .c .nasm .asm
.PHONY: all clean
.PRECIOUS: sample.o
.POSIX: