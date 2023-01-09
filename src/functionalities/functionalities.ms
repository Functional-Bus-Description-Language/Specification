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
.LP
Each functionality has associated properties.
Properties allow configuration of functionalities.
Each property must have concrete type.
The default value of each property is specified in the round brackets () in the functionality subsections.
If the default value is \fCbus width\fR, then it means that the default value equals the actual value of the bus \fCwidth\fR property.
If the default value is \fCundefined\fR, then ...
If the target language for the provider code does not have a concept of undefined value, then values such as 0, \fCNull\fR, \fCNone\fR, \fCnil\fR etc. shall be used.
.LP
A functionality can be instantiated in a single line or in multiple lines.
.LP
\fCsingle_line_instantiation ::=
.br
	identifier
.br
	[array_marker]
.br
	declared_identifier | qualified_identifier
.br
	[argument_list]
.br
	[\f[CB];\fC multi_property_assignment]
.br
	newline\fR
.LP
Following code shows examples of single line instantiations:
.QP
\fCC \f[CB]config
.br
\fCC \f[CB]config\fC; \f[CB]width\fC = 8
.br
\fCM [8]\f[CB]mask\fC; \f[CB]atomic\fC = false; \f[CB]width\fC = 128; \f[CB]default\fC = 0
.br
\fCerr error_t(48)\fC; \f[CB]atomic\fC = false
