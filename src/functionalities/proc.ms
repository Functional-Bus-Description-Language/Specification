.NH 2
.XN Proc
.LP
The proc functionality represents a procedure called by the requester and carried out at the provider.
The proc functionality might contain param and return functionalities.
Params are procedure parameters and returns represent data returned from the procedure.
.LP
The proc has associated signals at the provider side, the \fCcall\fR signal and the \fCexit\fR signal.
The call signal must be driven active for one clock cycle after all registers storing the parameters have been written.
The exit signal must be driven active for one clock cycle after all registers storing the returns have been read.
An empty proc (proc without params and returns) by default has only the call signal.
However, if an empty proc has the delay property set, then it has both, the call signal and the exit signal.
A proc having only parameters has by default only the call signal.
However, if a proc having only parameters has the delay property set, then it also has the exit signal.
A proc having only returns has by default only the exit signal.
However, if a proc having only returns has the delay property set, then it also has the call signal.
Existence or absence of call and exit signals is summarized in below table.
.TS
tab(;) center;
c s s s s
c | | c | c | c | c.
Proc call and exit signals occurrence.
_
Delay Set;Empty;Only Params;Only Returns;Params & Returns
_
No;call;call;exit;call & exit
Yes;call & exit;call & exit;call & exit;call & exit
.TE
.LP
The proc functionality has following properties:
.IP "\f[CB]delay\f[CW] time (None)\f[]" 0.2i
The delay property defines the time delay between parameters write end and returns read start.
.LP
The code generated for the requester must provide method for calling the procedure.
