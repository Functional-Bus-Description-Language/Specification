.bp
.NH
.XN Parametrization
.LP
The FBDL provides following three ways for description parametrization:
.BL
constants,
.BL
type definitions,
.BL
types extending.
.
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
\fC single_constant_definition ::= \f[CB]const\fC identifier \f[CB]=\fC expression newline
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
.
.NH 2
.XN Type definition
.
.NH 2
.XN Type extending
.LP
The the extending allows extending any custom defined type, either by instantiation or by defining new type.
This is especially, but not only, useful when there are similar blocks with only slightly different set of functionalities.
.LP
Example:
.QP
\f[CB]type\fC blk_common_t \f[CB]block\fC
.br
	C1 \f[CB]config\fC
.br
	M1 \f[CB]mask\fC
.br
	S1 \f[CB]status\fC
.br
Main \f[CB]bus\fC
.br
	Blk_C blk_common_t
.br
		C2 \f[CB]config\fC
.br
	Blk_M blk_common_t
.br
		M2 \f[CB]mask\fC
.br
	Blk_S blk_common_t
.br
		S2 \f[CB]status\fC
.
.LP
This description is equivalent to the following description:
.QP
\f[CB]type\fC blk_common_t \f[CB]block\fC
.br
	C1 \f[CB]config\fC
.br
	M1 \f[CB]mask\fC
.br
	S1 \f[CB]status\fC
.br
\f[CB]type\fC blk_C_t blk_common_t
.br
	C2 \f[CB]config\fC
.br
\f[CB]type\fC blk_M_t blk_common_t
.br
	M2 \f[CB]mask\fC
.br
\f[CB]type\fC blk_S_t blk_common_t
.br
	S2 \f[CB]status\fC
.br
Main \f[CB]bus\fC
.br
	Blk_C blk_C_t
.br
	Blk_M blk_M_t
.br
	Blk_S blk_S_t
.
.LP
The type nesting has no depth limit.
However, no property already set in one of the ancestor types can be overwritten.
Also no symbol identifier defined in one of the ancestor types can be redefined.
