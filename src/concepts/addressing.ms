.NH 2
.XN Addressing
.LP
The FBDL specification does not impose byte or word addressing.
There is also no property allowing to switch between these two addressing modes.
The addressing mode handling is completely left to the particular compiler implementation.
If the compiler has monolithic structure (no distinciton between the compiler frontend and backend) then it is probably the best decision to use the addressing mode used by the target bus (for example byte addressing for AXI or word addressing for Wishbone).
Another option is provoding compiler flag or parameter allowing to specify the addressing mode during the program call.
However, in case of a compiler frontend implementation it is recommended to use word addressing with word width equal to the bus width.
As it is not known whether the compiler backend will use the word or byte addressing, using the word addressing in compiler frontned is usually a simpler approach, as the byte addresses are word addresses multiplied by the number of bytes in the single word.
