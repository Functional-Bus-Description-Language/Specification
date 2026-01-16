== Block

The block functionality is used to logically group or encapsulate functionalities.
The block is usually used to separate functionalities related to particular peripherals such as UART, I2C transceivers, timers, ADCs, DACs etc.
The block might also be used to limit the access for particular provider to only a subset of functionalities.

The block functionality has following properties:

*`align`*` integer (inherited from bus align) {definitive}`
#pad(left: 1em)[
The align property defines the alignment of the block's address space.
The default value is inherited from the bus align property value.
]

*`masters`*` integer (1) {definitive}`
#pad(left: 1em)[
The `masters` property defines the number of block master ports.
This property defines how many master ports shall be generated.
However, it is up to the user how many master ports are connected in the design.
]

*`reset`*` string (None) {definitive}`
#pad(left: 1em)[
The reset property defines the block reset type.
By default the block has no reset.
Valid values of the reset property are _`"Sync"`_ for synchronous reset and _`"Async"`_ for asynchronous reset.
]

The following example presents how to limit the scope of access for particular requester.

#block(breakable: false)[
#pad(left: 1em)[
```fbd
Main bus
  C config
  Blk block
    masters = 2
    S status
```
]
]

The logical connection of the system components may look as follows:

#set align(center)
#image("../images/requester-access-limit.svg", width: 70%)
#set align(left)

The requester number 1 can acces both config C and status S.
However, the requester number 2 can access only the status S.
