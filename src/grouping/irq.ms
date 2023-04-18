.NH 2
.XN Irq groups
.LP
The irq groups are used for interrupt grouping.
Grouped irqs have common interrupt consumer signal.
Each irq must belong at most to one group and each irq group must have at least two irqs.
Irqs belonging to the same group might have different values of the producer trigger, but all of them must have the same value for the consumer trigger.
In case of level triggered interrupt consumer the information on the interrupt source can be read from the interrupt group flag register.

Below snippet shows an example of irq group for level sensitive interrupt consumer.
.QP
\fCMain \f[CB]bus\fC
.br
	\f[CB]type\fC irq_t \f[CB]irq\fC; \f[CB]add-enable\fC = \f[CB]true\fC; \f[CB]groups\fC = \f[CI]"IRQ"\fC
.br
	IRQ0 irq_t
.br
	IRQ1 irq_t; \f[CB]clear\fC = \f[CI]"On Read"\fC
.br
	IRQ2 irq_t; \f[CB]in-trigger\fC = \f[CI]"Edge"\fC
.br
	IRQ3 irq_t; \f[CB]in-trigger\fC = \f[CI]"Edge"\fC; \f[CB]clear\fC = \f[CI]"On Read"\fC
.br
.LP
Below picture presents possible logical block diagram of the irq group with level trigger for the interrupt consumer and enable register.
The "Clear On Read" signal is driven on every Flag Register read.
The "Explicit Clear" signal must be driven when requester calls a mean for clearing given interrupt flags.
Probably the easiest form of the "Explicit Clear" implementation is clear on Flag Register write, where the clear bit-mask is the value of the data bus.
The Flag Register is to some extent a virtual register, as it has an address, but it does not have any storage elements.
The flag is stored in the interrupt producer in case of a level triggered producer, or in the Edge Detector in case of an edge triggered producer.
.PS
copy "pic/grid"
copy "pic/irq"

scale = 2.54

h = 1
w = 1.6

c0 = x0
c1 = x15
c2 = x46
c3 = x70
c4 = x85

rm1 = y15
r0 = y0
r1 = ym20
r2 = ym40
r3 = ym60
r4 = ym75

IRQ_BLOCK: box "" ht h*11  wid w*4.7 at (x64, ym25)

# IRQ0
IRQ0: box "IRQ0" "Producer"  ht h  wid w  at (c0, r0)
LVL0: level(c1 - 0.2, r0 + 0.4)
line -> from (c0 + w/2, r0 + h/4) to (c2 - 0.5, r0 + h/4)
AND0: and2(c2 - 0.5, r0 + 0.4)
line from (c2 + 0.1, r0 + 0.1) to (c3 - 0.9, r0 + 0.1); line -> to (c3 - 0.9, rm1 - 0.3)


# IRQ1
IRQ1: box "IRQ1" "Producer"  ht h  wid w  at (c0, r1)
LVL1: level(c1 - 0.2, r1 + 0.4)
line -> from (c0 + w/2, r1 + h/4) to (c2 - 0.5, r1 + h/4)
AND1: and2(c2 - 0.5, r1 + 0.4)
line from (c2 + 0.1, r1 + 0.1) to (c3 - 0.3, r1 + 0.1); line -> to (c3 - 0.3, rm1 - 0.3)

#IRQ2
IRQ2: box "IRQ2" "Producer"  ht h  wid w  at (c0, r2)
EDGE2: edge(c1, r2 + 0.1)
EDGE_DETECTOR2: box "Edge" "Detector"  ht h  wid w  at (c2, r2)
arrow from IRQ2.e to EDGE_DETECTOR2.w
line from EDGE_DETECTOR2.e to (c3 + 0.3, r2); line -> to (c3 + 0.3, rm1 - 0.3)


#IRQ3
IRQ3: box "IRQ3" "Producer"  ht h  wid w  at (c0, r3)
EDGE3: edge(c1, r3 + 0.1)
EDGE_DETECTOR3: box "Edge" "Detector"  ht h  wid w  at (c2, r3)
arrow from IRQ3.e to EDGE_DETECTOR3.w
line from EDGE_DETECTOR3.e to (c3 + 0.9, r3); line -> to (c3 + 0.9, rm1 - 0.3)


ENABLE_REG: box "Enable Register"  ht h*0.6  wid w*1.6  at (c3, r4)
line from (c3 - 0.9, r4 + 0.3) to (c3 - 0.9, r4 + 0.5); line to (c2, r4 + 0.5); arrow to EDGE_DETECTOR3.s
line from (c3 - 0.3, r4 + 0.3) to (c3 - 0.3, r4 + 0.7); line to (c3 - 1.4, r4 + 0.7); line to (c3 - 1.4, r2 - 0.9); line to (c2, r2 - 0.9); arrow to EDGE_DETECTOR2.s
line from (c3 + 0.3, r4 + 0.3) to (c3 + 0.3, r4 + 0.9); line to (c3 - 1.2, r4 + 0.9); line to (c3 - 1.2, r1 - 0.5); line to (c2 - 0.9, r1 - 0.5); line to (c2 - 0.9, r1 - 0.05); arrow to (c2 - 0.5, r1 - 0.05)
line from (c3 + 0.9, r4 + 0.3) to (c3 + 0.9, r4 + 1.1); line to (c3 - 1, r4 + 1.1); line to (c3 - 1, r0 - 0.5); line to (c2 - 0.9, r0 - 0.5); line to (c2 - 0.9, r0 - 0.05); arrow to (c2 - 0.5, r0 - 0.05)


FLAG_REG: box "Flag Register"  ht h*0.6  wid w*1.4  at (c3, rm1)
line from (c3 - 1.12, rm1 + 0.15) to (c2 - 1.7, rm1 + 0.15); line to (c2 - 1.7, r2 + 0.9); line to (c2, r2 + 0.9); arrow to EDGE_DETECTOR2.n
dot(c2 - 1.7, r0 - h/4); arrow from (c2 - 1.7, r0 - h/4) to (c0 + w/2, r0 - h/4)
line from (c3 - 1.12, rm1 - 0.15) to (c2 - 1.4, rm1 - 0.15); line to (c2 - 1.4, r3 + 0.9); line to (c2, r3 + 0.9); arrow to EDGE_DETECTOR3.n
dot(c2 - 1.4, r1 - h/4); arrow from (c2 - 1.4, r1 - h/4) to (c0 + w/2, r1 - h/4)


OR4: or4(c4, r0 + 0.25)
dot(c3 - 0.9, r0 + 0.1); arrow from (c3 - 0.9, r0 + 0.1) to (c3 + 1.59, r0 + 0.1)
dot(c3 - 0.3, r0 - 0.2); arrow from (c3 - 0.3, r0 - 0.2) to (c3 + 1.69, r0 - 0.2)
dot(c3 + 0.3, r0 - 0.5); arrow from (c3 + 0.3, r0 - 0.5) to (c3 + 1.69, r0 - 0.5)
dot(c3 + 0.9, r0 - 0.8); arrow from (c3 + 0.9, r0 - 0.8) to (c3 + 1.59, r0 - 0.8)


arrow from (c4 + 1.2, r0 - 0.35) to (c4 + 3.2, r0 - 0.35)
# Extra text
"IRQ" at (x110, r0 - 0.7)
LVLOUT: level(x107, r0 - 0.2)
"Generated IRQ Group Block" at (x63, y26)
"Clear On Read" at (c2, rm1 - 0.4)
"Explicit Clear" at (c2, rm1 + 0.4)
.PE
