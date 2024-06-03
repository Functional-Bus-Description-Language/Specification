== Param

The param functionality is an inner functionality of the proc and stream functionalities.
It represents a data fed to a procedure or streamed by a downstream.

The param functionality has following properties:

*`range`*` range | [range] (None) {definitive}`
#pad(left: 1em)[
The range property defines the range of valid values.
The range property on param behaves exactly the same as the range property on config.
]

*`width`*` integer (bus width) {definitive}`
#pad(left: 1em)[
The width property defines the bit width of the param.
]

The following example presents the definition of a downstream with three parameters.

#block(breakable: false)[
#pad(left: 1em)[
```fbd
Sum_Reduce stream
  type param_t param; width = 16
  a param_t
  b param_t
  c param_t
```
]
]
