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
.LP
The function call is used to call one of built-in functions.
.LP
\fC function_call ::=
.br
	declared_identifier\f[CB](\fC [ expression { \f[CB],\fC expression } ] \f[CB])\fR
.LP
The subscript is used to refer to a particular element from the expression list.
.LP
\fCsubscript ::= declared_identifier\f[CB][\fC expression \f[CB]]\fR
.LP
The parenthesized expression may be used to explicitly set order of operations.
.LP
\fCparenthesized_expression ::= \f[CB](\fC expression \f[CB])\fR
.LP
The expression list may be used to create a list of expressions.
.LP
\fCexpression_list ::= \f[CB][\fC [ expression { \f[CB],\fC expression } ] \f[CB]]\fR
.NH 2
.XN Operators
.NH 3
.XN Unary Operators
.LP
\fCunary_operation ::= unary_operator expression\fR
.sp
\fCunary_operator ::= unary_arithmetic_operator | unary_bitwise_operator\fR
.sp
\fCunary_arithmetic_operator ::= \f[CB]-\fR
.sp
\fCunary_bitwise_operator ::= \f[CB]!\fR
.
.TS
tab(;) center;
c s s s
c | c | c | c .
FBDL unary operators
_
\fBToken;Operation;Operand Type; Result Type\fR
_
\fC-\fR;Opposite;Integer;Integer
;;Real;Real
_
;;Bool;Bool
\fC!\fR;Negation;Bit string;Bit string
;;Integer;Integer
.TE
.
.NH 3
.XN Binary Operators
.LP
\fCbinary_operation ::= expression binary_operator expression\fR
.sp
\fCbinary_operator ::=
.br
	binary_arithmetic_operator |
.br
	binary_comparison_operator |
.br
	binary_logical_operator |
.br
	binary_shift_operator
.sp
\fCbinary_arithmetic_operator ::= \f[CB]+\fC | \f[CB]-\fC | \f[CB]*\fC | \f[CB]/\fC | \f[CB]%\fC | \f[CB]**\fC
.sp
\fCbinary_comparison_operator ::= \f[CB]==\fC | \f[CB]!=\fC | \f[CB]<\fC | \f[CB]<=\fC | \f[CB]>\fC | \f[CB]>=\fC
.sp
\fCbinary_logical_operator ::= \f[CB]&&\fC | \f[CB]||\fC
.sp
\fCbinary_shift_operator ::= \f[CB]<<\fC | \f[CB]>>\fR
.
.TS
tab(;) center;
c s s s s
c | c | c | c | c .
FBDL binary arithmetic operators
_
\fBToken;Operation;Left Operand Type;Right Operand Type; Result Type\fR
_
;;Integer;Integer;Integer
;;Integer;Real;Real
\fC+\fR;Addition;Real;Integer;Real
;;Real;Real;Real
;;Time;Time;Time
_
;;Integer;Integer;Integer
\fC-\fR;Subtraction;Integer;Real;Real
;;Real;Integer;Real
;;Real;Real;Real
_
;;Integer;Integer;Integer
;;Integer;Real;Real
\fC*\fR;Multiplication;Real;Integer;Real
;;Real;Real;Real
;;Integer;Time;Time
;;Time;Integer;Time
_
;;Integer;Integer;Real
\fC\\\fR;Division;Integer;Real;Real
;;Integer;Real;Real
;;Real;Real;Real
_
\fC%\fR;Remainder;Integer;Integer;Integer
_
;;Integer;Integer;Real
\fC**\fR;Exponentiation;Integer;Real;Real
;;Real;Integer;Real
.TE
.TS
tab(;) center;
c s s s s
c | c | c | c | c .
FBDL binary comparison operators
_
\fBToken;Operator;Left Operand Type; Right Operand Type;Result\fR
_
;;Integer;Integer;Bool
\fC==\fR;Equality;Integer;Real;Bool
;;Real;Integer;Bool
;;Real;Real;Bool
_
;;Integer;Integer;Bool
\fC!=\fR;Nonequality;Integer;Real;Bool
;;Real;Integer;Bool
;;Real;Real;Bool
_
;;Integer;Integer;Bool
\fC<\fR;Less Than;Integer;Real;Bool
;;Real;Integer;Bool
;;Real;Real;Bool
_
;;Integer;Integer;Bool
\fC<=\fR;Less Than or Equal;Integer;Real;Bool
;;Real;Integer;Bool
;;Real;Real;Bool
_
;;Integer;Integer;Bool
\fC>\fR;Greater Than;Integer;Real;Bool
;;Real;Integer;Bool
;;Real;Real;Bool
_
;;Integer;Integer;Bool
\fC>=\fR;Greater Than or Equal;Integer;Real;Bool
;;Real;Integer;Bool
;;Real;Real;Bool
.TE
.TS
tab(;) center;
c s s s s
c | c | c | c | c .
FBDL binary logical operators
_
\fBToken;Operator;Left Operand Type; Right Operand Type;Result\fR
_
\fC&&\fR;Short-circuiting logical AND;Bool;Bool;Bool
_
\fC||\fR;Short-circuiting logical OR;Bool;Bool;Bool
.TE
.TS
tab(;) center;
c s s s s
c | c | c | c | c .
FBDL binary shift operators
_
\fBToken;Operator;Left Operand Type;Right Operand Type;Result Type\fR
_
\fC<<\fR;Left shift;Integer;Integer;Integer
_
\fC>>\fR;Right shift;Integer;Integer;Integer
.TE
.
.LP
The bool data type is not valid operand type for most of the binary operations.
However, as there is the rule for implicit conversion from the bool data type to the integer data type, all operations accepting the integer operands work also for the bool operands.
.
.NH 2
.XN Functions
.LP
The FBDL does not allow defining custom functions for value computations.
However, FBDL has following built-in functions:
.IP "\f[CB]abs\f[CW](x integer|real) integer|real\f[]" 0.2i
The \fCabs\fR function returns the absolute value of \fCx\fR.
.IP "\f[CB]bool\f[CW](x integer) bool\f[]"
The \fCbool\fR function returns a value of the bool type converted from a value \fCx\fR of the integer type.
If \fCx\fR equals 0, then the \fCfalse\fR is returned.
In all other cases the \fCtrue\fR is returned.
.IP "\f[CB]ceil\f[CW](x float) integer\f[]"
The \fCceil\fR function returns the least integer value greater than or equal to \fCx\fR.
.IP "\f[CB]floor\f[CW](x float) integer\f[]"
The \fCfloor\fR function returns the greatest integer value less than or equal to \fC\fR.
.IP "\f[CB]log2\f[CW](x float) integer|float\f[]"
The \fClog2\fR returns the binary logarithm of \fCx\fR.
.IP "\f[CB]log10\f[CW](x float) integer|float\f[]"
The \fClog10\fR returns the decimal logarithm of \fCx\fR.
.IP "\f[CB]log\f[CW](x, b float) integer|float\f[]"
The \fClog\fR function returns the logarithm of \fCx\fR to the base \fCb\fR.
.IP "\f[CB]u2\f[CW](x, w integer) integer\f[]"
The \fCu2\fR function returns two's complement representation of \fCx\fR as an integer assuming width \fCw\fR.
For example \fCu2(-1, 8)\fR returns 255.
