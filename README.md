# Computer Architecture Gitpod Repo

This repo contains a small bare-bones Gitpod configuration file which sets up
`nasm` and `gcc` for use in the Compute Architecture course of the Freie Universität
Berlin.  Simply follow the following link
gitpod.io/#https://github.com/LeonardKoenig/fu-ca-gitpod
to open the editor in your browser.  It's set up for use with C (using GCC) and x86
Assembly (using NASM).

If you want to use this repo as a basis for your own code, **please** fork it and open
Gitpod again **with the new URL** pointing to your repo.  Also, if you want to commit
files to Git other than files named `Makefile` or with the file extensions `*.nasm`,
`*.c` and `*.asm`, don't forget to add these as exceptions to the
[Git ignore file](.gitignore).

## Example Sources

We've also included a sample program with a C wrapper `sample_wrapper.c`, a corresponding
ASM source code with a function called `tri_area` in `sample.nasm` and a `Makefile` to
automate building.  However, at first, we recommend building by hand:
```
$ c99 -O2 -c -o sample_wrapper.o sample_wrapper.c
$ nasm -f elf64 -o sample.o sample.nasm
$ c99 -o sample sample_wrapper.o sample.o
```
This will first **compile** the C **source code** to create an object file containing the
translated machine code.  In the second line we do the same, but just for the Assembly
source code.  Finally, we **link** together both translation files into one **executable**
program.  We can now execute it:
```
$ ./sample
Provide exactly two arguments!
$ ./sample 4 3
tri_area(4, 3) = 6
```
If we forget to provide the appropriate program arguments, the "wrapper" (written in C)
will complain about the wrong number of arguments.  If we do however provide console arguments,
it will pass them to our the function written in Assembly.  It will will then calculate the
result and returned it to our wrapper.  Here, the result is printed to the console.
