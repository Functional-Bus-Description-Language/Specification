.NH 2
.XN Mask
.LP
The mask functionality represents a bit mask.
The mask is a data that is automatically read by the provider from its registers.
By default, a mask can be written and read by the requester.
The mask is very similar to the config.
The difference is that the config is value oriented, whereas the mask is bit oriented.
From the provider's perspective the mask and the config are the same.
From the requester's perspective the code generated for interacting the mask and the config is different.
.LP
The mask functionality has following properties:
.IP "\f[CB]atomic\f[CW] bool (\f[CB]true\fC)\f[]" 0.2i
The atomic property defines whether an access to the mask must be atomic.
If atomic is true, then the provider must guarantee that any change of the mask value, triggered by the requester write, is seen as an atomic change by the other modules of the provider.
This is especially important when the mask spans more than single register, as in case of single register write the change is always atomic.
.IP "\f[CB]init-value\f[CW] bit string | integer (undefined)\f[]"
The init-value property defines the initial value of the mask.
.IP "\f[CB]read-value\f[CW] bit string | integer (None)\f[]"
The read-value specifies the value returned by the provider on the mask read.
If the read-value is not set, then the provider must return the actual value of the mask.
.IP "\f[CB]width\f[CW] integer (bus width)\f[]"
The width property defines the bit width of the mask.
.
.LP
The code generated for the requester must provide methods for setting and clearing particular bits of the mask.
