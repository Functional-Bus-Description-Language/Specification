.NH 2
.XN Type definition
.LP
The type definition allows for defining custom functionalities.
Any custom functionality resolves to one of the built-in functionalities.
However, by defining custom functionality types it is possible to preset property values or to create easily parametrizable functionalities.
The former leads to shorter descriptions and helps to avoid duplication.
.
.
.sp
\fCtype_definition ::=
.br
	single_line_type_definition |
.br
	multi_line_type_definition\fR
.
.
.sp
\fCsingle_line_type_definition ::=
.br
	\f[CB]type\fC
.br
	identifier
.br
	[ parameter_list ]
.br
	declared_identifier | qualified identifier
.br
	[ argument_list ]
.br
	semicolon_and_property_assignments | newline
.
.
.sp
\fCmulti_line_type_definition ::=
.br
	\f[CB]type\fC
.br
	identifier
.br
	[ parameter_list ]
.br
	declared_identifier | qualified identifier
.br
	[ argument_list ]
.br
	functionality_body
.
.
.sp
\fCparameter_list ::= \f[CB](\fC parameters \f[CB])\fC
.
.
.sp
\fCparameters ::= parameter { \f[CB],\fC parameter }
.
.
.sp
\fCparameter ::= identifier [ \f[CB]=\fC expression ]
.
.
.LP
Parameters in the parameter list might have default values, but parameters with the default values must prepend parameters without default values in the parameter list.
.
.
.sp
\fCargument_list ::= \f[CB](\fC\ arguments \f[CB])\fC
.
.
.sp
\fCarguments ::= argument { \f[CB],\fC argument  }
.
.
.sp
\fCargument ::= [ declared_identifier \f[CB]=\fC ] expression
.
.
.LP
Arguments in the argument list may be prepended with the parameter name.
However, arguments with parameter names must prepend arguments without parameter names in the argument list.
.LP
The below snippet presents examples of type definitions.
.
.
.QP
\f[CI]# Single line type definition
.br
\f[CB]type\fC cfg_t(w = 10) \f[CB]config\fC; \f[CB]width\fC = w; \f[CB]groups\fC = \f[CI]"configs"\fC
.br

.br
\f[CI]# Multi line type definition
.br
\f[CB]type\fC blk_t(with_status = \f[CB]true\fC, mask_count) \f[CB]block\fC
.br
	S [with_status]\f[CB]status\fC
.br
	M [mask_count]\f[CB]mask\fC
.br

.br
Main \f[CB]bus\fC
.br
	\f[CB]type\fC irq_t \f[CB]irq; \f[CB]groups\fC = \f[CI]"irq"\fC
.br
	I1 irq_t
.br
	I2 irq_t
.br

.br
	C1 cfg_t
.br
	C2 cfg_t(6)
.br
	C3 cfg_t(width = 8)
.br
 
.br
	Blk1 blk_t(7)
.br
	Blk2 blk_t(with_status = \f[CB]false\fC, mask_count = 11)
