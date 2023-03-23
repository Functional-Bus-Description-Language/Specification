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
