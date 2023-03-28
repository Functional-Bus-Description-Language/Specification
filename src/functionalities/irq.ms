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
L: box "Generated Logic"  ht h  wid w*1.3  at (x45, y0)
C: box "Irq Consumer"     ht h  wid w*1.1  at (x90, y0)
Edge1: edge(x16, y1)
Edge2: edge(x65, y1)

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
L: box "Generated Logic"  ht h  wid w*1.3  at (x44, y0)
C: box "Irq Consumer"     ht h  wid w*1.1  at (x91, y0)
Edge: edge(x16, y1)
Level: level(x65, y1)
"Clear On Read / Explicit Clear" at (x67, ym8)

line -> from P.e to L.w
line -> from L.e to C.w
line from C.s to (x91, ym10); line to (x44, ym10); line -> to L.s
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
L: box "Generated Logic"  ht h  wid w*1.3  at (x45, y0)
C: box "Irq Consumer"     ht h  wid w*1.1  at (x90, y0)
Level: level(x16, y3)
Edge: edge(x65, y1)
"Auto Clear" at (x22, ym5)

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
L: box "Generated Logic"  ht h  wid w*1.3  at (x44, y0)
C: box "Irq Consumer"     ht h  wid w*1.1  at (x91, y0)
Level0: level(x16, y3)
Level1: level(x65, y1)
"Clear On Read / Explicit Clear" at (x67, ym8)
"Clear" at (x22, ym5)

line -> from L.e to C.w
line -> from 1/2 of the way between P.ne and P.e to 1/2 of the way between L.nw and L.w
line <- from 1/2 of the way between P.se and P.e to 1/2 of the way between L.sw and L.w
line from C.s to (x91, ym10); line to (x44, ym10); line -> to L.s
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
.IP "\f[CB]groups\f[CW] string | [string] (None\fC)\f[]"
The groups property specifies the group for irq.
Each irq must belong at most to one group.
Irq groups are described in irq grouping subsection.
.IP "\f[CB]trigger\f[CW] string (\f[CI]""Level - Level""\fC)\f[]"
The trigger property declares the interrupt producer and interrupt consumer type of trigger.
Valid values are: \f[CI]"Edge - Edge"\fR, \f[CI]"Edge - Level"\fR, \f[CI]"Level - Edge"\fR, \f[CI]"Level - Level"\fR.
It is up to the user to make sure declared triggers are coherent with the actual producer and consumer requirements.
Some types of mismatches may lead to incorrect behavior.
