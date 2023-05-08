.NH 2
.XN Type extending
.LP
The type extending allows extending any custom defined type, either by instantiation or by defining a new type.
This is mainly, but not only, useful when there are similar blocks with only slightly different set of functionalities.
.LP
Example:
.QP
\f[CB]type\fC blk_common_t \f[CB]block\fC
.br
	C1 \f[CB]config\fC
.br
	M1 \f[CB]mask\fC
.br
	S1 \f[CB]status\fC
.br
Main \f[CB]bus\fC
.br
	Blk_C blk_common_t
.br
		C2 \f[CB]config\fC
.br
	Blk_M blk_common_t
.br
		M2 \f[CB]mask\fC
.br
	Blk_S blk_common_t
.br
		S2 \f[CB]status\fC
.
.LP
This description is equivalent to the following description:
.QP
\f[CB]type\fC blk_common_t \f[CB]block\fC
.br
	C1 \f[CB]config\fC
.br
	M1 \f[CB]mask\fC
.br
	S1 \f[CB]status\fC
.br
\f[CB]type\fC blk_C_t blk_common_t
.br
	C2 \f[CB]config\fC
.br
\f[CB]type\fC blk_M_t blk_common_t
.br
	M2 \f[CB]mask\fC
.br
\f[CB]type\fC blk_S_t blk_common_t
.br
	S2 \f[CB]status\fC
.br
Main \f[CB]bus\fC
.br
	Blk_C blk_C_t
.br
	Blk_M blk_M_t
.br
	Blk_S blk_S_t
.
.LP
The type nesting has no depth limit.
However, no property already set in one of the ancestor types can be overwritten.
Also no symbol identifier defined in one of the ancestor types can be redefined.
