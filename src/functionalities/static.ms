.NH 2
.XN Static
.LP
The static functionality represents an information, placed at the serving side, that shall never change.
.LP
The static functionality has following properties:
.IP "\f[CB]default\f[CW] bit string | integer (obligatory)\f[]" 0.2i
The default property defines the value of the static.
.IP "\f[CB]once\f[CW] bool (\f[CB]false\f[CW])\f[]"
The once property determines whether the static can be read only once.
If once is true, then after the first read the serving side must return the value of ... property on every static read.
.IP "\f[CB]width\f[CW] integer (bus width)\f[]"
The width property defines the bit width of the static.
.LP
The static functionality may be used for example for versioning, bus id, bus generation timestamp or for storing secrets, that shall be read only once. Example:
.QP
\fCSecret \f[CB]static
.br
	\f[CB]width = \fC8
.br
	\f[CB]default = \fC113
.br
	\f[CB]once \fC= \f[CB]true
.br
	\f[CB]... \fC= 0xFF
