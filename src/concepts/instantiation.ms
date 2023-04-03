.NH 2
.XN Instantiation
.LP
.LP
A functionality can be instantiated in a single line or in multiple lines.
.
.
.sp
\fCinstantiation ::= single_line_instantiation | multi_line_instantiation
.
.
.sp
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
.
.
.sp
\fCmulti_line_instantiation ::=
.br
	identifier
.br
	[ array_marker ]
.br
	declared_identifier | qualified_identifier
.br
	[ argument_list ]
.br
	functionality_body\fR
.
.
.sp
\fCfunctionality_body ::=
.br
	newline
.br
	indent
.br
	{
.br
		constant_definition |
.br
		type_definition |
.br
		property_assignments |
.br
		instantiation
.br
	}
.br
	dedent
.
.
.LP
Following code shows examples of single line instantiations:
.
.
.QP
\fCC \f[CB]config
.br
\fCC \f[CB]config\fC; \f[CB]width\fC = 8
.br
\fCM [8]\f[CB]mask\fC; \f[CB]atomic\fC = false; \f[CB]width\fC = 128; \f[CB]init-value\fC = 0
.br
\fCerr error_t(48)\fC; \f[CB]atomic\fC = false
