.NH 2
.XN Stream
.LP
The \fCstream\fR functionality represents a stream of data to a provider (downstream), or a stream of data from a provider (upstream).
An empty stream (stream without any \fCparam\fR or \fCreturn\fR) is always a downstream.
It is useful for triggering cyclic action with constant time interval.
A downstream must not have any \fCreturn\fR.
An upstream shall not have any \fCparam\fR, and must have at least one \fCreturn\fR.
.LP
The \fCstream\fR functionality is very similar to the \fCproc\fR functionality, but they are not the same.
There are two main differences.
The first one is that the \fCstream\fR must not contain both \fCparam\fR and \fCreturn\fR.
The second one is that the code for the stream, generated for the requester, shall take into account the fact that an access to the \fCstream\fR is multiple and an access to the \fCproc\fR is single.
For example lets consider the following bus description:
.QP
\fCMain \f[CB]bus\fC
.br
	P \f[CB]proc\fC
.br
		p \f[CB]param\fC
.br
	S \f[CB]stream\fC
.br
		p \f[CB]param\fC
.LP
The code generated for the requester, implemented in the C language, might include following function prototypes:
.QP
\f[CB]int\fC Main_P(\f[CB]const uint32_t\fC p);
.br
\f[CB]int\fC Main_S(\f[CB]const uint32_t\fC * p, \f[CB]size_t\fC count);
.LP
The \fCstream\fR functionality has following properties.
.IP "\f[CB]delay\f[CW] time (None)\f[]" 0.2i
The \fCdelay\fR property defines the time delay between writing/reading consecutive datasets for a downstream/upstream.
