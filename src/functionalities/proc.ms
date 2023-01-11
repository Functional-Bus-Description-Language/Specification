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
An empty proc (proc without params and returns) has only the call signal.
A proc having only parameters has only the call signal.
.B "TODO: With proc having only returns is not yet clear what is the best approach."
.LP
The proc functionality has following properties:
.LP
The code generated for the requester must provide method for calling the procedure.
