#pagebreak()

= Scope and visibility

== Import and package system

The FBDL has a concept of packages and allows importing packages into the file scope using the import statements.
A package consists of files with `.fbd` extension placed in the same directory.
A package directory name must start with the `"fbd-"` prefix.
A package should have at least one file and shall not be placed in more than a single directory.
A package is uniquely identified by its path.
The name of a package is equivalent to the package directory name without the `"fbd-"` prefix.
The package name `"main"` is reserved for the package consisting of a single file provided for the compiler as the compilation entry point.

Two packages may have the same name, but not the same path.
For example, packages with following paths `foo/bar/fbd-uart` and `baz/zaz/fbd-uart` have the same name `"uart"`.

A package can be imported in a single line using the single-line import statement or as a part of the multi-import statement.

`single_import_statement ::= `*`import`*` [ identifier ] string_literal`

#block(breakable: false)[
Examples of single import statement:

#pad(left: 1em)[
```fbd
import "uart"
import spi "custom_spi"
```
]
]

#block(breakable: false)[
`multi_import_statement ::=` \
`  `*`import`*` newline` \
`  indent` \
`  [ identifier ] string_literal` \
`  { [ identifier ] string_literal }`
]

#block(breakable: false)[
Examples of multi import statement:

#pad(left: 1em)[
```fbd
import
  "uart"
  spi "custom_spi"
```
]
]

The string literal is the path of the package.
The path might not be complete, but shall be unambiguous.
For example, if two paths are visible by the import statement (_`"foo/bar/fbd-uart"`_ and _`"baz/zaz/fbd-uart"`_), and both ends with  _`"fbd-uart"`_, then _`"uart"`_ path is ambiguous, but _`"bar/fbd-uart"`_ and _`"zaz/fbd-uart"`_ are not.

The optional identifier is an identifier that shall denote the imported package within the importing file.
If the identifier is omitted, then the implicit identifier for the package is the package name.

=== Package discovery

Each FBDL compiler is required to carry out the package auto-discovery procedure.
The procedure consists of recursive checking of subdirectories of the following directories:
#set enum(numbering: "1)")
+ compiler working directory,
+ all directories defined in the `FBDPATH` environment variable,
+ additional directories provided to the compiler via custom parameters.

The below snippet presents a tree of an example working directory.

#block(breakable: false)[
#pad(left: 1em)[
```
|-- externals
|   `-- timer
|       |-- fbd-timer
|       |   `-- timer.fbd
|       `-- gw
|           `-- timer.vhd
|-- fbd
|   |-- main.fbd
|   |-- fbd-i2c
|   |   `-- i2c.fbd
|   |-- tb
|   |   |-- i2c.fbd
|   |   `-- spi.fbd
|   `-- fbd-spi
|       `-- spi.fbd
|-- gw
|   |-- modules
|   |   |-- i2c.vhd
|   |   `-- spi.vhd
|   `-- top.vhd
`-- sw
    `-- run.py
```
]
]

In this case each FBDL compilant compiler must automatically discover following three packages:
- `i2c` - path `"./fbd/fbd-i2c"`,
- `spi` - path `"./fbd/fbd-spi"`,
- `timer` - path `"./externals/timer/fbd-timer"`.

== Scope rules

The following elements define a new scope in the FBDL:
- package,
- type definition,
- functionality instantiation.

The following example presents all scopes.

#block(breakable: false)[
#pad(left: 1em)[
```fbd
const WIDTH = 16
main bus
  width = WIDTH
  const C20 = 20
  blk block
    const C30 = 30
    type cfg_t(WIDTH = WIDTH) config
      atomic = false
      width = WIDTH
    cfg16 cfg_t
    cfg20 cfg_t(C20)
    cfg30 cfg_t(C30)
```
]
]

The `WIDTH` constant has package scope, and it is visible at the package level, in the `main` bus instantiation and in the `Blk` block instantiation.
It would also be visible in the `cfg_t` type definition.
However, the `cfg_t` type has the parameter with the same name `WIDTH`.
As a result, only the `WIDTH` parameter is visible within the type definition.
The `WIDTH` parameter has a default value that equals `16`.
This is because at this point the name `WIDTH` denotes the package level `WIDTH` constant.
Type parameters are visible inside the type definition, but not in the type parameter list.
The `cfg16` is thus a non-atomic config of width `16`, the `cfg20` is a non-atomic config of width `20` and the `cfg30` is a non-atomic config of width `30`.
