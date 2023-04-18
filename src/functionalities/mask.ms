.NH 2
.XN Mask
.LP
The \fCmask\fR functionality represents a bit mask.
The mask is a data that is automatically read by the provider from its registers.
By default, a \fCmask\fR can be written and read by the requester.
The \fCmask\fR is very similar to the \fCconfig\fR.
The difference is that the \fCconfig\fR is value oriented, whereas the \fCmask\fR is bit oriented.
From the provider's perspective the mask and the config are the same.
From the requester's perspective the code generated for interacting with the \fCmask\fR and the \fCconfig\fR is different.
.LP
The \fCmask\fR functionality has following properties:
.IP "\f[CB]atomic\f[CW] bool (\f[CB]true\fC)\f[]" 0.2i
The \fCatomic\fR property defines whether an access to the mask must be atomic.
If atomic is true, then the provider must guarantee that any change of the mask value, triggered by the requester write, is seen as an atomic change by the other modules of the provider.
This is especially important when the mask spans more than single register, as in case of single register write the change is always atomic.
.IP "\f[CB]init-value\f[CW] bit string | integer (uninitialized)\f[]"
The \fCinit-value\fR property defines the initial value of the \fCmask\fR.
.IP "\f[CB]read-value\f[CW] bit string | integer (None)\f[]"
The \fCread-value\fR property defines the value returned by the provider on the \fCmask\fR read.
If the \fCread-value\fR is not set, then the provider must return the actual value of the mask.
.IP "\f[CB]reset-value\f[CW] bit string | integer (None)\f[]"
The \fCreset-value\fR property defines the value of the \fCmask\fR after the reset.
If the \fCreset-value\fR is set, but a \fCbus\fR or \fCblock\fR containing the \fCmask\fR is not resettable (\fCreset = None\fR), then the compiler shall report an error.
.IP "\f[CB]width\f[CW] integer (bus width)\f[]"
The \fCwidth\fR property defines the bit width of the \fCmask\fR.
.
.LP
The code generated for the requester must provide means for setting, clearing and updating particular bits of the \fCmask\fR.
The updating includes setting, clearing and toggling.
The set differs from the update set.
The set sets particular bits and simultaneously clears all remaining bits.
The update set sets particular bits and keeps the value of remaining bits.
The clear differs from the update clear in analogous way.
The toggle always works on provided bits leaving remaining bits untouched.
