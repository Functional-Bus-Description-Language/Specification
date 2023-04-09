.NH 2
.XN Param and return groups
.LP
Param and return groups are used to group \fCproc\fR or \fCstream\fR parameters or returns.
Such a kind of grouping may be necessary for performance optimizations, as the requester may store parameters or returns in a single list, or in multiple distinct lists.
Param and return groups help to avoid data reshuffling before or after the access.
Param and return groups are independent.
Below snippet presents valid description with single \fCproc\fR with one param and one return group.
.QP
\fCMain \f[CB]bus\fC
.br
	P \f[CB]proc\fC
.br
		p1 \f[CB]param\fC;  groups = \f[CI]"grp"\fC
.br
		p2 \f[CB]param\fC;  groups = \f[CI]"grp"\fC
.br
		r1 \f[CB]return\fC; groups = \f[CI]"grp"\fC
.br
		r2 \f[CB]return\fC; groups = \f[CI]"grp"\fC
.LP
Param and return groups may contain subgroups.
Single param or return can belong to groups which sum is empty or is equal to one of the groups.
Below snippet presents examples of two invalid and two valid parameters grouping.
.QP
\fCMain \f[CB]bus\fC
.br
	\f[CI]# Param p2 belongs to group "b" and "c".
.br
	# However, neither "b" is subgroup of "c"
.br
	# nor "c" is subgroup of "b".
.br
	\fCInvalid1 \f[CB]proc\fC
.br
		p1 \f[CB]param\fC; groups = [\f[CI]"a"\fC, \f[CI]"b"\fC]
.br
		p2 \f[CB]param\fC; groups = [\f[CI]"a"\fC, \f[CI]"b"\fC, \f[CI]"c"\fC]
.br
		p3 \f[CB]param\fC; groups = [\f[CI]"a"\fC, \f[CI]"c"\fC]
.br
 
.br
	\fCInvalid2 \f[CB]proc\fC
.br
		p1 \f[CB]param\fC; groups = \f[CI]"a"\fC
.br
		p2 \f[CB]param\fC; groups = [\f[CI]"a"\fC, \f[CI]"b"\fC]
.br
		p3 \f[CB]param\fC; groups = \f[CI]"b"\fC
.br
 
.br
	\fCValid1 \f[CB]proc\fC
.br
		p1 \f[CB]param\fC; groups = \f[CI]"a"\fC
.br
		p2 \f[CB]param\fC; groups = \f[CI]"a"\fC
.br
		p3 \f[CB]param\fC; groups = \f[CI]"b"\fC
.br
		p4 \f[CB]param\fC; groups = \f[CI]"b"\fC
.br
 
.br
	\fCValid2 \f[CB]proc\fC
.br
		p1 \f[CB]param\fC; groups = [\f[CI]"a"\fC, \f[CI]"b"\fC, \f[CI]"c"\fC]
.br
		p2 \f[CB]param\fC; groups = [\f[CI]"a"\fC, \f[CI]"b"\fC, \f[CI]"c"\fC]
.br
		p3 \f[CB]param\fC; groups = [\f[CI]"a"\fC, \f[CI]"b"\fC]
.br
		p4 \f[CB]param\fC; groups = \f[CI]"a"\fC
