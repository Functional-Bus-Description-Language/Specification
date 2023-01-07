.NH 2
.XN Stream
.LP
The stream functionality represents a stream of data to a provider (downstream), or a stream of data from a provider (upstream).
An empty stream (stream without any params or returns) is always a downstream.
It is useful for triggering cyclic action with constant time interval.
A downstream must not have any returns.
An upstream shall not have any params, and must have at least one return.
.LP
The stream property is very similar to the proc property, but they are not the same.
There are two main differences.
The first one is that the stream must not containt both params and returns.
The second one is that the code for the stream, generated for the requester, shall take into account the fact that an access to the stream is multiple and an access to the proc is single.
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
\f[CB]int\fC vfbdb_Main_P(\f[CB]const uint32_t\fC p);
.br
\f[CB]int\fC vfbdb_Main_S(\f[CB]const uint32_t\fC * p, \f[CB]size_t\fC count);
.LP
The stream functionality has following properties.
