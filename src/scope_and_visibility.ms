.bp
.NH
.XN "Scope and visibility"
.
.NH 2
.XN "Import and package system"
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
