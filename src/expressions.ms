.bp
.NH 1
.XN Expressions
.LP
An expression is a formula that defines the computation of a value.
.
.NH 2
.XN Operators
.LP
.TS
tab(;) center;
c s s
c | c | c .
FBDL operators
_
Operator token;Name;Name
_
+;foo;bar
*;foo;bar
.TE
.
.NH 2
.XN Functions
.LP
The FBDL does not allow defining custom functions for value computations.
However, FBDL has following built-in functions:
.IP "\f[CB]bool\f[CW](x integer) bool\f[]" 0.2i
Bool returns a value of the bool type converted from a value x of the integer type.
If x equals 0, then the \fCfalse\fR is returned.
In all other cases the \fCtrue\fR is returned.
.IP "\f[CB]ceil\f[CW](x float) integer\f[]"
Ceil returns the least integer value greater than or equal to x.
.IP "\f[CB]floor\f[CW](x float) integer\f[]"
Floor returns the greatest integer value less than or equal to x.
.IP "\f[CB]log2\f[CW](x float) integer|float\f[]"
Log2 returns the binary logarithm of x.
.IP "\f[CB]log10\f[CW](x float) integer|float\f[]"
Log10 returns the decimal logarithm of x.
