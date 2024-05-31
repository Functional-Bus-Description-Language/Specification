== Bus

The `bus` functionality represents the bus structure.
Every valid description must have at least one bus instantiated, as the bus is the entry point for the description used for the code generation.

The `bus` functionality has following properties:

*`masters`*` integer (1) {definitive}`
#pad(left: 1em)[
The `masters` property defines the number of `bus` masters.
]

*`reset`*` string (None) {definitive}`
#pad(left: 1em)[
The `reset` property defines the `bus` reset type.
By default the bus has no reset.
Valid values of the `reset` property are _`"Sync"`_ for synchronous reset and _`"Async"`_ for asynchronous reset.
]

*`width`*` integer (32) {definitive}`
#pad(left: 1em)[
The `width` property defines the bus data width.
]

The bus address width is not explicitly set, as it implies from the address space size required to pack all functionalities included in the main  bus description.
