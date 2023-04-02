.NH 2
.XN Param
.LP
The \fCparam\fR functionality is an inner functionality of the \fCproc\fR and \fCstream\fR functionalities.
It represents a data fed to a procedure or streamed by a downstream.
.LP
The \fCparam\fR functionality has following properties:
.IP "\f[CB]groups\f[CW] string | [string] (None)\f[]" 0.2i
The groups property defines the groups the param belongs to.
In case of a single group, the value can be a string.
In case of multiple groups the value shall be a list of strings.
Groups are thoroughly described in the grouping section.
.IP "\f[CB]width\f[CW] integer (bus width)\f[]"
The \fCwidth\fR property defines the bit width of the param.
.IP "\f[CB]range\f[CW] integer | [integer] (None)\f[]"
The \fCrange\fR property defines the range of valid values.
The range property on \fCparam\fR behaves exactly the same as the \fCrange\fR property on \fCconfig\fR.
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
