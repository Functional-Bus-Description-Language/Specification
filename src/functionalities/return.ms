.NH 2
.XN Return
.LP
The return functionality is an inner functionality of the proc and stream functionalities.
It represents a data returned by a proc or streamed by an upstream.
.LP
The return functionality has following properties:
.IP "\f[CB]width\f[CW] integer (bus width)\f[]" 0.2i
The width property defines the bit width of the return.
.LP
Following example presents the definition of a procedure returning 4 element byte array, and a single bit flag indicating whether the data is valid.
.QP
\fCRead_Data \f[CB]proc\fC
.br
	data [4]\f[CB]return\fC; \f[CB]width\fC = 8
.br
	valid \f[CB]return\fC; \f[CB]width\fC = 1
