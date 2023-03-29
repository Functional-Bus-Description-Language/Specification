.NH 2
.XN Properties
.LP
Each data in the FBDL description has associated functionality and each functionality has associated properties.
Properties allow configuration of functionalities.
Each property must have concrete type.
The default value of each property is specified in the round brackets () in the functionality subsections.
If the default value is \fCbus width\fR, then it means that the default value equals the actual value of the bus \fCwidth\fR property.
If the default value is \fCuninitialized\fR, then it shall be represented as the uninitialized meta value at the provider side.
If the target language for the provider code does not have a concept of uninitialized value, then values such as 0, \fCNull\fR, \fCNone\fR, \fCnil\fR etc. shall be used.
.LP
\fCproperty_assignment ::= property_identifier \f[CB]=\fC expression
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
.LP
\fCproperty_identifier ::= \f[CB]atomic\fC | \f[CB]delay\fC | \f[CB]groups\fC | \f[CB]masters\fC | \f[CB]range\fC |
.br
    \f[CB]width\fC | \f[CB]init-value\fC | \f[CB]read-value \fC | \f[CB]reset-value
