#pagebreak()

= Data types

There are 7 data types in FBDL:
- bit string,
- bool,
- integer,
- range,
- real,
- string,
- time.

Types are implicit and are not declared.
The type of the value evaluated from an expression must be checked before any assignment or comparison.
If there is a type mismatch that can be resolved with implicit rules, then it shall be resolved.
In case of a type mismatch that cannot be resolved, an error must be reported by the compiler.

Conversion from bool to integer in expressions is implicit.
Conversion from integer to real in expressions is implicit.
Conversion from integer to range can be implicit if the interger value is natural.
Conversion from real to integer can be implicit if there is no fractional part.
If fractional part is present, then conversion from real to integer must be explicit and must be done by calling any function returning integer type, for example `ceil()`, `floor()`.

The below picture presents a graph of possible implicit conversions between different data types.

#set align(center)
#image("images/data-types-conversion.svg", width: 80%)
#set align(left)

== Bit string

The value of the bit string type is used for all *`*-value`* properties.
It might be created explicitly using the bit string literal or it might be converted implicitly from the value of integer type.
The only way to create a bit string value containing meta values is to explicitly use the bit string literal.


#block(breakable:false)[

The below table presents unary negation operation results applied to possible bit string data type values.

#set align(center)
#table(
  stroke: none,
  align: center,
  columns: (3cm, 3cm),
  table.vline(x: 1, start: 1),
  table.cell(colspan: 2)[Bit string unary bitwise negation],
  table.hline(),
  [*In Value*], [*Out Value*],
  table.hline(),
  [`0`], [`1`],
  table.hline(stroke: (thickness: 0.1pt)),
  [`1`], [`0`],
  table.hline(stroke: (thickness: 0.1pt)),
  [`-`], [`-`],
  table.hline(stroke: (thickness: 0.1pt)),
  [`U`], [`U`],
  table.hline(stroke: (thickness: 0.1pt)),
  [`W`], [`W`],
  table.hline(stroke: (thickness: 0.1pt)),
  [`X`], [`X`],
)
]
#set align(left)

Below tables present binary operation results applied to possible bit string data type values.

#set align(center)
#block(breakable:false)[
#table(
  stroke: none,
  align: center,
  columns: (2cm, 1cm, 1cm, 1cm, 1cm, 1cm, 1cm, 1cm),
  table.vline(x: 1, start: 1),
  table.vline(x: 2, start: 1, stroke: (thickness: 0.1pt)),
  table.vline(x: 3, start: 1, stroke: (thickness: 0.1pt)),
  table.vline(x: 4, start: 1, stroke: (thickness: 0.1pt)),
  table.vline(x: 5, start: 1, stroke: (thickness: 0.1pt)),
  table.vline(x: 6, start: 1, stroke: (thickness: 0.1pt)),
  table.vline(x: 7, start: 1, stroke: (thickness: 0.1pt)),
  table.cell(colspan: 8)[Bit string binary bitwise and (&) resolution],
  table.hline(),
  [*Operands*], [`0`], [`1`], [`-`], [`U`], [`W`], [`X`], [`Z`],
  table.hline(),
  [`0`],        [`0`], [`0`], [`0`], [`U`], [`0`], [`X`], [`0`],
  table.hline(stroke: (thickness: 0.1pt)),
  [`1`],        [`0`], [`1`], [`1`], [`U`], [`1`], [`X`], [`1`],
  table.hline(stroke: (thickness: 0.1pt)),
  [`-`],        [`0`], [`1`], [`-`], [`U`], [`W`], [`X`], [`Z`],
  table.hline(stroke: (thickness: 0.1pt)),
  [`U`],        [`U`], [`U`], [`U`], [`U`], [`U`], [`U`], [`U`],
  table.hline(stroke: (thickness: 0.1pt)),
  [`W`],        [`0`], [`1`], [`X`], [`U`], [`W`], [`X`], [`W`],
  table.hline(stroke: (thickness: 0.1pt)),
  [`X`],        [`X`], [`X`], [`X`], [`U`], [`X`], [`X`], [`X`],
  table.hline(stroke: (thickness: 0.1pt)),
  [`Z`],        [`0`], [`1`], [`X`], [`U`], [`W`], [`X`], [`Z`],
)
]

#block(breakable:false)[
#table(
  stroke: none,
  align: center,
  columns: (2cm, 1cm, 1cm, 1cm, 1cm, 1cm, 1cm, 1cm),
  table.vline(x: 1, start: 1),
  table.vline(x: 2, start: 1, stroke: (thickness: 0.1pt)),
  table.vline(x: 3, start: 1, stroke: (thickness: 0.1pt)),
  table.vline(x: 4, start: 1, stroke: (thickness: 0.1pt)),
  table.vline(x: 5, start: 1, stroke: (thickness: 0.1pt)),
  table.vline(x: 6, start: 1, stroke: (thickness: 0.1pt)),
  table.vline(x: 7, start: 1, stroke: (thickness: 0.1pt)),
  table.cell(colspan: 8)[Bit string binary bitwise or (|) resolution],
  table.hline(),
  [*Operands*], [`0`], [`1`], [`-`], [`U`], [`W`], [`X`], [`Z`],
  table.hline(),
  [`0`],        [`0`], [`1`], [`0`], [`U`], [`0`], [`X`], [`0`],
  table.hline(stroke: (thickness: 0.1pt)),
  [`1`],        [`1`], [`1`], [`1`], [`U`], [`1`], [`X`], [`1`],
  table.hline(stroke: (thickness: 0.1pt)),
  [`-`],        [`0`], [`1`], [`-`], [`U`], [`W`], [`X`], [`Z`],
  table.hline(stroke: (thickness: 0.1pt)),
  [`U`],        [`U`], [`U`], [`U`], [`U`], [`U`], [`U`], [`U`],
  table.hline(stroke: (thickness: 0.1pt)),
  [`W`],        [`0`], [`1`], [`X`], [`U`], [`W`], [`X`], [`W`],
  table.hline(stroke: (thickness: 0.1pt)),
  [`X`],        [`X`], [`X`], [`X`], [`U`], [`X`], [`X`], [`X`],
  table.hline(stroke: (thickness: 0.1pt)),
  [`Z`],        [`0`], [`1`], [`X`], [`U`], [`W`], [`X`], [`Z`],
)
]

#block(breakable:false)[
#table(
  stroke: none,
  align: center,
  columns: (2cm, 1cm, 1cm, 1cm, 1cm, 1cm, 1cm, 1cm),
  table.vline(x: 1, start: 1),
  table.vline(x: 2, start: 1, stroke: (thickness: 0.1pt)),
  table.vline(x: 3, start: 1, stroke: (thickness: 0.1pt)),
  table.vline(x: 4, start: 1, stroke: (thickness: 0.1pt)),
  table.vline(x: 5, start: 1, stroke: (thickness: 0.1pt)),
  table.vline(x: 6, start: 1, stroke: (thickness: 0.1pt)),
  table.vline(x: 7, start: 1, stroke: (thickness: 0.1pt)),
  table.cell(colspan: 8)[Bit string binary bitwise xor (^) resolution],
  table.hline(),
  [*Operands*], [`0`], [`1`], [`-`], [`U`], [`W`], [`X`], [`Z`],
  table.hline(),
  [`0`],        [`0`], [`1`], [`0`], [`U`], [`0`], [`X`], [`0`],
  table.hline(stroke: (thickness: 0.1pt)),
  [`1`],        [`1`], [`0`], [`1`], [`U`], [`1`], [`X`], [`1`],
  table.hline(stroke: (thickness: 0.1pt)),
  [`-`],        [`0`], [`1`], [`-`], [`U`], [`W`], [`X`], [`Z`],
  table.hline(stroke: (thickness: 0.1pt)),
  [`U`],        [`U`], [`U`], [`U`], [`U`], [`U`], [`U`], [`U`],
  table.hline(stroke: (thickness: 0.1pt)),
  [`W`],        [`0`], [`1`], [`X`], [`U`], [`W`], [`X`], [`W`],
  table.hline(stroke: (thickness: 0.1pt)),
  [`X`],        [`X`], [`X`], [`X`], [`U`], [`X`], [`X`], [`X`],
  table.hline(stroke: (thickness: 0.1pt)),
  [`Z`],        [`0`], [`1`], [`X`], [`U`], [`W`], [`X`], [`Z`],
)
]

#set align(left)

== Bool

The value of the bool type can be created explicitly using `true` or `false` literals.
The value of the bool type shall be implicitly converted to the value of the integer type in places where the value of the integer type is required.
The boolean `false` value shall be converted to the integer value 0.
The boolean `true` value shall be converted to the integer value 1.
In the following example, the value of `I1` evaluates to 1, and the value of `I2` evaluates to 2.


#block(breakable:false)[
#pad(left: 1em)[
```fbd
const B0 = false
const B1 = true
const I1 = B0 + B1
const I2 = B1 + B1
```
]
]

The bool - integer conversion is asymmetric.
Implicit conversion of a value of the integer type to a value of the bool type is forbidden.
This is becuase values of the bool type are often used to count the number of elements or to arbitrarily enable/disable an element generation.
However, a value of the integer type appearing in a place where a value of the bool type is required is usually a sign of a mistake.
To convert a value of the integer type to a value of the bool type the built-in  `bool()` function must be called.

== Integer

The integer data type is always signed integer and must be at least 64 bits wide.

== Range

The range data type is used to assign value to the `range` property.
It consists of left and right bounds, both expressed as expressions, separated by the colon character.
The range data type can be created solely using the range expression.
There is no range literal.

`range_expression ::= expression `*`:`*` expression`

== Real

The real data type is 64 bits IEEE 754 double precision floating-point type.

== String

The string data type can only be created explicitly using a string literal.
The string data type is only used for setting values of some properties, for example `access`.

== Time

The time data type is only used for assigning value to the properties expressed in time.
The value of time type can be created explicitly using the time literal.
Values of time type can be added regardless of their time units.
Values of the time type can also be multiplied by values of the integer type.
All of the below property assignments are valid.

#block(breakable:false)[
#pad(left: 1em)[
```fbd
delay = 1 s + 1 ms + 1 us + 1 ns
delay = 5 * 60 s # Sleep for 5 minutes.
delay = 10 ms * 4 + 7 * 8 us
```
]
]
