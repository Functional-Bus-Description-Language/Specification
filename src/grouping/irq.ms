.NH 2
.XN Irq groups
.LP
The irq groups are used for interrupt grouping.
Grouped irqs have common interrupt consumer signal.
Each irq must belong at most to one group and each irq group must have at least two irqs.
Irqs belonging to the same group might have different values of the producer trigger, but all of them must have the same value for the consumer trigger.
In case of level triggered interrupt consumer the information on the interrupt source can be read from the interrupt group flag register.
Below picture presents possible logical block diagram of irq group with level trigger for the interrupt consumer and enable register.
.PS
copy "pic/grid"
copy "pic/irq"

scale = 2.54

h = 0.6
w = 1


IRQ0: box "IRQ0"  ht h  wid w  at (x0, y0)
IRQ1: box "IRQ1"  ht h  wid w  at (x0, ym15)
IRQ2: box "IRQ2"  ht h  wid w  at (x0, ym30)

AND0: and2(x30, y3)
AND1: and2(x30, ym12)

OR3: or3(x70, ym10)

IRQ_BLOCK: box "" ht h*13  wid w*6.5 at (x51, ym11)

ENABLE_REG: box "Enable Register"  ht h  wid w*2.4  at (x50, ym45)
FLAG_REG:   box "Flag Register"    ht h  wid w*2.4  at (x50, y15)

LVL0: level(x7, y3)
LVL0: level(x7, ym12)

EDGE0: edge(x8, ym29)
EDGE_DETECTOR0: box "Edge" "Detector"  ht h*1.6  wid w*1.6  at (x31, ym30)

# IRQ0 line
line -> from 1/2 of the way between IRQ0.ne and IRQ0.e to (x30, (y1+y2)/2)
line from (x36, y0) to (x43, y0); arrow up 1.2
dot(x43, y0)
line from(x43, y0) to (x60, y0); line to (x60, ym12); arrow right 1.1
line from (x57, ym42) to (x57, ym34); line to (x45, ym34); line to (x45, ym5); line to (x26, ym5); line to (x26, ym1 - 0.05); arrow to (x30, ym1 - 0.05)
line from 1/2 of the way between FLAG_REG.nw and FLAG_REG.w to (x21, y16 + 0.05); line down to(x21, ym1 - 0.05); arrow to (x5, ym1 - 0.05)

# IRQ1 line
line -> from 1/2 of the way between IRQ1.ne and IRQ1.e to (x30, (ym13+ym14)/2)
line from (x36, ym15) to (x50, ym15); arrow up 2.7
arrow from (x50, ym15) to (x71+0.07, ym15)
dot(x50, ym15)
line from ENABLE_REG.n to (x50, ym36); line to (x43, ym36); line to (x43, ym20); line to (x26, ym20); line to (x26, ym16 - 0.05); arrow to (x30, ym16 - 0.05)
line from 1/2 of the way between FLAG_REG.sw and FLAG_REG.w to (x23, y13 + 0.05); line down to(x23, ym16 - 0.05); arrow to (x5, ym16 - 0.05)

# IRQ2 lines
arrow from IRQ2.e to EDGE_DETECTOR0.w
line from (x39, ym30) to (x57, ym30); arrow up 4.2
line from (x43, ym42) to (x43, ym39); line left 1.2; arrow to EDGE_DETECTOR0.s
dot(x57, ym18)
arrow from (x57, ym18) right 1.4

# Extra text
"\f[CB]clear\fC = \f[CI]\"On Read\"\fR" at (xm25, y0)
"\f[CB]clear\fC = \f[CI]\"Explicit\"\fR" at (xm25, ym15)
"IRQ" at (x90, ym12)

arrow from (x80, ym15) to (x90, ym15)
"Generated IRQ Group Block" at (x61, y24)
"Clear" "On Read" at (x29, y21)
"Explicit" "Clear" at (x31, y9)
.PE
