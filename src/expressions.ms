.bp
.NH 1
.XN Expressions
.LP
An expression is a formula that defines the computation of a value.
.LP
There are 4 types in FBDL: \f[I]bool, integer, real, string\f[].
Types are implicit and they are not declared.
Each property must have concrete type.
The type of the value evaluated from an expression must be checked before any assignment or comparison.
If there is a type mismatch that can be resolved with implicit rules, then it should be resolved.
In case of type mismatch that cannot be resolved, an error must be reported.
.LP
Conversion from integer to real in expressions is implicit.
Conversion from real to integer must be explicit, and must be done by calling any function returning integer type, for example \f[CW]ceil(), floor()\f[].
Conversion from integer to bool in expressions is implicit.
Bool cannot be converted to any type.
.
.NH 2
.XN Operators
.LP
.
.NH 2
.XN Functions
.LP
The FBDL does not allow defining custom functions for value computations.
However, FBDL has following built-in functions:
.IP "\f[CB]ceil\f[CW](x float) integer\f[]" 0.2i
Ceil returns the least integer value greater than or equal to x.
.IP "\f[CB]floor\f[CW](x float) integer\f[]"
Floor returns the greatest integer value less than or equal to x.
.IP "\f[CB]log2\f[CW](x float) integer|float\f[]"
Log2 returns the binary logarithm of x.
.IP "\f[CB]log10\f[CW](x float) integer|float\f[]"
Log10 returns the decimal logarithm of x.
