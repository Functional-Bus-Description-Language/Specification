.NH 2
.XN Positive logic
.LP
The FBDL uses only positive logic.
An active level in positive logic is high level (binary 1), and active edge is rising edge (transition from low level to high level, from binary 0 to binary 1).
It does not mean that FBDL cannot be used with external components using negative logic.
To connect external negative logic components to the generated FBDL positive logic components one shall negate the signals at the interface connection level.
Supporting both positive and negative logic would unnecessarily complex the language and would create second way for solving the same problem making the set of possible solutions non-orthogonal.
