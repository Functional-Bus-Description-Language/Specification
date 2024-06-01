== Proc

The proc functionality represents a procedure called by the requester and carried out by the provider.
The proc functionality might contain param and return functionalities.
Params are procedure parameters and returns represent data returned from the procedure.

The proc has associated signals at the provider side, the call signal and the exit signal.
The call signal must be driven active for one clock cycle after all registers storing the parameters have been written.
The exit signal must be driven active for one clock cycle after all registers storing the returns have been read.
An empty proc (proc without params and returns) by default has only the call signal.
However, if an empty proc has the delay property set, then it has both the call signal and the exit signal.
A proc having only parameters has by default only the call signal.
However, if a proc having only parameters has the delay property set, then it also has the exit signal.
A proc having only returns has by default only the exit signal.
However, if a proc having only returns has the delay property set, then it also has the call signal.
The existence or absence of call and exit signals is summarized in the below table.

#set align(center)
#block(breakable: false)[
#table(
  stroke: none,
  align: center,
  columns: (2cm, 3.5cm, 3.5cm, 3.5cm, 3.5cm),
  table.vline(x: 1, start: 1),
  table.vline(x: 2, start: 1, stroke: (thickness: 0.1pt)),
  table.vline(x: 3, start: 1, stroke: (thickness: 0.1pt)),
  table.vline(x: 4, start: 1, stroke: (thickness: 0.1pt)),
  table.cell(colspan: 5)[Proc call and exit signals occurrence],
  table.hline(),
  [*Delay Set*], [*Empty*], [*Only Params*], [*Only Returns*], [*Params & Returns*],
  table.hline(),
  [No], [call], [call], [exit], [call & exit],
  table.hline(stroke: (thickness: 0.1pt)),
  [Yes], [call & exit], [call & exit], [call & exit], [call & exit],
)
]
#set align(left)

The proc functionality has following properties:

*`delay`*` time (None) {definitive}`
#pad(left: 1em)[
The delay property defines the time delay between parameters write end and returns read start.
]

The code generated for the requester must provide a mean for calling the procedure.
