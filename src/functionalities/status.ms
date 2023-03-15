.NH 2
.XN Status
.LP
The status represents a data that is produced by the provider and is only read by the requester.
.LP
The status functionality has following properties:
.IP "\f[CB]atomic\f[CW] bool (\f[CB]true\fC)\f[]" 0.2i
The atomic property defines whether an access to the status must be atomic.
If atomic is true, then the provider must guarantee that any change of the status value is seen as an atomic change by the requester.
This is especially important when the status spans more than single register, as in case of single register read the change is always atomic.
.IP "\f[CB]groups\f[CW] string | [string] (None)\f[]"
The groups property defines the groups the status belongs to.
In case of a single group, the value can be a string.
In case of multiple groups the value shall be a list of strings.
Groups are thoroughly described in the grouping section.
.IP "\f[CB]once\f[CW] bool (\f[CB]false\fC)\f[]"
The once property determines whether the status can be read only once.
.IP "\f[CB]width\f[CW] integer (bus width)\f[]"
The width property defines the bit width of the status.
.LP
The code generated for the requester must provide method for reading the status.
