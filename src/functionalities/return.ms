.NH 2
.XN Return
.LP
The return functionality is an inner functionality of the proc and stream functionalities.
It represents a data returned by a proc or streamed by an upstream.
.LP
The return functionality has following properties:
.IP "\f[CB]groups\f[CW] string | [string] (None)\f[]" 0.2i
The groups property defines the groups the return belongs to.
In case of a single group, the value can be a string.
In case of multiple groups the value shall be a list of strings.
Groups are thoroughly described in the grouping section.
.IP "\f[CB]width\f[CW] integer (bus width)\f[]"
The width property defines the bit width of the return.
.LP
Following example presents the definition of a procedure returning 4 element byte array, and a single bit flag indicating whether the data is valid.
.QP
\fCRead_Data \f[CB]proc\fC
.br
	data [4]\f[CB]return\fC; \f[CB]width\fC = 8
.br
	valid \f[CB]return\fC; \f[CB]width\fC = 1
