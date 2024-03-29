.NH 2
.XN Properties
.LP
Each data in the FBDL description has associated functionality and each functionality has associated properties.
Properties allow the configuration of functionalities.
Each property must have a concrete type.
The default value of each property is specified in the round brackets () in the functionality subsections.
If the default value is \fCbus width\fR, then the default value equals the actual value of the bus \fCwidth\fR property.
If the default value is \fCuninitialized\fR, then it shall be represented as the uninitialized meta value at the provider side.
If the target language for the provider code does not have a concept of uninitialized value, then values such as 0, \fCNull\fR, \fCNone\fR, \fCnil\fR etc. shall be used.
.LP
Each property either defines or declares functionality feature or behavior.
Definitive properties specify the desired behavior of the automatically generated code.
They specify elements directly managed by the FBDL.
Examples of definitive properties include \fCatomic\fR or \fCwidth\fR properties.
Declarative properties describe the behavior of external elements that automatically generated code only interacts with.
Declarative properties are required to generate valid logic, and it is the user's responsibility to make sure their values match the behavior of external components.
Examples of declarative properties include \fCaccess\fR or \fCin-trigger\fR properties.
.
.
.sp
\fCproperty_assignment ::= property_identifier \f[CB]=\fC expression
.
.
.sp
\fCproperty_assignments ::=
.br
	property_assignment
.br
	{ \f[CB];\fC property_assignment }
.br
	newline
.
.
.sp
\fCsemicolon_and_property_assignments ::= \f[CB];\fC property_assignments
.
.
.sp
\fCproperty_identifier ::=
.br
	
\f[CB]access\fC |
\f[CB]add-enable\fC |
\f[CB]atomic\fC |
\f[CB]byte-write-enable\fC |
\f[CB]clear\fC |
\f[CB]delay\fC |
.br
	
\f[CB]enable-init-value\fC |
\f[CB]enable-reset-value\fC |
\f[CB]groups\fC |
\f[CB]init-value\fC |
.br
	
\f[CB]in-trigger\fC |
\f[CB]masters\fC |
\f[CB]out-trigger\fC |
\f[CB]range\fC |
\f[CB]read-latency\fC |
.br
	
\f[CB]read-value\fC |
\f[CB]reset\fC |
\f[CB]reset-value\fC |
\f[CB]size\fC |
\f[CB]width\fC
