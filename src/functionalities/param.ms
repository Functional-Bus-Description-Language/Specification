.NH 2
.XN Param
.LP
The param functionality is an inner functionality of the proc and stream functionalities.
It represents a data fed to a proc or streamed by a downstream.
.LP
The param functionality has following properties:
.IP "\f[CB]width\f[CW] integer (bus width)\f[]" 0.2i
The width property defines the bit width of the param.
.LP
Following example presents the definition of a downstream with three parameters.
.QP
\fCSum_Reduce \f[CB]stream\fC
.br
	\f[CB]type\fC param_t \f[CB]param\fC; \f[CB]width\fC = 16
.br
	a param_t
.br
	b param_t
.br
	c param_t
