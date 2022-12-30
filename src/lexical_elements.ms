.bp
.NH
.XN "Lexical elements"
.LP
FBDL has following types of lexical tokens:
.BL
comment,
.BL
identifier,
.BL
indent,
.BL
keyword,
.BL
literal,
.BL
newline.
.
.
.NH 2
.XN Comments
.LP
There is only a single type of comment, a \f[I]single-line comment\f[].
A single line comment starts with '#' character and extends up to the end of the line.
A single-line comment can appear on any line of a FBDL file and may contain any character.
The presence or absence of comments has no influence on whether a description is legal or illegal.
Their sole purpose is to enlighten the human reader.
.
.
.NH 2
.XN Identifiers
.
.
.NH 2
.XN Keywords
.LP
Keywords cannot be used as identifiers.

FBDL has following keywords: \f[B]atomic, bus, const, default, doc, false, func, import, mask, memory, package, param, range, return, static, stream, true\f[].
.
.
.NH 2
.XN Literals
.
.NH 3
.XN "Number literals"
.LP
.sp 0.5
\f[CW]underscore ::= \f[B]_\f[]\f[]
.sp 0.5
\f[CW]zero_digit ::= \f[B]0\f[]\f[]
.sp 0.5
\f[CW]non_zero_decimal_digit ::= \f[B]1 \f[]| \f[B]2 \f[]| \f[B]3 \f[]| \f[B]4 \f[]| \f[B]5 \f[]| \f[B]6 \f[]| \f[B]7 \f[]| \f[B]8 \f[]| \f[B]9\f[]
.sp 0.5
\f[CW]decimal_digit ::= zero_digit | non_zero_decimal_digit\f[]
.sp 0.5
\f[CW]binary_base ::= \f[B]0B \f[]| \f[B]0b\f[]
.sp 0.5
\f[CW]binary_digit ::= \f[B]0 \f[]| \f[B]1\f[]
.sp 0.5
\f[CW]octal_base ::= \f[B]0O \f[]| \f[B]0o\f[]
.sp 0.5
\f[CW]octal_digit ::= \f[B]0 \f[]| \f[B]1 \f[]| \f[B]2 \f[]| \f[B]3 \f[]| \f[B]4 \f[]| \f[B]5 \f[]| \f[B]6 \f[]| \f[B]7
.sp 0.5
\f[CW]hex_base ::= \f[B]0X \f[]| \f[B]0x\f[]
.sp 0.5
\f[CW]hex_digit ::= \f[B]0 \f[]| \f[B]1 \f[]| \f[B]2 \f[]| \f[B]3 \f[]| \f[B]4 \f[]| \f[B]5 \f[]| \f[B]6 \f[]| \f[B]7 \f[]| \f[B]8 \f[]| \f[B]9 \f[]| \f[B]A \f[]| \f[B]a \f[]| \f[B]B \f[]| \f[B]b \f[]| \f[B]C \f[]| \f[B]c \f[]| \f[B]D \f[]| \f[B]d \f[]| \f[B]E \f[]| \f[B]e \f[]| \f[B]F \f[]| \f[B]f
.
.
.NH 3
.XN "Integer literals"
.LP
.sp 0.5
\f[CW]decimal_literal ::= non_zero_decimal_digit {[underscore] decimal_digit}\f[]
.sp 0.5
\f[CW]binary_literal ::= binary_base binary_digit {[underscore] binary_digit}\f[]
.sp 0.5
\f[CW]octal_literal ::= octal_base octal_digit {[underscore] octal_digit}\f[]
.sp 0.5
\f[CW]hex_literal ::= hex_base hex_digit {[underscore] hex_digit}\f[]
.
.NH 3
.XN "Real literals"
.LP
The real literals shall be represented as described by IEEE Std 754, an IEEE standard for double-precision floating-point numbers.
.LP
Real numbers can be specified in either decimal notation (for example, 17.83) or in scientific notation (for example, 13e8, which indicates 13 multiplied by 10 to the eighth power).
Real numbers expressed with a decimal point shall have at least one digit on each side of the decimal point.
.
.NH 3
.XN "String literals"
.LP
.
.NH 3
.XN "Bit string literals"
.LP
We will see if there is a need for for bit string literal.
