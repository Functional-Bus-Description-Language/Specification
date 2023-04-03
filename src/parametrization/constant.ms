.NH 2
.XN Constant
.LP
The constant represents a constant value.
The value might be used in expression evaluations.
The following code presents bus with three functionalities, all having the same array dimensions and width.
.QP
\fCMain \f[CB]width\fC
.br
	\f[CB]const \fCELEMENT_COUNT = 4
.br
	\f[CB]const \fCWIDTH = 8
.br
	C [ELEMENT_COUNT]\f[CB]config\fC; width = WIDTH
.br
	M [ELEMENT_COUNT]\f[CB]mask\fC; width = WIDTH
.br
	S [ELEMENT_COUNT]\f[CB]status\fC; width = WIDTH
.LP
Constants must be included in the generated code, both for the provider and for the requester.
This allows for having a single source of the constant value.
.LP
A constant can be defined in a single line in the single line constant definition or as a part of the multi constant definition.
.LP
\fCsingle_constant_definition ::= \f[CB]const\fC identifier \f[CB]=\fC expression newline
.LP
Examples of single constant definition:
.QP
\f[CB]const\fC WIDTH = 16
.br
\f[CB]const\fC FOO = 8 * BAR
.br
\f[CB]const\fC LIST = [1, 2, 3, 4, 5]
.LP
\fCmulti_constant_definition ::=
.br
	\f[CB]const\fC newline
.br
	indent
.br
	identifier \f[CB]=\fC expression newline
.br
	{ identifier \f[CB]=\fC expression newline }
.br
	dedent
.LP
Examples of multi constant definition:
.QP
\f[CB]const\fC
.br
	WIDTH = 16
.br
	FOO = 8 * BAR
.br
	LIST = [1, 2, 3, 4, 5]
.br
\f[CB]const\fC
.br
	ONE = 1
.br
	TWO = ONE + 1
.br
	THREE = TWO + 1
