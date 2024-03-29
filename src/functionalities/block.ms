.NH 2
.XN Block
.LP
The \fCblock\fR functionality is used to logically group or encapsulate functionalities.
The \fCblock\fR is usually used to separate functionalities related to particular peripherals such as UART, I2C transceivers, timers, ADCs, DACs etc.
The block might also be used to limit the access for particular provider to only a subset of functionalities.
.LP
The \fCblock\fR functionality has following properties:
.IP "\f[CB]masters\f[CW] integer (1)\f[]" 0.2i
The \fCmasters\fR property defines the number of \fCblock\fR masters.
.IP "\f[CB]reset\f[CW] string (None)\f[]"
The \fCreset\fR property defines the \fCblock\fR reset type.
By default the \fCblock\fR has no reset.
Valid values of the \fCreset\fR property are \f[CI]"Sync"\fR for synchronous reset and \f[CI]"Async"\fR for asynchronous reset.
.LP
The following example presents how to limit the scope of access for particular requester.
.QP
\fCMain \f[CB]bus\fC
.br
	C \f[CB]config\fC
.br
	Blk \f[CB]block\fC
.br
		\f[CB]masters\fC = 2
.br
		S \f[CB]status\fC
.LP
The logical connection of the system components may look as follows:
.PS
scale = 1
c0 = 0
c1 = 1.55
c2 = 2.9
c3 = 4.3

r0 = 0
r1 = -0.7
r2 = -1.35
r3 = -2.2

R1: box "Requester 1" ht 0.3 wid 1 at (c0, r1)
M1: box "Master 1" ht 0.3 wid 1 at (c1, r1)
C1: box "Crossbar 1" ht 0.3 wid 1 at (c2, r1)
S1: box "Slave 1" "" "" "" ht 0.7 wid 0.8 at (c2, r0 + 0.05)
C: box "C" ht 0.3 wid 0.5 at (c2, r0)
C2: box "Crossbar 2" ht 0.3 wid 1 at (c3, r1)
S: box "S" ht 0.3 wid 0.5 at (c3, r0)
S2: box "Slave 2" "" "" "" ht 0.7 wid 0.8 at (c3, r0 + 0.05)
M2: box "Master 2" ht 0.3 wid 1 at (c3, r2)
R2: box "Requester 2" ht 0.3 wid 1 at (c3, r3)
P: box "Provider" "" "" "" "" "" "" "" "" "" "" "" "" "" "" ht 2.6 wid 4.25 at (c2, r1 + 0.2)
B: box "Blk" "" "" "" "" "" "" "" "" "" "" "" "" "" ht 2.4 wid 1.3 at (c3 - 0.05, r1 + 0.17)

line <-> from R1.e to M1.w
line <-> from M1.e to C1.w
line <-> from C1.n to C.s
line <-> from C1.e to C2.w
line <- from C2.n to S.s
line <-> from M2.n to C2.s
line <-> from R2.n to M2.s
.PE
.LP
The requester number 1 can acces both config \fCC\fR and status \fCS\fR.
However, the requester number 2 can access only the status \fCS\fR.
