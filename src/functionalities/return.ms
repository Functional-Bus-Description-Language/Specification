.NH 2
.XN Return
.LP
The \fCreturn\fR functionality is an inner functionality of the \fCproc\fR and \fCstream\fR functionalities.
It represents data returned by a procedure or streamed by an upstream.
.LP
The \fCreturn\fR functionality has following properties:
.IP "\f[CB]groups\f[CW] string | [string] (None)\f[]" 0.2i
The \fCgroups\fR property defines the groups the return belongs to.
In case of a single group, the value can be a string.
In case of multiple groups the value shall be a list of strings.
Groups are thoroughly described in the grouping section.
.IP "\f[CB]width\f[CW] integer (bus width)\f[]"
The \fCwidth\fR property defines the bit width of the return.
.LP
The following example presents the definition of a procedure returning 4 element byte array, and a single bit flag indicating whether the data is valid.
.QP
\fCRead_Data \f[CB]proc\fC
.br
	data [4]\f[CB]return\fC; \f[CB]width\fC = 8
.br
	valid \f[CB]return\fC; \f[CB]width\fC = 1
