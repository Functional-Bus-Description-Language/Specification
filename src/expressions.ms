.bp
.NH 2
.XN Expressions
.LP
An expression is a formula that denes the computation of a value.

There are 4 types in FBDL: \f[I]bool, integer, real, string\f[].
Types are implicit and they are not declared.
Each property must have concrete type.
The type of the value evaluated from an expression must be checked before any assignment or comparison.
If there is a type mismatch that can be resolved with implicit rules, then it should be resolved.
In case of type mismatch that cannot be resolved, an error must be reported.

Conversion from integer to real in expressions is implicit.
Conversion from real to integer must be explicit, and must be done by calling any function returning integer type, for example \f[CW]ceil(), floor()\f[].
Conversion from integer to bool in expressions is implicit.
Bool cannot be converted to any type.

The string type is used solely for documentation purposes and cannot be used in expressions.