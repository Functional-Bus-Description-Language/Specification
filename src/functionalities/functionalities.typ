#pagebreak()

= Functionalities

Functionalities are the core part of the FBDL.
They define the capabilities of the provider.
Each functionality is distinct and unambiguously defines the provider behavior and the interface that must be generated for the requester.
There are following 13 functionalities:
+ blackbox,
+ block,
+ bus,
+ config,
+ group,
+ irq,
+ mask,
+ param,
+ proc,
+ return,
+ static,
+ status,
+ stream.

Sections of this chapter describe all available functionalities.
Functionality properties are defined in the following notation.

*`property-name`*` expected value type (default value) {kind}`

Due to implicit data type conversion rules, some properties accept more than one data type.
For example, the range property expects a value of the range data type.
However, as there is a rule for implicit conversion from the integer type to the range type, the `"range = 5"` assignment is also valid.

The property kind indicates whether the property is a definitive or a declarative property as described in @concepts-properties.

#include "blackbox.typ"
#include "block.typ"
#include "bus.typ"
#include "config.typ"
#include "group.typ"
#include "irq.typ"
#include "mask.typ"
#include "param.typ"
#include "proc.typ"
#include "return.typ"
#include "static.typ"
#include "status.typ"
#include "stream.typ"
