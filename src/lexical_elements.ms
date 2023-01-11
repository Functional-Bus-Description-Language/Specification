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
There is only a single type of comment, a \fIsingle-line comment\fR.
A single line comment starts with '#' character and extends up to the end of the line.
A single-line comment can appear on any line of a FBDL file and may contain any character, including glyphs and special characters.
The presence or absence of comments has no influence on whether a description is legal or illegal.
Their sole purpose is to enlighten the human reader.
.NH 3
.XN Documentation comments
.LP
Documentation comments are comments that appear immediately before package scope constant definitions and before functionality instantiations with no intervening newlines.
Following code shows examples of documentation comments:
.QP
\fC# Number of receivers
.br
\f[CB]const\fC RECEIVERS_COUNT = 7 
.br
Main \f[CB]bus\fC
.br
	# Data receivers
.br
	Receivers [RECEIVERS_COUNT]\f[CB]block\fC
.br
		# 0 disable receiver, 1 enable receiver.
.br
		Enable \f[CB]config\fC; \f[CB]width\fC = 1
.br
		# Number of frames in the buffer
.br
		Frame_Count \f[CB]status\fC
.br
		# Read_Frame reads single data frame
.br
		Read_Frame \f[CB]proc\fC
.br
			data [4]\f[CB]return\fC; \f[CB]width\fC = 8
.br
.LP
.
.NH 2
.XN Identifiers
.LP
Identifiers are used as names.
An identifier shall start with a letter.
.LP
\fCuppercase_letter ::= \f[CB]A\fC | \f[CB]B\fC | \f[CB]C\fC | \f[CB]D\fC | \f[CB]E\fC | \f[CB]F\fC | \f[CB]G\fC | \f[CB]H\fC | \f[CB]I\fC | \f[CB]J\fC | \f[CB]K\fC | \f[CB]L\fC | \f[CB]M\fC | \f[CB]N\fC | \f[CB]O\fC | \f[CB]P\fC | \f[CB]R\fC | \f[CB]S\fC | \f[CB]T\fC | \f[CB]U\fC | \f[CB]V\fC | \f[CB]W\fC | \f[CB]X\fC | \f[CB]Y\fC | \f[CB]Z\fR
.LP
\fClowercase_letter ::= \f[CB]a\fC | \f[CB]b\fC | \f[CB]c\fC | \f[CB]d\fC | \f[CB]e\fC | \f[CB]f\fC | \f[CB]g\fC | \f[CB]h\fC | \f[CB]i\fC | \f[CB]j\fC | \f[CB]k\fC | \f[CB]l\fC | \f[CB]m\fC | \f[CB]n\fC | \f[CB]o\fC | \f[CB]p\fC | \f[CB]r\fC | \f[CB]s\fC | \f[CB]t\fC | \f[CB]u\fC | \f[CB]v\fC | \f[CB]w\fC | \f[CB]x\fC | \f[CB]y\fC | \f[CB]z\fR
.LP
\fCletter ::= uppercase_letter | lowercase_letter\fR
.LP
\fCletter_or_digit ::= letter | decimal_digit\fR
.LP
\fCidentifier ::= letter { underscore | letter_or_digit }\fR
.LP
Following code contains some valid and invalid identifiers.
.QP
\f[CB]const\fC C_20 = 20 # Valid
.br
\f[CB]const\fC _C20 = 20 # Invalid
.br
Main \f[CB]bus\fC
.br
	cfg1 \f[CB]config\fC # Valid
.br
	1cfg \f[CB]config\fC # Invalid
.LP
.NH 3
.XN Declared identifier
.LP
Declared identifier is used for any occurrence of an identifier that already denotes some declared item.
.LP
\fCdeclared_identifier ::= letter { underscore | letter_or_digit }\fR
.NH 3
.XN Qualified identifier
.LP
The qualified identifier is used to reference a symbol from foreign .
.LP
\fCqualified_identifier ::= declared_identifier\f[CB].\fCdeclared_identifier
.LP
The first declared identifier denotes the package, and the second one denotes the symbol from this package.
.
.NH 2
.XN Indent
.LP
The indentation has semantics meaning in the FBDL.
There is only single indent character, the horizontal tab (U+0009).
It is hard to express the indent and dedent using BNF.
Ident is the increase of the indentation level and dedent is the decrease of the indentation level.
In the following code the indent happens in the lines number 2, 5 and 7 and the dedent happens in the line number 4.
What is more 2 dedents happens at the EOF.
The number of indents always equals the number of dedents in the syntactically and semantically correct file.
.QP
\fC1: \f[CB]type\fC cfg_t \f[CB]config\fC
.br
2:     \f[CB]atomic\fC = \f[CB]false\fC
.br
3:     \f[CB]width\fC = 64
.br
4: Main \f[CB]bus\fC
.br
5:     C cfg_t
.br
6:     Blk \f[CB]block\fC
.br
7:          C cfg_t
.br
8:          S \f[CB]status\fC
.LP
Not only the indent alignment is important, but also its level.
In the following code the first type definition is correct, as the indent level for the definition body is increased by one.
The second type definition is incorrect, even though the indent within the definition body is aligned, as the indent level is increased by two.
.QP
\f[CB]type\fC cfg1_t \f[CB]config\fC
.br
	\f[CB]atomic\fC = \f[CB]false\fC
.br
.br
	\f[CB]width\fC = 8
.br
\f[CB]type\fC cfg2_t \f[CB]config\fC
.br
		\f[CB]atomic\fC = \f[CB]false\fC
.br
		\f[CB]width\fC = 8
.
.NH 2
.XN Keywords
.LP
Keywords cannot be used as identifiers.

FBDL has following keywords: \fBatomic, block, bus, const, default, doc, false, import, mask, memory, param, proc, range, return, static, stream, true\fR.
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
