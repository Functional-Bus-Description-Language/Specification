#pagebreak()

= Concepts

The core concept behind the FBDL is based on the fact that if there is a system part with the registers that can be accessed, then there is at least one more system part accessing these registers.
The part accessing the registers is called the _requester_.
The part containing the registers is called the _provider_, as it provides functions via particular functionalities.

The code generated from the FBDL description can be conceptually divided into two parts, the requester part and the provider part.
The requester code usually refers to the generated software or firmware implemented in typical programming languages such as: Ada, C, C++, Go, Java, Python, Rust etc.
The provider code usually refers to the generated gateware or hardware implemented in hardware description languages or frameworks such as: VHDL, SystemVerilog, SystemC, Bluespec, PipelineC, MyHDL, Chisel etc.
However, implementing the provider, for example as a firmware, using the C language and a microcontroller is practically doable and valid.

The description of functionalities shall be placed in files with the `.fbd` extension.
By default, the bus named `Main` is the entry point for the description used for the code generation.
A compiler is free to support a parameter for changing the name of the main bus.

```
description ::=
  import_statement |
  constant_definition |
  type_definition |
  instantiation
```

== Properties <concepts-properties>

Each data in the FBDL description has associated functionality and each functionality has associated properties.
Properties allow the configuration of functionalities.
Each property must have a concrete type.
The default value of each property is specified in the round brackets ( ) in the functionality subsections.
If the default value is `bus width`, then the default value equals the actual value of the bus `width` property.
If the default value is `uninitialized`, then it shall be represented as the uninitialized meta value at the provider side.
If the target language for the provider code does not have a concept of uninitialized value, then values such as 0, `Null`, `None`, `nil` etc. shall be used.

Each property either defines or declares functionality feature or behavior.
Definitive properties specify the desired behavior of the automatically generated code.
They specify elements directly managed by the FBDL.
Examples of definitive properties include `atomic` or `width` properties.
Declarative properties describe the behavior of external elements that automatically generated code only interacts with.
Declarative properties are required to generate valid logic, and it is the user's responsibility to make sure their values match the behavior of external components.
Examples of declarative properties include `access` or `in-trigger` properties.

`property_assignment ::= property_identifier `*`=`*` expression`

`property_assignments ::=` \
`  property_assignments` \
`  { `*`;`*` property_assignment }` \
`  newline`

`semicolon_and_property_assignments ::= `*`;`*` property_assignments`

#block(breakable: false)[
`property_identifier ::=` \
#h(1em)
*`access`*` | `
*`add-enable`*` | `
*`atomic`*` | `
*`byte-write-enable`*` | `
*`clear`*` | `
*`delay`*` | `
#linebreak()
#h(1em)
*`enable-init-value`*` | `
*`enable-reset-value`*` | `
*`groups`*` | `
*`init-value`*` | `
#linebreak()
#h(1em)
*`in-trigger`*` | `
*`masters`*` | `
*`out-trigger`*` | `
*`range`*` | `
*`read-latency`*` | `
#linebreak()
#h(1em)
*`read-value`*` | `
*`reset`*` | `
*`reset-value`*` | `
*`size`*` | `
*`width`*
]

== Instantiation

A functionality can be instantiated in a single line or in multiple lines.

`instantiation ::= single_line_instantiation | multi_line_instantiation`

```
single_line_instantiation ::=
  identifier
  [ array_marker ]
  declared_identifier | qualified_identifier
  [ argument_list ]
  newline | semicolon_and_property_assignments
```

```
multi_line_instantiation ::=
  identifier
  [ array_marker ]
  declared_identifier | qualified_identifier
  [ argument_list ]
  functionality_body
```

`array_marker ::= `*`[`*` expression ` *`]`*

```
functionality_body ::=
  newline
  indent
  { constant_definition | type_definition | property_assignments | instantiation }
  dedent
```

The following code shows examples of single line instantiations:

#block(breakable:false)[
#pad(left: 1em)[
```fbd
C config
C config; width = 8
M [8]mask; atomic = false; width = 128; init-value = 0
err error_t(48); atomic = false
```
]
]

The following code shows examples of multi line instantiations:

#block(breakable:false)[
#pad(left: 1em)[
```fbd
My_Config config
  width = 96
  atomic = false
My_Irq irq
  add-enable = true
  in-trigger = "Edge"
```
]
]

== Addressing

The FBDL specification does not impose any addressing mode, for example, byte or word.
There is also no property allowing to switch between different addressing modes.
The handling of the addressing mode is left to the particular compiler implementation.

Depending on the use case and target bus, at least a few approaches are possible.
+ Suppose the compiler has a monolithic structure (no distinction between the compiler front-end and back-end).
  In that case, it is best to use the addressing mode required or preferred by the target bus (for example, byte addressing for AXI or word addressing for Wishbone).
+ Suppose the compiler is just a generic front-end:
  - The compiler might provide command line flag or parameter to specify the addressing mode during the compiler call.
  - The compiler might assume byte addressing.
    The drawback of this approach is that the data bus width must be a multiple of the number of bits in a byte.
    In such a case, word addressing is obtained by simply discarding a proper number of the least significant bits of the address bus.
    The address bus shift operation is carried out by the compiler back-end.
  - The compiler might assume word addressing.
    The advantage of this approach is that there is no extra restriction on the data bus width when the back-end utilizes word addressing.
    If the back-end utilizes byte addressing, the address is obtained by adding a proper number of the least significant bits to the address bus.
    The address bus shift operation is carried out by the compiler back-end.
    The back-end must also ensure that the data bus width has the proper value.

== Positive logic

The FBDL uses only positive logic.
An active level in positive logic is a high level (binary 1), and an active edge is a rising edge (transition from the low level to the high level, from binary 0 to binary 1).
It does not mean that FBDL cannot be used with external components using negative logic.
To connect external negative logic components to the generated FBDL positive logic components, one shall negate the signals at the interface connection level.
Supporting both positive and negative logic would unnecessarily complex the language and would create a second way for solving the same problem making the set of possible solutions non-orthogonal.

== Domain-specific language

The FBDL is a domain-specific language with its own syntax.
Some of the register-centric tools are built on top of standard file formats or markup languages such as JSON, TOML, XML or YAML.
Such an approach allows for fast prototyping and has a lower entry threshold.
However, it becomes a burden when more conceptually advanced features, for example parametrization, have to be supported.
The description quickly begins to gain in volume, and the overall feeling is it is needlessly verbose.
What is more, having its own adjusted language syntax allows for more informative compiler error messages.
