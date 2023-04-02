.NH 2
.XN Bus
.LP
The \fCbus\fR functionality represents the bus structure.
Every valid description must have at least one bus instantiated, as the the bus named  \fCMain\fR  is the entry point for the description used for the code generation.
.LP
The \fCbus\fR functionality has following properties:
.IP "\f[CB]masters\f[CW] integer (1)\f[]" 0.2i
The \fCmasters\fR property defines the number of \fCbus\fR masters.
.IP "\f[CB]reset\f[CW] string (None)\f[]"
The \fCreset\fR property defines the \fCbus\fR reset type.
By default the bus has no reset.
Valid values of the \fCreset\fR property are \f[CI]"Sync"\fR for synchronous reset and \f[CI]"Async"\fR for asynchronous reset.
.IP "\f[CB]width\f[CW] integer (32)\f[]"
The \fCwidth\fR property defines the bus data width.
.
.LP
The bus address width is not explicitly set, as it implied from the address space size needed to pack all functionalities included in the  \fCMain\fR  bus description.
