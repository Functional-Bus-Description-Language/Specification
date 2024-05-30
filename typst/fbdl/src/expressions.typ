#pagebreak()

= Expressions

An expression is a formula that defines the computation of a value by applying operators and functions to operands.

```
expression ::=
    bool_literal |
    integer_literal |
    real_literal |
    string_literal |
    bit_string_literal |
    time_literal |
    declared_identifier |
    qualified_identifier |
    unary_operation |
    binary_operation |
    function_call |
    subscript |
    parenthesized_expression |
    range_expression |
    expression_list
```

The function call is used to call one of built-in functions.

`function_call ::=` \
`    declared_identifier`*`(`*` [ expression { `*`,`*` expression } ] `*`)`*

The subscript is used to refer to a particular element from the expression list.

`subscript ::= declared_identifier`*`[`*` expression `*`]`*

The parenthesized expression may be used to explicitly set order of operations.

`parenthesized_expression ::= `*`(`*` expression `*`)`*

The expression list may be used to create a list of expressions.

`expression_list ::= `*`[`*` [ expression { `*`,`*` expression } ] `*`]`*

== Operators

=== Unary Operators

`unary_operation ::= unary_operator expression`

`unary_operator ::= unary_arithmetic_operator | unary_bitwise_operator`

`unary_arithmetic_operator ::= `*`-`*

`unary_bitwise_operator ::= `*`!`*

#set align(center)
#block(breakable:false)[
#table(
  stroke: none,
  align: center,
  columns: (2cm, 3cm, 3cm, 3cm),
  table.vline(x: 1, start: 1),
  table.vline(x: 2, start: 1),
  table.vline(x: 3, start: 1),
  table.cell(colspan: 4)[FBDL unary operators],
  table.hline(),
  [*Token*], [*Operation*], [*Operand Type*], [*Result Type*],
  table.hline(),
  [`-`], [Opposite], [Integer \ Real], [Integer \ Real],
  table.hline(),
  [`!`], [Negation], [Bit string \ Integer], [Bit string \ Integer],
)
]
#set align(left)

=== Binary Operators

`binary_operation ::= expression binary_operator expression`

```
binary_operator ::=
    binary_arithmetic_operator |
    binary_bitwise_operator |
    binary_comparison_operator |
    binary_logical_operator |
    binary_range_operator
```

`binary_arithmetic_operator ::= `*`+`*` | `*`-`*` | `*`*`*` | `*`/`*` | `*`%`*` | `*`**`*

`binary_bitwise_operator ::= `*`<<`*` | `*`>>`*

`binary_comparison_operator ::= `*`==`*` | `*`!=`*` | `*`<`*` | `*`<=`*` | `*`>`*` | `*`>=`*

`binary_logical_operator ::= `*`&&`*` | `*`||`*

`binary_range_operator ::= `*`:`*

#set align(center)

#block(breakable:false)[
#table(
  stroke: none,
  align: center,
  columns: (1.5cm, 3cm, 4cm, 4cm, 2.5cm),
  table.vline(x: 1, start: 1),
  table.vline(x: 2, start: 1),
  table.vline(x: 3, start: 1),
  table.vline(x: 4, start: 1),
  table.cell(colspan: 5)[FBDL binary arithmetic operators],
  table.hline(),
  [*Token*], [*Operation*], [*Left Operand Type*], [*Right Operand Type*], [*Result Type*],
  table.hline(),
  [\ \ `+`], [\ \ Addition], [Integer \ Integer \ Real \ Real \ Time], [Integer \ Real \ Integer \ Real \ Time], [Integer \ Real \ Real \ Real \ Time],
  table.hline(),
  [\ `-`], [\ Subtraction], [Integer \ Integer \ Real \ Real], [Integer \ Real \ Integer \ Real], [Integer \ Real \ Real \ Real],
  table.hline(),
  [\ \ `*`], [\ \ Multiplication], [Integer \ Integer \ Real \ Real \ Integer \ Time], [Integer \ Real \ Integer \ Real \ Time \ Integer], [Integer \ Real \ Real \ Real \ Time \ Time],
  table.hline(),
  [\ `-`], [\ Division], [Integer \ Integer \ Real \ Real], [Integer \ Real \ Integer \ Real], [Real \ Real \ Real \ Real],
  table.hline(),
  [`%`], [Remainder], [Integer], [Integer], [Integer],
  table.hline(),
  [\ `**`], [\ Exponentiation], [Integer \ Integer \ Real \ Real], [Integer \ Real \ Integer \ Real], [Integer \ Real \ Real \ Real],
)
]

#block(breakable:false)[
#table(
  stroke: none,
  align: center,
  columns: (1.5cm, 3cm, 4cm, 4cm, 2.5cm),
  table.vline(x: 1, start: 1),
  table.vline(x: 2, start: 1),
  table.vline(x: 3, start: 1),
  table.vline(x: 4, start: 1),
  table.cell(colspan: 5)[FBDL binary bitwise operators],
  table.hline(),
  [*Token*], [*Operation*], [*Left Operand Type*], [*Right Operand Type*], [*Result Type*],
  table.hline(),
  [`<<`], [Left Shift], [Integer], [Integer], [Integer],
  table.hline(),
  [`>>`], [Right Shift], [Integer], [Integer], [Integer],
  table.hline(),
  [`&`], [And], [Bit String \ Integer], [Bit String \ Integer], [Bit String \ Integer],
  table.hline(),
  [`|`], [Or], [Bit String \ Integer], [Bit String \ Integer], [Bit String \ Integer],
  table.hline(),
  [`^`], [Xor], [Bit String \ Integer], [Bit String \ Integer], [Bit String \ Integer],
)
]

#block(breakable:false)[
#table(
  stroke: none,
  align: center,
  columns: (1.5cm, 3cm, 4cm, 4cm, 2.5cm),
  table.vline(x: 1, start: 1),
  table.vline(x: 2, start: 1),
  table.vline(x: 3, start: 1),
  table.vline(x: 4, start: 1),
  table.cell(colspan: 5)[FBDL binary comparison operators],
  table.hline(),
  [*Token*], [*Operation*], [*Left Operand Type*], [*Right Operand Type*], [*Result Type*],
  table.hline(),
  [\ `==`], [\ Equality], [Integer \ Integer \ Real \ Real], [Integer \ Real \ Integer \ Real], [Bool \ Bool \ Bool \ Bool],
  table.hline(),
  [\ `!=`], [\ Nonequality], [Integer \ Integer \ Real \ Real], [Integer \ Real \ Integer \ Real], [Bool \ Bool \ Bool \ Bool],
  table.hline(),
  [\ `<`], [\ Less Than], [Integer \ Integer \ Real \ Real], [Integer \ Real \ Integer \ Real], [Bool \ Bool \ Bool \ Bool],
  table.hline(),
  [\ `<=`], [\ Less Than \ or Equal], [Integer \ Integer \ Real \ Real], [Integer \ Real \ Integer \ Real], [Bool \ Bool \ Bool \ Bool],
  table.hline(),
  [\ `>`], [\ Greater Than], [Integer \ Integer \ Real \ Real], [Integer \ Real \ Integer \ Real], [Bool \ Bool \ Bool \ Bool],
  table.hline(),
  [\ `>=`], [\ Greater Than \ or Equal], [Integer \ Integer \ Real \ Real], [Integer \ Real \ Integer \ Real], [Bool \ Bool \ Bool \ Bool],
)
]

#block(breakable:false)[
#table(
  stroke: none,
  align: center,
  columns: (1.5cm, 3cm, 4cm, 4cm, 2.5cm),
  table.vline(x: 1, start: 1),
  table.vline(x: 2, start: 1),
  table.vline(x: 3, start: 1),
  table.vline(x: 4, start: 1),
  table.cell(colspan: 5)[FBDL binary logical operators],
  table.hline(),
  [*Token*], [*Operation*], [*Left Operand Type*], [*Right Operand Type*], [*Result Type*],
  table.hline(),
  [`&&`], [Short-circuiting \ logical AND], [Bool], [Bool], [Bool],
  table.hline(),
  [`||`], [Short-circuiting \ logical OR], [Bool], [Bool], [Bool],
)
]

#block(breakable:false)[
#table(
  stroke: none,
  align: center,
  columns: (1.5cm, 3cm, 4cm, 4cm, 2.5cm),
  table.vline(x: 1, start: 1),
  table.vline(x: 2, start: 1),
  table.vline(x: 3, start: 1),
  table.vline(x: 4, start: 1),
  table.cell(colspan: 5)[FBDL binary range operator],
  table.hline(),
  [*Token*], [*Operation*], [*Left Operand Type*], [*Right Operand Type*], [*Result Type*],
  table.hline(),
  [`:`], [Range], [Integer], [Integer], [Range],
)
]

#set align(left)

The bool data type is not valid operand type for the most of the binary operations.
However, as there is the rule for implicit conversion from the bool data type to the integer data type, all operations accepting the integer operands work also for the bool operands.

== Functions

The FBDL does not allow defining custom functions for value computations. However, FBDL has following built-in
functions:

*`abs`*`(x integer|real) integer|real` \
The `abs` function returns the absolute value of `x`.

*`bool`*`(x integer) bool` \
The `bool` function returns a value of the bool type converted from a value `x` of the integer type. If `x` equals 0, then the `false` is returned. In all other cases the `true` is returned.

*`ceil`*`(x real) integer` \
The `ceil` function returns the least integer value greater than or equal to `x`.

*`floor`*`(x real) integer` \
The `floor` function returns the greatest integer value less than or equal to `x`.

*`log2`*`(x real) integer|real` \
The `log2` function returns the binary logarithm of `x`.

*`log10`*`(x real) integer|real` \
The `log10` function returns the decimal logarithm of `x`.

*`log`*`(x, b real) integer|real` \
The `log` function returns the logarithm of `x` to the base `b`.

*`u2`*`(x, w integer) integer` \
The `u2` function returns two’s complement representation of `x` as an integer assuming width `w`.
For example, `u2(-1, 8)` returns `255`.
