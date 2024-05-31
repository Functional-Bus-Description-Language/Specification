== Memory

The `memory` functionality is used to directly connect and map an external memory to the generated bus address space.
A memory can also be connected to the bus using the `proc` or `stream` functionality.
However, using the `memory` functionality usually leads to greater throughput, but increases the size of the generated address space.

The `memory` functionality has following properties:

*`access`*` string (`_`"Read Write"`_`) {definitive}`
#pad(left: 1em)[
The `access` property declares the valid access permissions to the memory for the requester.
Valid values of the access property are: _`"Read Write"`_, _`"Read Only"`_, _`"Write Only"`_.
]

*`byte-write-enable`*` bool (`*`false`*`) {declarative}`
#pad(left: 1em)[
The `byte-write-enable` property declares byte-enable writes, that update the memory on contents on a byte-to-byte basis.
If the `byte-write-enable` property is explicitly set by a user, and a memory access is
_`"Read Only"`_, then a compiler shall report an error.
]

*`read-latency`*` integer (obligatory if access supports read) {declarative}`
#pad(left: 1em)[
The `read-latency` property declares the read latency in the number of clock cycles.
It is required, if a `memory` supports read access, to correcly implement read logic.
]

*`size`*` integer (obligatory) {declarative}`
#pad(left: 1em)[
The `size` property declares the `memory` size.
The size is in the number of memory words with width equal to the memory `width` property value.
]

*`width`*` integer (bus width) {declarative}`
#pad(left: 1em)[
The `width` property declares the `memory` data width.
]

The code generated for the requester must provide means for single read/write and block read/write transactions.
Whether access means for vectored (scatter-gather) transactions are automatically generated is up to the compiler.
If memory is read-only or write-only, then an unsupported write or read access code is recommended not to be generated.
