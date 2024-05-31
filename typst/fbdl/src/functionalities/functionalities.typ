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
+ irq,
+ mask,
+ memory,
+ param,
+ proc,
+ return,
+ static,
+ status,
+ stream.

#include "blackbox.typ"
#include "block.typ"
#include "bus.typ"

#include "irq.typ"
#include "mask.typ"
#include "memory.typ"
#include "param.typ"

#include "return.typ"
#include "static.typ"
#include "status.typ"
