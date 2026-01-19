#pagebreak()

= Lexical elements

FBDL has following types of lexical tokens:
- comment,
- identifier,
- indent,
- keyword,
- literal,
- newline.

== Comments

There is only a single type of comment, a _single-line comment_.
A single-line comment starts with the '\#' character and extends up to the end of the line.
A single-line comment can appear on any line of an FBDL file and may contain any character, including glyphs and special characters.
The presence or absence of comments has no influence on whether a description is legal or illegal.
Their sole purpose is to enlighten the human reader.

=== Documentation comments

Documentation comments are comments that appear immediately before constant definitions, type definitions, and functionality instantiations with no intervening newlines.
The following code shows examples of documentation comments:

#block(breakable:false)[
#pad(left: 1em)[
```fbd
# Number of receivers
const RECEIVERS_COUNT = 7
main bus
  # Data receivers
  receivers [RECEIVERS_COUNT]block
    # 0 disable receiver, 1 enable receiver
    enable config; width = 1
    # Number of frames in the buffer
    frame_count status
    # Documentation comments can consist of
    # multiple single-line comments.
    read_frame proc
      data [4]return; width = 8
```
]
]

== Identifiers

Identifiers are used as names.
An identifier shall start with a letter.

`uppercase_letter ::= `\
#h(1em)*`A`*` | `*`B`*` | `*`C`*` | `*`D`*` | `*`E`*` | `*`F`*` | `*`G`*` | `*`H`*` | `*`I`*` | `*`J`*` | `*`K`*` | `*`L`*` | `*`M`*` |` \
#h(1em)*`N`*` | `*`O`*` | `*`P`*` | `*`R`*` | `*`S`*` | `*`T`*` | `*`U`*` | `*`V`*` | `*`W`*` | `*`X`*` | `*`Y`*` | `*`Z`*

`lowercase_letter ::=` \
#h(1em)*`a`*` | `*`b`*` | `*`c`*` | `*`d`*` | `*`e`*` | `*`f`*` | `*`g`*` | `*`h`*` | `*`i`*` | `*`j`*` | `*`k`*` | `*`l`*` | `*`m`*` |` \
#h(1em)*`n`*` | `*`o`*` | `*`p`*` | `*`r`*` | `*`s`*` | `*`t`*` | `*`u`*` | `*`v`*` | `*`w`*` | `*`x`*` | `*`y`*` | `*`z`*

`letter ::= uppercase_letter | lowercase_letter`

`letter_or_digit ::= letter | decimal_digit`

`identifier ::= letter { underscore | letter_or_digit }`

#block(breakable:false)[

The following code contains some valid and invalid identifiers:

#pad(left: 1em)[
```fbd
const C_20 = 20 # Valid
const _C20 = 20 # Invalid
main bus
  cfg1 config # Valid
  1cfg config # Invalid
```
]
]

=== Declared identifier

Declared identifier is used for any occurrence of an identifier that already denotes some declared item.

`declared_identifier ::= letter { underscore | letter_or_digit }`

=== Qualified identifier

The qualified identifier is used to reference a symbol from foreign package.

`qualified_identifier ::= declared_identifier.declared_identifier`

The first declared identifier denotes the package, and the second one denotes the symbol from this package.

== Indent

The indentation has semantics meaning in the FBDL.
The indent sequence consists of two space characters (U+0020).
It is hard to express the indent and dedent using BNF.
Ident is the increase of the indentation level, and dedent is the decrease of the indentation level.
In the following code the indent happens in the lines number 2, 5 and 7, and the dedent happens in the line number 4.
What is more, double dedent happens at the EOF.
The number of indents always equals the number of dedents in the syntactically and semantically correct file.


#block(breakable:false)[
#pad(left: 1em)[
```fbd
1: type cfg_t config
2:   atomic = false
3:   width = 64
4: main bus
5:   c cfg_t
6:   blk block
7:     c cfg_t
8:     s status
```
]
]

Not only the indent alignment is important, but also its level.
In the following code the first type definition is correct, as the indent level for the definition body is increased by one.
The second type definition is incorrect, even though the indent within the definition body is aligned, as the indent level is increased by two.

#block(breakable:false)[
#pad(left: 1em)[
```fbd
# Valid indent
type cfg1_t config
  atomic = false
  width = 8
# Invalid indent, indent increased by two
type cfg2_t config
    atomic = false
    width = 8
```
]
]

== Keywords

FBDL has following keywords: *`atomic`*, *`block`*, *`bus`*, *`clear`*, *`config`*, *`const`*, *`false`*, *`import`*, *`init-value`*, *`irq`*, *`mask`*, *`param`*, *`proc`*, *`range`*, *`reset`*, *`read-value`*, *`reset-value`*, *`return`*, *`static`*, *`stream`*, *`true`*, *`type`*, *`in-trigger`*, *`out-trigger`*.

Keywords can be used as identifiers with one exception.
Keywords denoting built-in types (functionalities) cannot be used as identifiers for custom types.

== Literals

=== Bool literals

`bool_literal ::= `*`false`*` | `*`true`*

=== Number literals

`underscore ::= _`

`zero_digit ::= 0`

`non_zero_decimal_digit ::= `*`1`*` | `*`2`*` | `*`3`*` | `*`4`*` | `*`5`*` | `*`6`*` | `*`7`*` | `*`8`*` | `*`9`*

`decimal_digit ::= zero_digit | non_zero_decimal_digit`

`binary_base ::= `*`0B`*` | `*`0b`*

`binary_digit ::= `*`0`*` | `*`1`*

`octal_base ::= `*`0O`*` | `*`0o`*

`octal_digit ::= `*`0`*` | `*`1`*` | `*`2`*` | `*`3`*` | `*`4`*` | `*`5`*` | `*`6`*` | `*`7`*

`hex_base ::= `*`0X`*` | `*`0x`*

`hex_digit ::= `*`0`*` | `*`1`*` | `*`2`*` | `*`3`*` | `*`4`*` | `*`5`*` | `*`6`*` | `*`7`*` | `*`8`*` | `*`9`* \
`  | `*`A`*` | `*`a`*` | `*`B`*` | `*`b`*` | `*`C`*` | `*`c`*` | `*`D`*` | `*`d`*` | `*`E`*` | `*`e`*` | `*`F`*` | `*`f`*

=== Integer literals

`integer_literal ::= binary_literal | octal_literal | decimal_literal | hex_literal`

`binary_literal ::= binary_base binary_digit { [ underscore ] binary_digit }`

`octal_literal ::= octal_base octal_digit { [ underscore ] octal_digit }`

`decimal_literal ::= non_zero_decimal_digit { [ underscore ] decimal_digit }`

`hex_literal ::= hex_base hex_digit { [ underscore ] hex_digit }`

=== Real literals

The real literals shall be represented as described by IEEE Std 754, an IEEE standard for double-precision floating-point numbers.

Real numbers can be specified in either decimal notation (for example, 17.83) or in scientific notation (for example, 13e8, which indicates 13 multiplied by 10 to the eighth power).
Real numbers expressed with a decimal point shall have at least one digit on each side of the decimal point.

=== String literals
A string literal is a sequence of zero or more UTF-8 characters enclosed by double quotes ("").

`string_literal ::= "{UTF-8 character}"`

=== Bit string literals

A bit string literal is a sequence of zero or more digit or meta value characters enclosed by double quotes ("") and preceded by a base specifier.
The meta value characters are supported because of hardware description languages, that also have a concept of metalogical values.

`meta_character ::= `*`-`*` | `*`U`*` | `*`W`*` | `*`X`*` | `*`Z`*

The meta characters have following meaning:
- '-' - don't care,
- 'U' - uninitialized,
- 'W' - weak unknown,
- 'X' - unknown,
- 'Z' - high-impedance state.

`binary_or_meta ::= binary_digit | meta_character`

`octal_or_meta ::= octal_digit | meta_character`

`hex_or_meta ::= hex_digit | meta_character`

There are three types of bit string literals: binary bit string literal, octal bit string literal and hex bit stirng literal.

```
bit_string_literal ::=
  binary_bit_string_literal |
  octal_bit_string_literal |
  hex_bit_string_literal
```

`binary_bit_string_base = `*`B`*` | `*`b`*

`binary_bit_string_literal = binary_bit_string_base `*`"`*`{binary_or_meta}`*`"`*

`octal_bit_string_base = `*`O`*` | `*`o`*

`octal_bit_string_literal = octal_bit_string_base `*`"`*`{octal_or_meta}`*`"`*

`hex_bit_string_base = `*`X`*` | `*`x`*

`hex_bit_string_literal = hex_bit_string_base `*`"`*`{hex_or_meta}`*`"`*

If meta value is present in a bit string literal, then it is expanded to the proper width depending on the bit string base.
For example, following equations are true:

#block(breakable:false)[
#pad(left: 1em)[
```
o"XW" = b"XXXWWW"
x"U-" = b"UUUU----"
```
]
]

=== Time literals

A time literal is a sequence of integer literal and a time unit.

`time_unit ::= `*`ns`*` | `*`us`*` | `*`ms`*` | `*`s`*

`time_literal ::= integer_literal time_unit`

Time literals are used to create values of time data type, required for example by the `delay` property.
