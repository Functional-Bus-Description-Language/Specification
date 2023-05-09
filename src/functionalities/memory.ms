.NH 2
.XN Memory
.LP
The \fCmemory\fR functionality is used to directly connect and map an external memory to the generated bus address space.
A memory can also be connected to the bus using the \fCproc\fR or \fCstream\fR functionality.
However, using the \fCmemory\fR functionality usually leads to greater throughput, but increases the size of the generated address space.
.LP
The \fCmemory\fR functionality has following properties:
.IP "\f[CB]access\fC string (\f[CI]""Read Write""\fC)\f[]" 0.2i
The \fCaccess\fR property declares the valid access permissions to the memory for the requester.
Valid values of the \fCaccess\fR property are: \f[CI]"Read Write"\fR, \f[CI]"Read Only"\fR, \f[CI]"Write Only"\fR.
.IP "\f[CB]byte-write-enable\fC bool (false)\f[]"
The \fCbyte-write-enable\fR property declares byte-enable writes, that update the memory on contents on a byte-to-byte basis.
If the \fCbyte-write-enable\fR property is explicitly set by a user, and a \fCmemory\fR access is \f[CI]"Read Only"\fR, then a compiler shall report an error.
.IP "\f[CB]read-latency\fC integer (obligatory if access supports read)\f[]"
The \fCread-latency\fR property declares the read latency in the number of clock cycles.
It is required, if a \fCmemory\fR supports read access, to correcly implement read logic.
.IP "\f[CB]size\fC integer (obligatory)\f[]"
The \fCsize\fR property declares the \fCmemory\fR size.
The \fCsize\fR is in the number of memory words with width equal to the \fCmemory\fR \fCwidth\fR property value.
.IP "\f[CB]width\f[CW] integer (bus width)\f[]"
The \fCwidth\fR property declares the memory data width.
.
.LP
The code generated for the requester must provide means for single read/write and block read/write transactions.
Whether access means for vectored (scatter-gather) transactions are automatically generated is up to the compiler.
If memory is read-only or write-only, then an unsupported write or read access code is recommended not to be generated.
