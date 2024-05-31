== Mask

The mask functionality represents a bit mask.
The mask is data that is automatically read by the provider from its registers.
By default, a mask can be written and read by the requester. The mask is very similar to the config.
The difference is that the config is value-oriented, whereas the mask is bit-oriented.
From the provider’s perspective the mask and the config are the same.
From the requester’s perspective the code generated for interacting with the mask and the config is different.

The mask functionality has following properties:

*`atomic`*` bool (true) {definitive}`
#pad(left: 1em)[
The atomic property defines whether an access to the mask must be atomic.
If atomic is true, then the provider must guarantee that any change of the mask value, triggered by the requester write, is seen as an atomic change by the other modules of the provider.
This is especially important when the mask spans more than single register, as in case of single register write the change is always atomic.
]

*`init-value`*` bit string (uninitialized) {definitive}`
#pad(left: 1em)[
The init-value property defines the initial value of the mask.
]

*`read-value`*` bit string (None) {definitive}`
#pad(left: 1em)[
The read-value property defines the value returned by the provider on the mask read.
If the read-value is not set, then the provider must return the actual value of the mask.
]

*`reset-value`*` bit string (None) {definitive}`
#pad(left: 1em)[
The reset-value property defines the value of the mask after the reset.
If the reset-value is set, but a bus or block containing the mask is not resettable (`reset = None`), then the compiler shall report an error.
]

*`width`*` integer (bus width) {definitive}`
#pad(left: 1em)[
The width property defines the bit width of the mask.
]

The code generated for the requester must provide means for setting, clearing and updating particular bits of the mask.
The updating includes setting, clearing and toggling.
The set differs from the update set.
The set sets particular bits and simultaneously clears all remaining bits.
The update set sets particular bits and keeps the value of the remaining bits.
The clear differs from the update clear in an analogous way.
The toggle always works on provided bits leaving the remaining bits untouched.
