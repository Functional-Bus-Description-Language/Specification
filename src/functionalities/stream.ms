.NH 2
.XN Stream
.LP
The stream functionality represents a stream of data to a provider (downstream), or a stream of data from a provider (upstream).
An empty stream (stream without any params or returns) is always a downstream.
It is useful for triggering cyclic action with constant time interval.
A downstream must not have any returns.
An upstream shall not have any params, and must have at least one return.
.LP
The stream functionality has following properties.
