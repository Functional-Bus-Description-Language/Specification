#pagebreak()

= Scope and visibility

== Import and package system

The FBDL has a concept of packages and allows importing packages into the file scope using the import statements.
A package consists of files with `.fbd` extension placed in the same directory.
A package must have at least one file and shall not be placed in more than a single directory.
A package is uniquely identified by its path.
The name of a package is equivalent to the last part of its path.
That is, it is the same as the name of the directory containing package files.
However, if the package directory name starts with the _`"fbd-"`_ prefix, then the prefix is not included in the package name.
For example, two packages with following paths `foo/bar/uart` and `baz/zaz/fbd-uart` have exactly the same name `uart`.

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
For example, if two paths are visible by the import statement (_`"foo/bar/uart"`_ and _`"baz/zaz/uart"`_), and both ends with  _`"uart"`_, then _`"uart"`_ path is ambiguous, but _`"bar/uart"`_ and _`"zaz/uart"`_ are not.

The optional identifier is an identifier that shall denote the imported package within the importing file.
If the identifier is omitted, then the implicit identifier for the package is the last part of its path.

=== Package discovery

Each FBDL compiler is required to carry out the package auto-discovery procedure.
The procedure must obey following rules.

#set enum(numbering: "1)")

+ All files with the `".fbd"` extension in the compiler working directory belong to the main package.

+ If the compiler working directory contains a directory named `"fbd"`, then:

  #set enum(numbering: "a)")
  + The `"fbd"` directory is a part of the main package.
    The directory does not have to contain any files with the `".fbd"` extension.

  + Each of the `"fbd"` subdirectories is considered a package directory if it contains at least one file with the `".fbd"` extension.
    Package directory may be arbitrarily nested.
    The name of the package is the same as the name of the subdirectory, unless it has `"fbd-"` prefix.
    In such a case, the prefix shall be removed from the package name.
    If the name of the subdirectory matches exactly the `"fbd-"` pattern, then a compiler must report an error on an invalid package name.

+ The compiler must recursively check all subdirectories of its working path (except the `"fbd"` directory in the working directory that is described in rule number 2).
  Each subdirectory with a name starting with the `"fbd-"` prefix is considered a package directory if it contains at least one file with the `".fbd"` extension.
  If the name of the subdirectory matches exactly the `"fbd-"` pattern, then a compiler must report an error on an invalid package name

+ The compiler must recursively check all subdirectories of the paths defined in the `FBDPATH` environment variable.
  The variable may contain multiple paths separated by the ’:’ (colon) character.
  Each subdirectory with a name starting with the `"fbd-"` prefix is considered a package directory if it contains at least one file with the `".fbd"` extension.
  If the name of the subdirectory matches exactly the `"fbd-"` pattern, then a compiler must report an error on an invalid package name.
Compilers are also free to have their parameters allowing to provide extra paths to look for packages.
The below snippet presents a tree of an example working directory.

#block(breakable: false)[
#pad(left: 1em)[
```
|-- externals
|   `-- bar
|       |-- fbd-bar
|       |   `-- bar.fbd
|       `-- gw
|           `-- bar.vhd
|-- fbd
|   |-- main.fbd
|   |-- fbd-pkg1
|   |   `-- a.fbd
|   |-- not-a-pkg
|   |   `-- c.txt
|   `-- pkg2
|       `-- b.fbd
|-- gw
|   |-- modules
|   |   |-- a.vhd
|   |   `-- b.vhd
|   `-- top.vhd
`-- sw
    `-- foo.py
```
]
]

In this case each FBDL compilant compiler must automatically discover following four packages:
- `main` - path `"./fbd"`,
- `pkg1` - path `"./fbd/fbd-pkg1"`,
- `pkg2` - path `"./fbd/pkg2"`,
- `bar` - path `"./externals/bar/fbd-bar"`.

By default, any FBDL compiler must start the instantiation process from the `Main` bus instantiation in the main package.
This rule, together with package discovery rules, implies that the file with the `Main` bus instantiation must be placed in one of the following directories:
+ compiler working directory,
+ `"fbd"` directory in the compiler working directory,
+ `"fbd-main"` directory nested somewhere in the compiler working directory,
+ `"fbd-main"` directory nested somewhere in directories defined in the `FBDPATH` environment variable,
+ `"fbd-main"` directory nested somewhere in directories provided to the compiler via custom compiler parameters.

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
Main bus
  width = WIDTH
  const C20 = 20
  Blk block
    const C30 = 30
    type cfg_t(WIDTH = WIDTH) config
      atomic = false
      width = WIDTH
    Cfg16 cfg_t
    Cfg20 cfg_t(C20)
    Cfg30 cfg_t(C30)
```
]
]

The `WIDTH` constant has package scope, and it is visible at the package level, in the `Main` bus instantiation and in the `Blk` block instantiation.
It would also be visible in the `cfg_t` type definition.
However, the `cfg_t` type has the parameter with the same name `WIDTH`.
As a result, only the `WIDTH` parameter is visible within the type definition.
The `WIDTH` parameter has a default value that equals `16`.
This is because at this point the name `WIDTH` denotes the package level `WIDTH` constant.
Type parameters are visible inside the type definition, but not in the type parameter list.
The `Cfg16` is thus a non-atomic config of width `16`, the `Cfg20` is a non-atomic config of width `20` and the `Cfg30` is a non-atomic config of width `30`.
