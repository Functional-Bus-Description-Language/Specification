.NH 2
.XN Registerification order
.LP
Groups must be registerified in the order they appear in the groups lists.
A compiler must issue an error if the order of any groups is not the same in all groups lists.
If the order is not unequivocal, then the compiler is free to choose the order.
However, as the registerification results have to be deterministic and reproducible for a particular compiler, the order criterion has to be fixed in case of ambiguous order of groups.
The most natural criteria are probably:
.BL
Alphabetical order.
Groups with ambiguous order are sorted alphabetically before registerification.
.BL
Occurrence order.
Groups with ambiguous order are registerified in parsing order.
For example, if the order of groups \f[CI]"b"\fR and \f[CI]"a"\fR is ambiguous, and group \f[CI]"b"\fR first occurrence is in line number 80, and group \f[CI]"a"\fR first occurrence is in line number 120, then group \f[CI]"b"\fR is registerified as the first one.

.LP
The order of groups might be used to prioritize the groups, so that access to some groups is more efficient than to the other groups.
The below listing serves as an example of groups order used for optimizing access to a particular group.
.QP
\fCMain \f[CB]bus\fC
.br
	C1 \f[CB]config\fC; \f[CB]width\fC = 20; \f[CB]groups\fC = ["\f[CI]a\fC"]
.br
	C2 \f[CB]config\fC; \f[CB]width\fC = 12; \f[CB]groups\fC = ["\f[CI]a\fC", "\f[CI]b\fC"]
.br
	C3 \f[CB]config\fC; \f[CB]width\fC = 20; \f[CB]groups\fC = ["\f[CI]b\fC"]
.LP
As group \f[CI]"a"\fR has higher priority than group \f[CI]"b"\fR (its index is lower in the groups list for functionality \fCC2\fR), access to the group \f[CI]"a"\fR will be more efficient, as functionalities \fCC1\fR and \fCC2\fR will be placed in the same register.
A possible arrangement is presented in the below snippet.
.QP
\fCNth register     Nth + 1 register
.br
-------------  ----------------------
.br
|| C1 | C2 ||  || C3 | 12 bits gap ||
.br
-------------  ----------------------
\fR
.LP
If the order of the groups in the groups list for functionality \fCC2\fR was reverse, then the access to the group \f[CI]"b"\fR would be more efficient.
A possible arrangement of functionalities in such a case could look as follows.
.QP
\fCNth register     Nth + 1 register
.br
-------------  ----------------------
.br
|| C2 | C3 ||  || C1 | 12 bits gap ||
.br
-------------  ----------------------
\fR
.LP
The below listing presents a description of groups with ambiguous order.
.QP
\fCMain \f[CB]bus\fC
.br
	C1 \f[CB]config\fC; \f[CB]width\fC = 10; \f[CB]groups\fC = [\f[CI]"a"\fC, \f[CI]"b"\fC, \f[CI]"c"\fC]
.br
	C2 \f[CB]config\fC; \f[CB]width\fC = 10; \f[CB]groups\fC = [\f[CI]"a"\fC, \f[CI]"d"\fC, \f[CI]"c"\fC]
.br
	C3 \f[CB]config\fC; \f[CB]width\fC = 10; \f[CB]groups\fC = [\f[CI]"a"\fC, \f[CI]"b"\fC]
.br
	C4 \f[CB]config\fC; \f[CB]width\fC = 10; \f[CB]groups\fC = [\f[CI]"a"\fC, \f[CI]"d"\fC]
.br
.LP
The order of groups \f[CI]"b"\fR and \f[CI]"d"\fR is not unequivocal.
However, whether group \f[CI]"b"\fR is registerified before the group \f[CI]"d"\fR is not even important in this case, as the optimal structure is determined by three facts:
.BL
both groups \f[CI]"b"\fR and \f[CI]"d"\fR are subgroups of group \f[CI]"a"\fR,
.BL
the intersection of groups \f[CI]"b"\fR and \f[CI]"d"\fR is an empty group,
.BL
both groups \f[CI]"b"\fR and \f[CI]"d"\fR have higher priority than group \f[CI]"c"\fR.
.LP
Possible arrangement of the functionalities is presented in the below snippet.
.QP
\fC       Nth register              Nth + 1 register
.br
--------------------------  --------------------------
.br
|| C1 | C3 | 2 bits gap ||  || C2 | C4 | 2 bits gap ||
.br
--------------------------  --------------------------
\fR
