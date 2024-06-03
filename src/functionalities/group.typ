== Group <group>

The group functionality represents a group of functionalities.
It used to inform a compiler that particular functionalities might be accessed together, and their register location must meet additional constraints.

The group functionality has following properties:

*`virtual`*` bool (false) {definitive}`
#pad(left: 1em)[
The virtual property defines whether the group is virtual.
Virtual groups are used to group functionalities without generating the group interface for the requester code.
]

Not all functionalities can be grouped.
Functionality grouping is described in detail in @grouping.
