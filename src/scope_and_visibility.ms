.bp
.NH
.XN "Scope and visibility"
.
.NH 2
.XN "Import and package system"
.LP
The FBDL has a concept of packages and allows importing packages into the file scope using import statements.
A package can be imported in a single line using single line import statement or as a part of the multi import statement.
.LP
\fCsingle_import_statement ::= \f[CB]import\fC [ identifier ] string_literal
.LP
Examples of single import statement:
.QP
\f[CB]import\fC \f[CI]"uart"\fC
.br
\f[CB]import\fC spi \f[CI]"custom_spi"\fC
.LP
\fCmulti_import_statement ::=
.br
	\f[CB]import\fC newline
.br
	indent
.br
	[ identifier ] string_literal
.br
	{ [ identifier ] string_literal }
.br
	dedent
.LP
Example of multi import statement:
.QP
\f[CB]import
.br
	\fC\f[CI]"uart"\fC
.br
	spi \f[CI]"custom_spi"\fC
.
.LP
The string literal is the path of the package.
The path might not but be complete, but shall be unambiguous.
For example, if two paths are visible by the import statement (\f[CI]"foo/bar/uart"\fR and \f[CI]"baz/zaz/uart"\fR), and both ends with \f[CI]"uart\fR", then \f[CI]"uart"\fR path is ambiguous, but \f[CI]"bar/uart"\fR and \f[CI]"zaz/uart"\fR are not.
.LP
The optional identifier is an identifier that shall denote the imported packaged within the importing file.
If the identifier is omitted, then the implicit identifier for the package is the last part of its path.
.
.NH 2
.XN "Scope rules"
.LP
The following elements define a new scope in the FBDL:
.BL
package,
.BL
type definition,
.BL
functionality instantiation.
.LP
Following example presents all scopes.
.QP
\f[CB]const\fC WIDTH = 16
.br
\f[CB]const\fC WIDTHx2 = WIDTH * 2
.br
Main \f[CB]bus\fC
.br
	\f[CB]width\f[C] = WIDTH
.br
	\f[CB]const\fC C20 = 20
.br
	Blk \f[CB]block\fC
.br
		\f[CB]const\fC C30 = 30
.br
		\f[CB]type\fC cfg_t(WIDTH = WIDTH) \f[CB]config\fC
.br
			\f[CB]atomic\f[C] = \f[CB]false\fC
.br
			\f[CB]width\f[C] = WIDTH
.br
		Cfg16 cfg_t
.br
		Cfg20 cfg_t(C20)
.br
		Cfg30 cfg_t(C30)
.LP
The \fCWIDTH\fR constant has package scope, and it is visible at the package level, in the \fCMain\fR bus instantiaiton and in the \fCBlk\fR block instantiaiton.
It would also be visible in the \fCcfg_t\fR type definition.
However, the \fCcfg_t\fR type has the parameter with the same name \fCWIDTH\fR.
As a result, only the \fCWIDTH\fR parameter is visible within the type definition.
The \fCWIDTH\fR parameter has default value that equals 16.
This is becuase at this point the name \fCWIDTH\fR denotes the package level \fCWIDTH\fR constant.
Type parameters are visible inside the type definition, but not in the type parameter list.
The \fCCfg16\fR is thus a non-atomic config of width 16, the \fCCfg20\fR is a non-atomic config of width 20 and the \fCCfg30\fR is a non-atomic config of width 30.
