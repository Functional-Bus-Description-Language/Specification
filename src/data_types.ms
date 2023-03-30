.bp
.NH
.XN Data types
.LP
There are 6 data types in FBDL:
.BL
bit string,
.BL
bool,
.BL
integer,
.BL
real,
.BL
string,
.BL
time.
.LP
Types are implicit and are not declared.
The type of the value evaluated from an expression must be checked before any assignment or comparison.
If there is a type mismatch that can be resolved with implicit rules, then it shall be resolved.
In case of type mismatch that cannot be resolved, an error must be reported by the compiler.
.LP
Conversion from integer to real in expressions is implicit.
Conversion from real to integer must be explicit, and must be done by calling any function returning integer type, for example \f[CW]ceil(), floor()\f[].
Conversion from integer to bool in expressions is implicit.
Bool cannot be converted to any type.
.LP
Below picture presents a graph of possible implicit conversions between different data types.
.PS
copy "pic/grid"

scale = 2.54

r = 0.7

BOOL:  circle  "Bool"          rad r  at (xm65, y0)
BS:    circle  "Bit" "string"  rad r  at (x0, y40)
INT:   circle  "Integer"       rad r  at (x0, y0)
REAL:  circle  "Real"          rad r  at (x60, y0)

arrow from BOOL.e  to INT.w

arc -> rad 5  from BS.sw    to INT.nw
arc -> rad 5  from INT.ne   to BS.se

arc -> rad 9  from REAL.nw  to INT.ne
arc -> rad 9  from INT.se   to REAL.sw

"Always (false -> 0, true -> 1)" at (xm34, y3)
"Only if no" "meta values" at (xm18, y22)
"Always" at (x30, ym12)
"Always" at (x15, y25)
"Only if no fractional part" at (x32, y11)
.PE
.NH 2
.XN Bit string
.LP
The value of bit string type is used for all \f[CB]*-value\fR properties.
It might be created explicitly using the bit string literal or it might be converted implicitly from the value of integer type.
The only way to create bit string value containing meta values is to explicitly use the bit string literal.
.NH 2
.XN Bool
.LP
The value of bool type can be created explicitly using \fCtrue\fR or \fCfalse\fR literals.
The value of bool type shall be implicitly converted to the value of integer type in places where the value of integer type is required.
The boolean \fCfalse\fR value shall be converted to integer value 0.
The boolean \fCtrue\fR value shall be converted to integer value 1.
In the following example, the value of \fCI1\fR evaluates to 1, and the value of I2 evaluates to 2.
.QP
\fC\f[CB]const\f[] B0 = \f[CB]false\f[]
.br
\f[CB]const\f[] B1 = \f[CB]true\f[]
.br
\f[CB]const\f[] I1 = B0 + B1
.br
\f[CB]const\f[] I2 = B1 + B1
\fR
.LP
The bool - integer conversion is asymmetric.
Implicit conversion of a value of the integer type to a value of the bool type is forbidden.
This is becuase values of the bool type are often used to count the number of elements or to arbitrarily enable/disable an element generation.
However, a value of the integer type appearing in a place where a value of the bool type is required is usually a sign of a mistake.
To convert a value of the integer type to a value of the bool type the built-in  \f[CB]bool\f[]\fC()\fR function must be called.
.NH 2
.XN Integer
.LP
The integer data type is always signed integer and must be at least 64 bits wide.
.NH 2
.XN Real
.LP
The real data type is 64 bits IEEE 754 double precision floating-point type.
.NH 2
.XN String
.LP
The string data type can only be created explicitly using a string literal.
The string data type is only used for setting values of some properties, for example \fCgroups\fR.
.NH 2
.XN Time
.LP
The value of time type can be created explicitly using the time literal.
.LP
.br
\f[CW]time_unit ::= \fBns\fR | \fBus\fR | \fBms\fR | \fBs\fR
.br
\f[CW]time_literal ::= integer_literal time_unit
.LP
The time type is only used for assigning value to the properties expressed in time.
Values of time type can be added regardless of their time units.
Values of the time type can also be multiplied by values of the integer type.
All of below property assignments are valid.
.QP
\fC\f[CB]delay\f[] = 1 \f[CB]s\f[] + 1 \f[CB]ms\f[] + 1 \f[CB]us\f[] + 1 \f[CB]ns\f[]
.br
\fC\f[CB]delay\f[] = 5 * 60 \f[CB]s\f[] \f[CI]# Sleep for 5 minutes.\fC
.br
\fC\f[CB]delay\f[] = 10 \f[CB]ms\f[] * 4 + 7 * 8 \f[CB]us\f[]
