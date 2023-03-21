.NH 2
.XN Static
.LP
The static functionality represents a data, placed at the provider, that shall never change.
.LP
The static functionality has following properties:
.IP "\f[CB]groups\f[CW] string | [string] (None)\f[]" 0.2i
The groups property defines the groups the static belongs to.
In case of a single group, the value can be a string.
In case of multiple groups the value shall be a list of strings.
Groups are thoroughly described in the grouping section.
.IP "\f[CB]init-value\f[CW] bit string | integer (obligatory)\f[]" 0.2i
The init-value property defines the value of the static.
.IP "\f[CB]read-value\f[CW] bit string | integer (None)\f[]"
The read-value property specifies the value that must be returned by the provider on the static read after the first read.
If the read-value property is set, then the actual value of the static can be read only once.
.IP "\f[CB]width\f[CW] integer (bus width)\f[]"
The width property defines the bit width of the static.
.LP
The static functionality may be used for example for versioning, bus id, bus generation timestamp or for storing secrets, that shall be read only once. Example:
.QP
\fCSecret \f[CB]static
.br
	\f[CB]width = \fC8
.br
	\f[CB]init-value = \fC113
.br
	\f[CB]read-value \fC= 0xFF
