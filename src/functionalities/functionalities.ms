.bp
.NH
.XN Functionalities
.LP
Functionalities are the core part of the FBDL.
They define the capabilities of the provider.
Each functionality is distinct and in an unambiguous way defines the provider behavior and the interface that must be generated for the requester.
There are 11 functionalities:
.IP 1) 3
block,
.IP 2)
bus,
.IP 3)
config,
.IP 4)
mask,
.IP 5)
memory,
.IP 6)
param,
.IP 7)
proc,
.IP 8)
return,
.IP 9)
static,
.IP 10) 4
status,
.IP 11)
stream.
.
.NH 2
.XN Properties
.LP
Each functionality has associated properties.
Properties allow configuration of functionalities.
Each property must have concrete type.
The default value of each property is specified in the round brackets () in the functionality subsections.
If the default value is \fCbus width\fR, then it means that the default value equals the actual value of the bus \fCwidth\fR property.
If the default value is \fCundefined\fR, then it shall be represented as the undefined meta value at the provider side.
If the target language for the provider code does not have a concept of undefined value, then values such as 0, \fCNull\fR, \fCNone\fR, \fCnil\fR etc. shall be used.
.LP
\fCproperty_assignment ::= declared_identifier \f[CB]=\fC expression
.LP
\fCproperty_assignments ::=
.br
	property_assignment
.br
	{ \f[CB];\fC property_assignment }
.br
	newline
.LP
\fCsemicolon_and_property_assignments ::= \f[CB];\fC property_assignments
.
.NH 2
.XN Instantiation
.LP
.LP
A functionality can be instantiated in a single line or in multiple lines.
.LP
\fCinstantiation ::= single_line_instantiation | multi_line_instantiation
.LP
\fCsingle_line_instantiation ::=
.br
	identifier
.br
	[ array_marker ]
.br
	declared_identifier | qualified_identifier
.br
	[ argument_list ]
.br
	newline | semicolon_and_property_assignments\fR
.LP
Following code shows examples of single line instantiations:
.QP
\fCC \f[CB]config
.br
\fCC \f[CB]config\fC; \f[CB]width\fC = 8
.br
\fCM [8]\f[CB]mask\fC; \f[CB]atomic\fC = false; \f[CB]width\fC = 128; \f[CB]init-value\fC = 0
.br
\fCerr error_t(48)\fC; \f[CB]atomic\fC = false
