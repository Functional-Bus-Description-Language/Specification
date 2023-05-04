.NH 2
.XN Status
.LP
The \fCstatus\fR represents data that is produced by the provider and is only read by the requester.
.LP
The \fCstatus\fR functionality has following properties:
.IP "\f[CB]atomic\f[CW] bool (\f[CB]true\fC)\f[]" 0.2i
The \fCatomic\fR property defines whether an access to the \fCstatus\fR must be atomic.
If \fCatomic\fR is true, then the provider must guarantee that any change of the \fCstatus\fR value is seen as an atomic change by the requester.
This is especially important when the \fCstatus\fR spans more than single register, as in case of single register read the change is always atomic.
.IP "\f[CB]groups\f[CW] string | [string] (None)\f[]"
The \fCgroups\fR property defines the groups the \fCstatus\fR belongs to.
In case of a single group, the value can be a string.
In case of multiple groups the value shall be a list of strings.
Groups are thoroughly described in the grouping section.
.IP "\f[CB]read-value\f[CW] bit string | integer (None)\f[]"
The \fCread-value\fR property defines the value that must be returned by the provider on the \fCstatus\fR read after the first read.
If the \fCread-value\fR property is set, then the actual value of the \fCstatus\fR can be read only once.
.IP "\f[CB]width\f[CW] integer (bus width)\f[]"
The \fCwidth\fR property defines the bit width of the \fCstatus\fR.
.LP
The code generated for the requester must provide a mean for reading the \fCstatus\fR.
