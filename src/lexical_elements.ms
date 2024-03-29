.bp
.NH
.XN Lexical elements
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
A single-line comment starts with the '#' character and extends up to the end of the line.
A single-line comment can appear on any line of an FBDL file and may contain any character, including glyphs and special characters.
The presence or absence of comments has no influence on whether a description is legal or illegal.
Their sole purpose is to enlighten the human reader.
.
.
.NH 3
.XN Documentation comments
.LP
Documentation comments are comments that appear immediately before constant definitions, type definitions, and functionality instantiations with no intervening newlines.
The following code shows examples of documentation comments:
.QP
\f[CI]# Number of receivers\fC
.br
\f[CB]const\fC RECEIVERS_COUNT = 7 
.br
Main \f[CB]bus\fC
.br
	\f[CI]# Data receivers\fC
.br
	Receivers [RECEIVERS_COUNT]\f[CB]block\fC
.br
		\f[CI]# 0 disable receiver, 1 enable receiver\fC
.br
		Enable \f[CB]config\fC; \f[CB]width\fC = 1
.br
		\f[CI]# Number of frames in the buffer\fC
.br
		Frame_Count \f[CB]status\fC
.br
		\f[CI]# Read_Frame reads single data frame\fC
.br
		Read_Frame \f[CB]proc\fC
.br
			data [4]\f[CB]return\fC; \f[CB]width\fC = 8
.br
.LP
.
.
.NH 2
.XN Identifiers
.LP
Identifiers are used as names.
An identifier shall start with a letter.
.sp
\fCuppercase_letter ::= \f[CB]A\fC | \f[CB]B\fC | \f[CB]C\fC | \f[CB]D\fC | \f[CB]E\fC | \f[CB]F\fC | \f[CB]G\fC | \f[CB]H\fC | \f[CB]I\fC | \f[CB]J\fC | \f[CB]K\fC | \f[CB]L\fC | \f[CB]M\fC |
.br
	\f[CB]N\fC | \f[CB]O\fC | \f[CB]P\fC | \f[CB]R\fC | \f[CB]S\fC | \f[CB]T\fC | \f[CB]U\fC | \f[CB]V\fC | \f[CB]W\fC | \f[CB]X\fC | \f[CB]Y\fC | \f[CB]Z\fR
.sp
\fClowercase_letter ::= \f[CB]a\fC | \f[CB]b\fC | \f[CB]c\fC | \f[CB]d\fC | \f[CB]e\fC | \f[CB]f\fC | \f[CB]g\fC | \f[CB]h\fC | \f[CB]i\fC | \f[CB]j\fC | \f[CB]k\fC | \f[CB]l\fC | \f[CB]m\fC |
.br
	\f[CB]n\fC | \f[CB]o\fC | \f[CB]p\fC | \f[CB]r\fC | \f[CB]s\fC | \f[CB]t\fC | \f[CB]u\fC | \f[CB]v\fC | \f[CB]w\fC | \f[CB]x\fC | \f[CB]y\fC | \f[CB]z\fR
.sp
\fCletter ::= uppercase_letter | lowercase_letter\fR
.sp
\fCletter_or_digit ::= letter | decimal_digit\fR
.sp
\fCidentifier ::= letter { underscore | letter_or_digit }\fR
.sp
Following code contains some valid and invalid identifiers.
.QP
\f[CB]const\fC C_20 = 20 \f[CI]# Valid\fC
.br
\f[CB]const\fC _C20 = 20 \f[CI]# Invalid\fC
.br
Main \f[CB]bus\fC
.br
	cfg1 \f[CB]config\fC \f[CI]# Valid\fC
.br
	1cfg \f[CB]config\fC \f[CI]# Invalid\fC
.LP
.NH 3
.XN Declared identifier
.LP
Declared identifier is used for any occurrence of an identifier that already denotes some declared item.
.sp
\fCdeclared_identifier ::= letter { underscore | letter_or_digit }\fR
.NH 3
.XN Qualified identifier
.LP
The qualified identifier is used to reference a symbol from foreign package.
.sp
\fCqualified_identifier ::= declared_identifier\f[CB].\fCdeclared_identifier\fR
.sp
The first declared identifier denotes the package, and the second one denotes the symbol from this package.
.
.NH 2
.XN Indent
.LP
The indentation has semantics meaning in the FBDL.
There is only a single indent character, the horizontal tab (U+0009).
It is hard to express the indent and dedent using BNF.
Ident is the increase of the indentation level, and dedent is the decrease of the indentation level.
In the following code the indent happens in the lines number 2, 5 and 7, and the dedent happens in the line number 4.
What is more, double dedent happens at the EOF.
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
\f[CI]# Valid indent\fC
.br
\f[CB]type\fC cfg1_t \f[CB]config\fC
.br
	\f[CB]atomic\fC = \f[CB]false\fC
.br
.br
	\f[CB]width\fC = 8
.br
\f[CI]# Invalid indent, indent increased by two\fC
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
FBDL has following keywords: \fBatomic, block, bus, clear, config, const, doc, false, import, init-value, irq, mask, memory, param, proc, range, reset, read-value, reset-value, return, static, stream, true, type, in-trigger, out-trigger\fR.
.LP
Keywords can be used as identifiers with one exception.
Keywords denoting built-in types (functionalities) cannot be used as identifiers for custom types.
.
.NH 2
.XN Literals
.
.NH 3
.XN Bool literals
.LP
\fCbool_literal ::= \f[CB]false\fC | \f[CB]true\fR
.
.NH 3
.XN Number literals
.LP
\fCunderscore ::= \f[CB]_\fC
.sp
\fCzero_digit ::= \f[CB]0\fC
.sp
\fCnon_zero_decimal_digit ::= \f[CB]1\fC | \f[CB]2\fC | \f[CB]3\fC | \f[CB]4\fC | \f[CB]5\fC | \f[CB]6\fC | \f[CB]7\fC | \f[CB]8\fC | \f[CB]9\fC
.sp
\f[CW]decimal_digit ::= zero_digit | non_zero_decimal_digit\f[]
.sp
\fCbinary_base ::= \f[CB]0B\fC | \f[CB]0b\fC
.sp
\fCbinary_digit ::= \f[CB]0\fC | \f[CB]1\fC
.sp
\fCoctal_base ::= \f[CB]0O\fC | \f[CB]0o\fC
.sp
\fCoctal_digit ::= \f[CB]0 \fC| \f[CB]1 \fC| \f[CB]2 \fC| \f[CB]3 \fC| \f[CB]4 \fC| \f[CB]5 \fC| \f[CB]6 \fC| \f[CB]7
.sp
\fChex_base ::= \f[CB]0X\fC | \f[CB]0x\fR
.sp
\fChex_digit ::= \f[CB]0\fC | \f[CB]1\fC | \f[CB]2\fC | \f[CB]3\fC | \f[CB]4\fC | \f[CB]5\fC | \f[CB]6\fC | \f[CB]7\fC | \f[CB]8\fC | \f[CB]9\fC |
.br
	\f[CB]A\fC | \f[CB]a\fC | \fBB\fC | \fBb\fC | \fBC\fC | \fBc\fC | \fBD\fC | \fBd\fC | \fBE\fC | \fBe\fC | \fBF\fC | \fBf\fR
.
.
.NH 3
.XN Integer literals
.LP
\fCinteger_literal ::=
.br
	binary_literal |
.br
	octal_literal |
.br
	decimal_literal |
.br
	hex_literal
.sp
\f[CW]binary_literal ::= binary_base binary_digit {[underscore] binary_digit}\f[]
.sp
\f[CW]octal_literal ::= octal_base octal_digit {[underscore] octal_digit}\f[]
.sp
\f[CW]decimal_literal ::= non_zero_decimal_digit {[underscore] decimal_digit}\f[]
.sp
\f[CW]hex_literal ::= hex_base hex_digit {[underscore] hex_digit}\f[]
.
.NH 3
.XN Real literals
.LP
The real literals shall be represented as described by IEEE Std 754, an IEEE standard for double-precision floating-point numbers.
.LP
Real numbers can be specified in either decimal notation (for example, 17.83) or in scientific notation (for example, 13e8, which indicates 13 multiplied by 10 to the eighth power).
Real numbers expressed with a decimal point shall have at least one digit on each side of the decimal point.
.
.NH 3
.XN String literals
.LP
A string literal is a sequence of zero or more UTF-8 characters enclosed by double quotes ("").
.br
.sp
\fCstring_literal ::= \f[CI]"\fC{UTF-8 character}\f[CI]"\fR
.
.NH 3
.XN Bit string literals
.LP
A bit string literal is a sequence of zero or more digit or meta value characters enclosed by double quotes ("") and preceded by a base specifier.
The meta value characters are supported because of hardware description languages, that also have a concept of metalogical values.
.LP
.sp
\fCmeta_character ::=  \f[CB]-\fC | \f[CB]U\fC | \f[CB]W\fC | \f[CB]X\fC | \f[CB]Z\fR
.LP
The meta characters have following meaning:
.BL
\fR'-' - don't care,
.BL
\fR'U' - uninitialized, 
.BL
\fR'W' - weak unknown, 
.BL
\fR'X' - unkown,
.BL
\fR'Z' - high-impedance state.
.LP
.sp
\fCbinary_or_meta ::= binary_digit | meta_character
.sp
\fCoctal_or_meta ::= octal_digit | meta_character
.sp
\fChex_or_meta ::= hex_digit | meta_character\fR
.sp
There are three types of bit string literals: binary bit string literal, octal bit string literal and hex bit stirng literal.
.sp
\fCbit_string_literal ::=
.br
    binary_bit_string_literal |
.br
    octal_bit_string_literal |
.br
    hex_bit_string_literal\fR
.sp
\fCbinary_bit_string_base = \f[CB]B\fC | \f[CB]b\fC
.sp
\fCbinary_bit_string_literal = binary_bit_string_base \f[CB]"\fC{binary_or_meta}\f[CB]"\fC
.sp
\fCoctal_bit_string_base = \f[CB]O\fC | \f[CB]o\fC
.sp
\fCoctal_bit_string_literal = octal_bit_string_base \f[CB]"\fC{octal_or_meta}\f[CB]"\fC
.sp
\fChex_bit_string_base = \f[CB]X\fC | \f[CB]x\fC
.sp
\fChex_bit_string_literal = hex_bit_string_base \f[CB]"\fC{hex_or_meta}\f[CB]"\fC
.LP
If meta value is present in a bit string literal, then it is expanded to the proper width depending on the bit string base.
For example, following equations are true:
.QP
\fCo"XW"\fC = \fCb"XXXWWW"
.br
\fCx"U-"\fC = \fCb"UUUU----"
.
.NH 3
.XN Time literals
.LP
A time literal is a sequence of integer literal and a time unit.
.sp
\fCtime_unit ::= \f[CB]ns\fC | \f[CB]us\fC | \f[CB]ms\fC | \f[CB]s\fC
.sp
\fCtime_literal ::= integer_literal time_unit
.LP
Time literals are used to create values of time data type, required for example by the \fCdelay\fR property.
