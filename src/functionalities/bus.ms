.NH 2
.XN Bus
.LP
The bus functionality represents the bus structure.
Every valid description must have at least one bus instantiated, as the the bus named  \fCMain\fR  is the entry point for the description used for the code generation.
.LP
The bus functionality has following properties:
.IP "\f[CB]masters\f[CW] integer (1)\f[]" 0.2i
The masters property specifies the number of bus masters.
.IP "\f[CB]reset\f[CW] string (None)\f[]"
The reset property specifies the bus reset type.
By default the bus has no reset.
Valid values of the reset property are \f[CI]"Sync"\fR for synchronous reset and \f[CI]"Async"\fR for asynchronous reset.
.IP "\f[CB]width\f[CW] integer (32)\f[]"
The width property defines the bus data width.
.
.LP
The bus address width is not explicitly set, as it implies from the address space size needed to pack all functionalities included in the  \fCMain\fR  bus description.
