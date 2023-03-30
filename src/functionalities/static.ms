.NH 2
.XN Static
.LP
The \fCstatic\fR functionality represents a data, placed at the provider side, that shall never change.
.LP
The \fCstatic\fR functionality has following properties:
.IP "\f[CB]groups\f[CW] string | [string] (None)\f[]" 0.2i
The \fCgroups\fR property defines the groups the \fCstatic\fR belongs to.
In case of a single group, the value can be a string.
In case of multiple groups the value shall be a list of strings.
Groups are thoroughly described in the grouping section.
.IP "\f[CB]init-value\f[CW] bit string | integer (obligatory)\f[]" 0.2i
The \fCinit-value\fR property defines the initial value of the \fCstatic\fR.
.IP "\f[CB]read-value\f[CW] bit string | integer (None)\f[]"
The \fCread-value\fR property specifies the value that must be returned by the provider on the \fCstatic\fR read after the first read.
If the \fCread-value\fR property is set, then the actual value of the \fCstatic\fR can be read only once.
.IP "\f[CB]reset-value\f[CW] bit string | integer (None)\f[]"
The \fCreset-value\fR specifies the value of the static after the reset.
If the \fCreset-value\fR is set, but a \fCbus\fR or \fCblock\fR containing the \fCstatic\fR is not resettable (\fCreset = None\fR), then the compiler shall report an error.
If both \fCread-value\fR and \fCreset-value\fR properties are set, then the \fCstatic\fR can be read one more time after the reset.
.IP "\f[CB]width\f[CW] integer (bus width)\f[]"
The \fCwidth\fR property defines the bit width of the \fCstatic\fR.
.LP
The \fCstatic\fR functionality may be used for example for versioning, bus id, bus generation timestamp or for storing secrets, that shall be read only once. Example:
.QP
\fCSecret \f[CB]static
.br
	\f[CB]width = \fC8
.br
	\f[CB]init-value = \fC113
.br
	\f[CB]read-value \fC= 0xFF
