== Bus

The bus functionality represents the bus structure.
Every valid description must have at least one bus instantiated, as the bus is the entry point for the description used for the code generation.

The bus functionality has following properties:

*`align`*` integer (0) {definitive}`
#pad(left: 1em)[
The align property defines the alignment of blocks address space.
The default value (0) means that no specific alignment is imposed.

By default, all blocks within the bus inherit the align property value from the bus align property.
However, a specific block alignment can be modified by changing the align property value within the block.

A proper value of the align property might be required for some buses.
For example, the AMBA AXI protocol specification requires that the address space of blocks (Subordinates) is aligned to 4 KB.
In the case of 32-bit wide data bus, the align property should be set to 1024 (4096 / 32 \* 8).
However, any value being a multiple of 1024 is correct.
A compiler back-end supporting the AMBA AXI generator should assert that the align property value is correct.
]

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
