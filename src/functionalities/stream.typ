== Stream

The stream functionality represents a stream of data to a provider (downstream), or a stream of data from a provider (upstream).
An empty stream (stream without any param or return) is always a downstream.
It is useful for triggering cyclic action with constant time interval.
A downstream must not have any return.
An upstream shall not have any param, and must have at least one return.

The stream functionality is very similar to the proc functionality, but they are not the same.
There are two main differences.
The first one is that the stream must not contain both param and return.
The second one is that the code for the stream, generated for the requester, shall take into account the fact that access to the stream is multiple and access to the proc is single.
For example, lets consider the following bus description:

#block(breakable:false)[
#pad(left: 1em)[
```fbd
main bus
  p proc
    par param
  s stream
    par param
```
]
]

The code generated for the requester, implemented in the C language, might include following function prototypes:

#block(breakable:false)[
#pad(left: 1em)[
```
int main_p(const uint32_t par);
int main_s(const uint32_t * par, size_t count);
```
]
]

The stream has associated strobe signal at the provider side.
The strobe signal must be driven active for one clock cycle after all registers storing the parameters of a downstream have been written.
It also must be driven active for one clock cycle after all registers storing the returns of an upstream have been read.

The stream functionality has following properties.

*`delay`*` time (None) {definitive}`
#pad(left: 1em)[
The delay property defines the time delay between writing/reading consecutive datasets for a downstream/upstream.
]
