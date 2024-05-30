== Return

The `return` functionality is an inner functionality of the `proc` and `stream` functionalities.
It represents data returned by a procedure or streamed by an upstream.

The `return` functionality has following properties:

*`width`*` integer (bus width) [definitive]`
#pad(left: 1em)[
The `width` property defines the bit width of the return.
]

The following example presents the definition of a procedure returning four element byte array, and a single bit flag indicating whether the data is valid.

#line(length: 100%)
```fbd
Read_Data proc
  data [4]return; width = 8
  valid return; width = 1
```
#line(length: 100%)
