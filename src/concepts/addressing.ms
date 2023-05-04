.NH 2
.XN Addressing
.LP
The FBDL specification does not impose byte or word addressing.
There is also no property allowing to switch between these two addressing modes.
The addressing mode handling is completely left to the particular compiler implementation.
If the compiler has a monolithic structure (no distinction between the compiler frontend and backend), then it is probably the best decision to use the addressing mode used by the target bus (for example, byte addressing for AXI or word addressing for Wishbone).
Another option is providing a compiler flag or parameter to specify the addressing mode during the compiler call.
However, in the case of a compiler frontend implementation, it is recommended to use word addressing with a word width equal to the bus width.
As it is not known whether the compiler backend will use the word or byte addressing, using the word addressing in the compiler frontend is usually a more straightforward approach, as the byte addresses are word addresses multiplied by the number of bytes in the single word.
