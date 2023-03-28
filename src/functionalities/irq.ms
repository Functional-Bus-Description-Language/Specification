.NH 2
.XN Irq
.LP
The irq functionality represents an interrupt.
The irq functionality allows for automatic connection of following interrupt producers and consumers:
.IP 1) 3
edge producer and edge sensitive consumer,
.PS
copy "pic/grid"
copy "pic/irq"

scale = 2.54

h = 0.6
w = 2.1

P: box "Irq Producer"     ht h  wid w      at (x0 , y0)
L: box "Generated Logic"  ht h  wid w*1.3  at (x17, y0)
C: box "Irq Consumer"     ht h  wid w*1.1  at (x34, y0)
Edge1: edge(x6, y1)
Edge2: edge(x24, y1)

line -> from P.e to L.w
line -> from L.e to C.w
.PE
.IP 2)
edge producer and level sensitive consumer,
.PS
copy "pic/grid"
copy "pic/irq"

scale = 2.54

h = 0.6
w = 2.1

P: box "Irq Producer"     ht h  wid w      at (x0 , y0)
L: box "Generated Logic"  ht h  wid w*1.3  at (x17, y0)
C: box "Irq Consumer"     ht h  wid w*1.1  at (x35, y0)
Edge: edge(x6, y1)
Level: level(x24, y1)
"Clear On Read / Explicit Clear" at (x26, ym3)

line -> from P.e to L.w
line -> from L.e to C.w
line from C.s to (x35, ym4); line to (x17, ym4); line -> to L.s
.PE
.IP 3)
level producer and edge sensitive consumer,
.PS
copy "pic/grid"
copy "pic/irq"

scale = 2.54

h = 0.6
w = 2.1

P: box "Irq Producer"     ht h  wid w      at (x0 , y0)
L: box "Generated Logic"  ht h  wid w*1.3  at (x17, y0)
C: box "Irq Consumer"     ht h  wid w*1.1  at (x35, y0)
Level: level(x6, (y1+y2)/2)
Edge: edge(x24, y1)
"Auto Clear" at (x8, ym2)

line -> from L.e to C.w

line -> from 1/2 of the way between P.ne and P.e to 1/2 of the way between L.nw and L.w
line <- from 1/2 of the way between P.se and P.e to 1/2 of the way between L.sw and L.w
.PE
.IP 4)
level producer and level sensitive consumer.
.PS
copy "pic/grid"
copy "pic/irq"

scale = 2.54

h = 0.6
w = 2.1

P: box "Irq Producer"     ht h  wid w      at (x0 , y0)
L: box "Generated Logic"  ht h  wid w*1.3  at (x17, y0)
C: box "Irq Consumer"     ht h  wid w*1.1  at (x35, y0)
Edge: edge(x6, (y1+y2)/2)
Level: level(x24, y1)
"Clear On Read / Explicit Clear" at (x26, ym3)
"Clear" at (x8, ym2)

line -> from L.e to C.w
line -> from 1/2 of the way between P.ne and P.e to 1/2 of the way between L.nw and L.w
line <- from 1/2 of the way between P.se and P.e to 1/2 of the way between L.sw and L.w
line from C.s to (x35, ym4); line to (x17, ym4); line -> to L.s
.PE
.
.LP
The irq functionality has following properties:
.IP "\f[CB]clear\f[CW] string (\f[CI]""Explicit""\fC)\f[]" 0.2i
The clear property defines how particular interrupt flag is cleared.
The clear property is valid only in case of level triggered interrupt consumer.
If clear property is set for edge triggered interrupt consumer a compiler shall shall report an error.
Valid values are \f[CI]"Explicit"\fR and \f[CI]"On Read"\fR.
The \f[CI]"Explicit"\fR clear requires compiler to generate a method that must be explicitly called to clear the interrupt flag.
The \f[CI]"On Read"\fR clear requires the provider to clear the interrupt flag on each interrupt flag read.
.IP "\f[CB]trigger\f[CW] string (\f[CI]""Level - Level""\fC)\f[]"
The trigger property declares the interrupt producer and interrupt consumer type of trigger.
Valid values are: \f[CI]"Edge - Edge"\fR, \f[CI]"Edge - Level"\fR, \f[CI]"Level - Edge"\fR, \f[CI]"Level - Level"\fR.
It is up to the user to make sure declared triggers are coherent with the actual producer and consumer requirements.
Some types of mismatches may lead to incorrect behavior.
