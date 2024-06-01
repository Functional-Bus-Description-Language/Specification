== Config

The config functionality represents configuration data.
The configuration data is data that is automatically read by the provider from its registers.
As the config is automatically read by the provider, there is no need for an
additional signal associated with the config, indicating the config write by the requester.
By default, a config can be written and read by the requester.

The config functionality has following properties:

*`atomic`*` bool (true) {definitive}`
#pad(left: 1em)[
The atomic property defines whether an access to the config must be atomic.
If atomic is true, then the provider must guarantee that any change of the config value, triggered by the requester write, is seen as an atomic change by the other modules of the provider.
This is especially important when the config spans more than single register, as in case of single register write the change is always atomic.
]

*`init-value`*` bit string (uninitialized) {definitive}`
#pad(left: 1em)[
The init-value property defines the initial value of the config.
]

*`range`*` range | [range] (None) {definitive}`
#pad(left: 1em)[
The range property defines the range of valid values.
Range bound values shall not be negative.
This is because the FBDL makes no assumptions on the negative values encoding.
To accomplish negative range checks functions such as `u2` must be explicitly called.
For example, following assignment limits the possible range from -16 to -8: `range = u2(-8, 8):u2(-16, 8)`.
The range property shall not be explicitly set if the width property is already set.
If the range property is not set, then the actual range implies from the width property.
The code generated for the provider is not required to check or report if the value provided for the config write is within the valid range.
The recommended way is to implement compiler parameter allowing enabling/disabling range check generation. 
]

*`read-value`*` bit string (uninitialized) {definitive}`
#pad(left: 1em)[
The read-value property defines the value returned by the provider on the config read.
If the read-value is not set, then the provider must return the actual value of the config.
]

*`reset-value`*` bit string (uninitialized) {definitive}`
#pad(left: 1em)[
The reset-value property defines the value of the config after the reset.
If the reset-value is set, but a bus or block containing the config is not resettable (`reset = None`), then the compiler shall report an error.
]

*`width`*` integer (bus width) {definitive}`
#pad(left: 1em)[
The width property defines the bit width of the config.
The width property shall not be explicitly set if the range property is already set.
]

The code generated for the requester must provide means for writing and reading the config.
