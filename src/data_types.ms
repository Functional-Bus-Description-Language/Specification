.bp
.NH
.XN Data types
.LP
There are 4 data types in FBDL:
.BL
bool,
.BL
integer,
.BL
real,
.BL
string.
.LP
Types are implicit and are not declared.
The type of the value evaluated from an expression must be checked before any assignment or comparison.
If there is a type mismatch that can be resolved with implicit rules, then it should be resolved.
In case of type mismatch that cannot be resolved, an error must be reported.
.LP
Conversion from integer to real in expressions is implicit.
Conversion from real to integer must be explicit, and must be done by calling any function returning integer type, for example \f[CW]ceil(), floor()\f[].
Conversion from integer to bool in expressions is implicit.
Bool cannot be converted to any type.
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
