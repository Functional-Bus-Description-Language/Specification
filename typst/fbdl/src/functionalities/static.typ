== Static

The `static` functionality represents data, placed at the provider side, that shall never change.

The `static` functionality has following properties:

*`init-value`*` bit string (obligatory) [definitive]`
#pad(left: 1em)[
The `init-value` property defines the initial value of the `static`.
]

*`read-value`*` bit string (None) [definitive]`
#pad(left: 1em)[
The `read-value` property defines the value that must be returned by the provider on the `static` read after the first read.
If the `read-value` property is set, then the actual value of the `static` can be read only once.
]

*`reset-value`*` bit string (None) [definitive]`
#pad(left: 1em)[
The `reset-value` property defines the value of the `static` after the reset.
If the `reset-value` is set, but a `bus` or `block` containing the `static` is not resettable (`reset = None`), then the compiler shall report an error.
If both `read-value` and `reset-value` properties are set, then the `static` can be read one more time after the reset.
]

*`width`*` integer (bus width) [definitive]`
#pad(left: 1em)[
The `width` property defines the bit width of the `static`.
]

The `static` functionality may be used for example for versioning, bus id, bus generation timestamp or for storing secrets, that shall be read only once. Example:

#line(length: 100%)
```fbd
Secret static
  width = 8
  init-value = 0x13
  read-value = 0xFF
```
#line(length: 100%)
