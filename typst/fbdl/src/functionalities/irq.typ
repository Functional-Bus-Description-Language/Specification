== Irq

The `irq` functionality represents an interrupt handling.
The `irq` functionality allows for automatic connection of the following interrupt producers (`in-trigger`) and consumers (`out-trigger`):

+ edge producer and edge sensitive consumer,
  #set align(center)
  #image("../images/irq-edge-edge.svg", width: 80%)
  #set align(left)
+ edge producer and level sensitive consumer,
  #set align(center)
  #image("../images/irq-edge-level.svg", width: 80%)
  #set align(left)
+ level producer and edge sensitive consumer,
  #set align(center)
  #image("../images/irq-level-edge.svg", width: 80%)
  #set align(left)
+ level producer and level sensitive consumer,
  #set align(center)
  #image("../images/irq-level-level.svg", width: 80%)
  #set align(left)

The `irq` functionality has following properties:

*`add-enable`*` bool (`*`false`*`) {definitive}`
#pad(left: 1em)[
The `add-enable` property defines whether an interrupt has associated enable bit in the interrupt enable register.
The enable can be used to mask the interrupt.
]

*`clear`*` string (`_`"Explicit"`_`) {definitive}`
#pad(left: 1em)[
The `clear` property defines how particular interrupt flag is cleared.
The `clear` property is valid only in case of level-triggered interrupt consumer.
If `clear` property is set for edge-triggered interrupt consumer a compiler shall shall report an error.
Valid values are _`"Explicit"`_ and _`"On Read"`_.
The _`"Explicit"`_ clear requires compiler to generate a means that must be explicitly used to clear the interrupt flag.
The _`"On Read"`_ clear requires the provider to clear the interrupt flag on each interrupt flag read.
]

*`enable-init-value`*` bit string (uninitialized) {definitive}`
#pad(left: 1em)[
The `enable-init-value` property defines the initial value of the enable bit in the interrupt enable register.
The value must not exceed one bit.
If `add-enable` is false and `enable-init-value` is set, then a compiler must report an error.
]

*`enable-reset-value`*` bit string (uninitialized) {definitive}`
#pad(left: 1em)[
The `enable-reset-value` property defines the value of the enable bit in the interrupt enable register after the reset.
The value must not exceed one bit.
If `add-enable` is false and `enable-reset-value` is set, then a compiler must report an error.
If the `enable-reset-value` is set, but a bus or block containing the `irq` is not resettable (`reset = None`), then the compiler shall report an error.
]

*`in-trigger`*` string (`_`"Level"`_`) {declarative}`
#pad(left: 1em)[
The `in-trigger` property declares the interrupt producer type of trigger.
Valid values are _`"Edge"`_ and _`"Level"`_.
It is up to the user to make sure declared trigger is coherent with the actual producer behavior.
A mismatch may lead to incorrect behavior.
]

*`out-trigger`*` string (`_`"Level"`_`) {declarative}`
#pad(left: 1em)[
The `out-trigger` property declares the interrupt consumer type of trigger.
Valid values are _`"Edge"`_ and _`"Level"`_.
It is up to the user to make sure declared trigger is coherent with the actual consumer requirement.
A mismatch may lead to incorrect behavior.
]
