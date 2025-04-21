#import "vars.typ"

#v(1cm)

#set align(center)

#image("logo.svg", width: 20%)

#v(2cm)

#text(18pt)[
*Functional Bus Description Language*
]

#text(11pt)[
Revision #vars.rev

#datetime.today().display("[day padding:none] [month repr:long] [year]")
]

#v(2cm)

#text(12pt)[
_Abstract_
]

#set align(left)

#par(justify: true)[
This document is the official specification of the Functional Bus Description Language.
Its primary purpose is to define the syntax and semantics of the language.
Functional Bus Description Language is a domain-specific language for bus and register management.
Its main characteristic is the paradigm shift from the register-centric approach to the functionality-centric approach.
In the register-centric approach, the user defines registers and then manually lays out the data into the registers.
In the functionality-centric approach, the user defines the functionality of the data, and the registers, module hierarchy, and access codes are later automatically inferred.
By defining the functionality of the data placed in the registers, it is possible to generate more code, increase code robustness, improve system design readability, and shorten the implementation process.
]

#v(2cm)

#par(justify: true)[
*keywords*:
bus interface,
code maintenance, computer languages, control interface,
design automation, design verification, documentation generation,
electronic design automation, EDA, electronic systems,
Functional Bus Description Language, FBDL,
hardware design, hardware description language, HDL, hierarchical register description,
memory,
programming,
register addressing, register synthesis,
software generation, system management
]

#pagebreak()
