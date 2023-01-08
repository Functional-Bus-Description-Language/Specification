.NH 2
.XN Config
.LP
The config functionality represents a configuration data.
A configuration data is a data that is automatically read by the provider from its registers.
As the config is automatically read by the provider, there is no need for additional signal, associated with the config, indicating config write by the requester.
By default, a config can be written and read by the requester.
.LP
The config functionality has following properties:
.IP "\f[CB]atomic\f[CW] bool (\f[CB]true\fC)\f[]" 0.2i
The atomic property defines whether an access to the config must be atomic.
If atomic is true, then the provider must guarantee that any change of the config value, triggered by the requester write, is seen as an atomic change by the other modules of the provider.
This is especially important when the config spans more than single register, as in case of single register write the change is always atomic.
.IP "\f[CB]default\f[CW] bit string | integer (undefined)\f[]"
The default property defines the initial value of the config.
.IP "\f[CB]width\f[CW] integer (bus width)\f[]"
The width property defines the bit width of the config.
