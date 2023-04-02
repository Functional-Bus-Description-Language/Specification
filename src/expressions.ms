.bp
.NH 1
.XN Expressions
.LP
An expression is a formula that defines the computation of a value by applying operators and functions to operands.
.
.LP
\fCexpression ::=
.br
	bool_literal |
.br
	integer_literal |
.br
	real_literal |
.br
	string_literal |
.br
	bit_string_literal |
.br
	time_literal |
.br
	declared_identifier |
.br
	qualified_identifier |
.br
	unary_operation |
.br
	binary_operation |
.br
	function_call |
.br
	subscript |
.br
	parenthesized_expression |
.br
	expression_list
\fR
.sp 0.5
\fC function_call ::=
.br
	declared_identifier\f[CB](\fC [ expression { \f[CB],\fC expression } ] \f[CB])\fR
.sp 0.5
\fC subscript ::= declared_identifier\f[CB][\fC expression \f[CB]]\fR
.sp 0.5
\fC parenthesized_expression ::= \f[CB](\fC expression \f[CB])\fR
.sp 0.5
\fC expression_list ::= \f[CB][\fC [ expression { \f[CB],\fC expression } ] \f[CB]]\fR
.NH 2
.XN Operators
.LP
\fCbinary_operation ::= expression binary_operator expression\fR
.sp
\fCbinary_operator ::=
.br
	binary_arithmetic_operator |
.br
	binary_logical_operator |
.br
	binary_shift_operator
.sp
\fCbinary_arithmetic_operator ::= \f[CB]+\fC | \f[CB]-\fC | \f[CB]*\fC | \f[CB]/\fC | \f[CB]%\fC | \f[CB]**\fC
.sp
\fCbinary_logical_operator ::= \f[CB]&&\fC | \f[CB]||\fC
.sp
\fCbinary_shift_operator ::= \f[CB]<<\fC | \f[CB]>>\fR
.
.TS
tab(;) center;
c s s
c | c | c .
FBDL binary arithmetic operators
_
Token;Operation;Name
_
\fC+\fR;Addition;bar
\fC-\fR;Subtraction;bar
\fC*\fR;Multiplication;bar
\fC/\fR;Division;bar
\fC%\fR;Remainder;bar
\fC**\fR;Exponentiation;bar
.TE
.TS
tab(;) center;
c s s
c | c | c .
FBDL binary logical operators
_
Token;Name;Name
_
\fC&&\fR;Short-circuiting logical AND;bar
\fC||\fR;Short-circuiting logical OR;bar
.TE
.TS
tab(;) center;
c s s
c | c | c .
FBDL binary shift operators
_
Token;Name;Name
_
\fC<<\fR;Left shift;bar
\fC>>\fR;Right shift;bar
.TE
.
.NH 2
.XN Functions
.LP
The FBDL does not allow defining custom functions for value computations.
However, FBDL has following built-in functions:
.IP "\f[CB]abs\f[CW](x integer|real) integer|real\f[]" 0.2i
Abs returns the absolute value of x.
.IP "\f[CB]bool\f[CW](x integer) bool\f[]"
Bool returns a value of the bool type converted from a value x of the integer type.
If x equals 0, then the \fCfalse\fR is returned.
In all other cases the \fCtrue\fR is returned.
.IP "\f[CB]ceil\f[CW](x float) integer\f[]"
Ceil returns the least integer value greater than or equal to x.
.IP "\f[CB]floor\f[CW](x float) integer\f[]"
Floor returns the greatest integer value less than or equal to x.
.IP "\f[CB]log2\f[CW](x float) integer|float\f[]"
Log2 returns the binary logarithm of x.
.IP "\f[CB]log10\f[CW](x float) integer|float\f[]"
Log10 returns the decimal logarithm of x.
.IP "\f[CB]u2\f[CW](x, w integer) integer\f[]"
U2 returns two's complement representation of x as an integer assuming width w.
For example \fCu2(-1, 8)\fR returns 255.
