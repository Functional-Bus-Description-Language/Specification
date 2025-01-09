#pagebreak()

= Parametrization

The FBDL provides the following three ways for description parametrization:
- constants,
- type definitions,
- type extending.

== Constant

The constant represents a constant value.
The value might be used in expression evaluations.
The following code presents a bus description with three functionalities, all having the same array dimensions and width.

#block(breakable: false)[
#pad(left: 1em)[
```fbd
Main bus
  const ELEMENT_COUNT = 4
  const WIDTH = 8
  C [ELEMENT_COUNT]config; width = WIDTH
  M [ELEMENT_COUNT]mask; width = WIDTH
  S [ELEMENT_COUNT]status; width = WIDTH
```
]
]

Constants must be included in the generated code, both for the provider and for the requester.
This allows for having a single source of the constant value.

A constant can be defined in a single line in the single-line constant definition or as a part of the multi-constant definition.

#block(breakable: false)[
`single_constant_definition ::= `*`const`*` identifier = expression newline`

Examples of single constant definition:

#pad(left: 1em)[
```fbd
const WIDTH = 16
const FOO = 8 * BAR
const LIST = [1, 2, 3, 4, 5]
```
]
]

#block(breakable: false)[

`multi_constant_definition ::=` \
`  `*`const`*` newline` \
`  indent` \
`  identifier = expression newline` \
`  { identifier = expression newline }` \
`  dedent`

Examples of multi-constant definition:

#pad(left: 1em)[
```fbd
const
  WIDTH = 16
  FOO = 8 * BAR
  LIST = [1, 2, 3, 4, 5]
const
  ONE = 1
  TWO = ONE + 1
  THREE = TWO + 1
```
]
]

== Type definition

The type definition allows for defining custom functionalities.
Any custom functionality resolves to one of the built-in functionalities.
However, by defining custom functionality types it is possible to preset property values or to create easily parametrizable functionalities.
The former leads to shorter descriptions and helps to avoid duplication.

`type_definition ::= single_line_type_definition | multi_line_type_definition`

#block(breakable: false)[
`single_line_type_definition ::=` \
*`  type`* \
`  identifier` \
`  [ parameter_list ]` \
`  [ array_marker ]` \
`  declared_identifier | qualified identifier` \
`  [ argument_list ]` \
`  semicolon_and_property_assignments | newline`
]

#block(breakable: false)[
`multi_line_type_definition ::=` \
*`  type`* \
`  identifier` \
`  [ parameter_list ]` \
`  [ array_marker ]` \
`  declared_identifier | qualified identifier` \
`  [ argument_list ]` \
`  functionality_body`
]

`parameter_list ::= `*`(`*` parameters `*`)`*

`parameters ::= parameter { `*`,`*` parameter }`

`parameter ::= identifier [ `*`=`*` expression ]`

Parameters in the parameter list might have default values, but parameters with the default values must prepend parameters without default values in the parameter list.

`argument_list ::= `*`(`*` arguments )`

`arguments ::= argument { `*`,`*` argument }`

`argument ::= [ declared_identifier = ] expression`

Arguments in the argument list may be prepended with the parameter name.
However, arguments with parameter names must prepend arguments without parameter names in the argument list.

#block(breakable: false)[
The below snippet presents examples of type definitions.

#pad(left: 1em)[
```fbd
# Single line type definition
type cfg_t(w = 10) config; width = w; reset-value = 1

# Multi line type definition
type blk_t(with_status = true, mask_count) block
  S [with_status]status
  M [mask_count]mask

Main bus
  type irq_t irq; clear = "On Read"
  I1 irq_t
  I2 irq_t

  C1 cfg_t
  C2 cfg_t(6)
  C3 cfg_t(width = 8)

  Blk1 blk_t(7)
  Blk2 blk_t(with_status = false, mask_count = 11)
```
]
]

== Type extending

The type extending allows extending any custom defined type, either by instantiation or by defining a new type.
This is mainly, but not only, useful when there are similar blocks with only slightly different set of functionalities.

#block(breakable: false)[
Example:

#pad(left: 1em)[
```fbd
type blk_common_t block
  C1 config
  M1 mask
  S1 status
Main bus
  Blk_C blk_common_t
    C2 config
  Blk_M blk_common_t
    M2 mask
  Blk_S blk_common_t
    S2 status
```
]
]

This description is equivalent to the following description:

#block(breakable: false)[
#pad(left: 1em)[
```fbd
type blk_common_t block
  C1 config
  M1 mask
  S1 status
type blk_C_t blk_common_t
  C2 config
type blk_M_t blk_common_t
  M2 mask
type blk_S_t blk_common_t
  S2 status
Main bus
  Blk_C blk_C_t
  Blk_M blk_M_t
  Blk_S blk_S_t
```
]
]

The type nesting has no depth limit.
However, no property already set in one of the ancestor types can be overwritten.
Also no symbol identifier defined in one of the ancestor types can be redefined.
