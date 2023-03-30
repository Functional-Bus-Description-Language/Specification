.NH 2
.XN Config
.LP
The \fCconfig\fR functionality represents a configuration data.
A configuration data is a data that is automatically read by the provider from its registers.
As the \fCconfig\fR is automatically read by the provider, there is no need for additional signal, associated with the config, indicating config write by the requester.
By default, a \fCconfig\fR can be written and read by the requester.
.LP
The \fCconfig\fR functionality has following properties:
.IP "\f[CB]atomic\f[CW] bool (\f[CB]true\fC)\f[]" 0.2i
The \fCatomic\fR property defines whether an access to the config must be atomic.
If \fCatomic\fR is true, then the provider must guarantee that any change of the \fCconfig\fR value, triggered by the requester write, is seen as an atomic change by the other modules of the provider.
This is especially important when the \fCconfig\fR spans more than single register, as in case of single register write the change is always atomic.
.IP "\f[CB]groups\f[CW] string | [string] (None)\f[]"
The \fCgroups\fR property defines the groups the \fCconfig\fR belongs to.
In case of a single group, the value can be a string.
In case of multiple groups the value shall be a list of strings.
Groups are thoroughly described in the grouping section.
.IP "\f[CB]init-value\f[CW] bit string | integer (uninitialized)\f[]"
The \fCinit-value\fR property defines the initial value of the \fCconfig\fR.
.IP "\f[CB]range\f[CW] integer | [integer] (None)\f[]"
The \fCrange\fR property specifies the range of valid values.
If the \fCrange\fR value is of integer type then, the valid range is from 0 to the value, including the value.
If the \fCrange\fR value is an integer list, then it must have even number of elements.
Odd elements specify lower bounds of the subranges and even elements specify upper bounds of the subranges.
For instance, \fCrange = [1, 3, 7, 8]\fR means that the valid values are: 1, 2, 3, 7 and 8.
Range bound values shall not be negative.
This is because the FBDL makes no assumptions on the negative values encoding.
To accomplish negative range checks functions such as \fCu2\fR must be explicitly called.
For example, following assignment limits the possible range from -16 to -8: \fCrange = [u2(-8, 8), u2(-16, 8)]\fR.
The \fCrange\fR property shall not be explicitly set if the \fCwidth\fR property is already set.
If the \fCrange\fR property is not set, then the actual range implies from the \fCwidth\fR property.
The code generated for the provider is not required to check or report if the value provided for the config write is within the valid range.
The recommended way is to implement compiler parameter allowing enabling/disabling range check generation.
.IP "\f[CB]read-value\f[CW] bit string | integer (None)\f[]"
The \fCread-value\fR specifies the value returned by the provider on the config read.
If the \fCread-value\fR is not set, then the provider must return the actual value of the \fCconfig\fR.
.IP "\f[CB]reset-value\f[CW] bit string | integer (None)\f[]"
The \fCreset-value\fR specifies the value of the config after the reset.
If the \fCreset-value\fR is set, but a \fCbus\fR or \fCblock\fR containing the \fCconfig\fR is not resettable (\fCreset = None\fR), then the compiler shall report an error.
.IP "\f[CB]width\f[CW] integer (bus width)\f[]"
The \fCwidth\fR property defines the bit width of the config.
The \fCwidth\fR property shall not be explicitly set if the \fCrange\fR property is already set.
.
.LP
The code generated for the requester must provide methods for writing and reading the config.
