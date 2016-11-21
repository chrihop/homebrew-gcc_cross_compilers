GCC Cross Compilers for OS X
============================

1. What is the difference between 'i386-elf-*' and 'i686-elf-*'?

Please reference to [x86 Options](https://gcc.gnu.org/onlinedocs/gcc-6.2.0/gcc/x86-Options.html#x86-Options) of gcc documentation. 'i386' will generate binaries for original Intel i386 CPU, and compatible with all descendants. 'i686' is for 'Pentium Pro' instruction set, which has more performance optimization instructions.

