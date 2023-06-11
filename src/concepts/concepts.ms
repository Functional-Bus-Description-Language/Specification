.bp
.NH
.XN Concepts
.LP
The core concept behind the FBDL is based on the fact that if there is a system part with the registers that can be accessed, then there is at least one more system part accessing these registers.
The part accessing the registers is called the
.I requester .
The part containing the registers is called the
.I provider ,
as it provides functions via particular functionalities.
.
.
.LP
The code generated from the FBDL description can be conceptually divided into two parts, the requester part and the provider part.
The requester code usually refers to the generated software or firmware implemented in typical programming languages such as: Ada, C, C++, Go, Java, Python, Rust etc.
The provider code usually refers to the generated gateware or hardware implemented in hardware description languages or frameworks such as: VHDL, SystemVerilog, SystemC, Bluespec, PipelineC, MyHDL, Chisel etc.
However, implementing the provider for example as a firmware, using the C language and a microcontroller, is practically doable and valid.
.
.
.LP
The description of functionalities shall be placed in files with \fC.fbd\fR extension.
By default, the bus named \fCMain\fR is the entry point for the description used for the code generation.
A compiler is free to support a parameter for changing the name of the main bus.
.sp
\fCdescription ::=
.br
	import_statement |
.br
	constant_definition |
.br
	type_definition |
.br
	instantiation
