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
