.NH 2
.XN Proc
.LP
The \fCproc\fR functionality represents a procedure called by the requester and carried out by the provider.
The \fCproc\fR functionality might contain \fCparam\fR and \fCreturn\fR functionalities.
Params are procedure parameters and returns represent data returned from the procedure.
.LP
The \fCproc\fR has associated signals at the provider side, the \fCcall\fR signal and the \fCexit\fR signal.
The call signal must be driven active for one clock cycle after all registers storing the parameters have been written.
The exit signal must be driven active for one clock cycle after all registers storing the returns have been read.
An empty \fCproc\fR (proc without params and returns) by default has only the call signal.
However, if an empty \fCproc\fR has the delay property set, then it has both the call signal and the exit signal.
A \fCproc\fR having only parameters has by default only the call signal.
However, if a proc having only parameters has the delay property set, then it also has the exit signal.
A \fCproc\fR having only returns has by default only the exit signal.
However, if a \fCproc\fR having only returns has the delay property set, then it also has the call signal.
The existence or absence of call and exit signals is summarized in the below table.
.TS
tab(;) center;
c s s s s
c | | c | c | c | c.
Proc call and exit signals occurrence
_
\fBDelay Set;Empty;Only Params;Only Returns;Params & Returns\fR
_
No;call;call;exit;call & exit
Yes;call & exit;call & exit;call & exit;call & exit
.TE
.LP
The \fCproc\fR functionality has following properties:
.IP "\f[CB]delay\f[CW] time (None)\f[]" 0.2i
The \fCdelay\fR property defines the time delay between parameters write end and returns read start.
.LP
The code generated for the requester must provide a mean for calling the procedure.
