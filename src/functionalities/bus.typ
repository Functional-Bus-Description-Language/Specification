== Bus

The bus functionality represents the bus structure.
Every valid description must have at least one bus instantiated, as the bus is the entry point for the description used for the code generation.

The bus functionality has following properties:

*`masters`*` integer (1) {definitive}`
#pad(left: 1em)[
The masters property defines the number of bus master ports.
This property deﬁnes how many master ports shall be generated.
However, it is up to the user how many master ports are connected in the design.
]

*`reset`*` string (None) {definitive}`
#pad(left: 1em)[
The reset property defines the bus reset type.
By default the bus has no reset.
Valid values of the reset property are _`"Sync"`_ for synchronous reset and _`"Async"`_ for asynchronous reset.
]

*`width`*` integer (32) {definitive | declarative}`
#pad(left: 1em)[
The width property defines the bus data width.
Whether the width property is definitive or declarative depends on the compiler, more precisely on the compiler back-end.
For example, if the compiler back-end supports only 16 bits data width, then the property is declarative, as it is up to the user to provide the correct width value.
If the compiler back-end can handle multiple data bus widths, then the property is definitive.
]

The bus address width is not explicitly set, as it implies from the address space size required to pack all functionalities included in the bus description.
