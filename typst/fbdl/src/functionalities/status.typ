== Status

The `status` represents data that is produced by the provider and is only read by the requester.

The `status` functionality has following properties:

*`atomic`*` bool (`*`true`*`) {definitive}`
#pad(left: 1em)[
The `atomic` property defines whether an access to the `status` must be atomic.
If `atomic` is true, then the provider must guarantee that any change of the `status` value is seen as an atomic change by the requester.
This is especially important when a `status` spans more than single register, as in case of single register read the change is always atomic.
]

*`read-value`*` bit string (None) {definitive}`
#pad(left: 1em)[
The `read-value` property defines the value that must be returned by the provider on the `status` read after the first read.
If the `read-value` property is set, then the actual value of the `status` can be read only once.
]

*`width`*` integer (bus width) {definitive}`
#pad(left: 1em)[
The `width` property defines the bit width of the `status`.
]

The code generated for the requester must provide a mean for reading the `status`.
