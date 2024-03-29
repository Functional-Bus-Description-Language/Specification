.NH 2
.XN Blackbox
.LP
The \fCblackbox\fR functionality is used to incorporate blocks implemented manually or generated by external tools.
For example, a user may want to explicitly manage some particular registers' layouts.
In such a case, a register-centric tool might be used, and the generated block can be incorporated into the wrapping functionality-centric description using the \fCblackbox\fR functionality.
.
.LP
The \fCblackbox\fR functionality has following properties:
.IP "\f[CB]size\f[CW] integer (obligatory)\f[]" 0.2i
The \fCsize\fR property defines size of the \fCblackbox\fR in the number of words with width equal to the \fCwidth\fR property value of the block in which \fCblackbox\fR is defined.
.
.LP
The code generated for the requester should not provide any means for accessing the \fCblackbox\fR.
The code generated for the provider must provide a means to connect the \fCblackbox\fR to the remaining part of the bus generated by an FBDL compiler.
